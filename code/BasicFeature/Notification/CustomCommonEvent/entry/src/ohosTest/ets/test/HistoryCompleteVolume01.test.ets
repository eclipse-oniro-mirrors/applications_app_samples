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
import { arrExact } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function historyCompleteVolume01Test(): void {
  describe('HistoryCompleteVolume01Test', () => {

    /**
     * @tc.name   testHistoryCompleteVolume010001
     * @tc.number SUB_CCE_HISTCMP_01_0001
     * @tc.desc   记录 "[]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010001 begin');
      const detail: Array<string> = arrExact('');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010001 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010002
     * @tc.number SUB_CCE_HISTCMP_01_0002
     * @tc.desc   记录 "[\"c10\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010002 begin');
      const detail: Array<string> = arrExact('c10');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010002 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010003
     * @tc.number SUB_CCE_HISTCMP_01_0003
     * @tc.desc   记录 "[\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010003 begin');
      const detail: Array<string> = arrExact('~');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010003 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010004
     * @tc.number SUB_CCE_HISTCMP_01_0004
     * @tc.desc   记录 "[\"c20\",\"c21\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010004 begin');
      const detail: Array<string> = arrExact('c20|c21');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010004 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010005
     * @tc.number SUB_CCE_HISTCMP_01_0005
     * @tc.desc   记录 "[\"\",\"c21\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010005 begin');
      const detail: Array<string> = arrExact('|c21');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010005 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010006
     * @tc.number SUB_CCE_HISTCMP_01_0006
     * @tc.desc   记录 "[\"c20\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010006 begin');
      const detail: Array<string> = arrExact('c20|');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010006 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010007
     * @tc.number SUB_CCE_HISTCMP_01_0007
     * @tc.desc   记录 "[\"\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010007 begin');
      const detail: Array<string> = arrExact('|');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010007 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010008
     * @tc.number SUB_CCE_HISTCMP_01_0008
     * @tc.desc   记录 "[\"c30\",\"c31\",\"c32\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010008 begin');
      const detail: Array<string> = arrExact('c30|c31|c32');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010008 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010009
     * @tc.number SUB_CCE_HISTCMP_01_0009
     * @tc.desc   记录 "[\"\",\"c31\",\"c32\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010009 begin');
      const detail: Array<string> = arrExact('|c31|c32');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010009 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010010
     * @tc.number SUB_CCE_HISTCMP_01_0010
     * @tc.desc   记录 "[\"c30\",\"\",\"c32\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010010 begin');
      const detail: Array<string> = arrExact('c30||c32');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010010 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010011
     * @tc.number SUB_CCE_HISTCMP_01_0011
     * @tc.desc   记录 "[\"\",\"\",\"c32\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010011 begin');
      const detail: Array<string> = arrExact('||c32');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010011 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010012
     * @tc.number SUB_CCE_HISTCMP_01_0012
     * @tc.desc   记录 "[\"c30\",\"c31\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010012 begin');
      const detail: Array<string> = arrExact('c30|c31|');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010012 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010013
     * @tc.number SUB_CCE_HISTCMP_01_0013
     * @tc.desc   记录 "[\"\",\"c31\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010013 begin');
      const detail: Array<string> = arrExact('|c31|');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010013 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010014
     * @tc.number SUB_CCE_HISTCMP_01_0014
     * @tc.desc   记录 "[\"c30\",\"\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010014 begin');
      const detail: Array<string> = arrExact('c30||');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010014 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010015
     * @tc.number SUB_CCE_HISTCMP_01_0015
     * @tc.desc   记录 "[\"\",\"\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010015 begin');
      const detail: Array<string> = arrExact('||');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010015 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010016
     * @tc.number SUB_CCE_HISTCMP_01_0016
     * @tc.desc   记录 "[\"c40\",\"c41\",\"c42\",\"c43\"]" 的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010016 begin');
      const detail: Array<string> = arrExact('c40|c41|c42|c43');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('true'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(4));
      expect(String(result).length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010016 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010017
     * @tc.number SUB_CCE_HISTCMP_01_0017
     * @tc.desc   记录 "[\"\",\"c41\",\"c42\",\"c43\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010017 begin');
      const detail: Array<string> = arrExact('|c41|c42|c43');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010017 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010018
     * @tc.number SUB_CCE_HISTCMP_01_0018
     * @tc.desc   记录 "[\"c40\",\"\",\"c42\",\"c43\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010018 begin');
      const detail: Array<string> = arrExact('c40||c42|c43');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010018 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010019
     * @tc.number SUB_CCE_HISTCMP_01_0019
     * @tc.desc   记录 "[\"\",\"\",\"c42\",\"c43\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010019 begin');
      const detail: Array<string> = arrExact('||c42|c43');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010019 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010020
     * @tc.number SUB_CCE_HISTCMP_01_0020
     * @tc.desc   记录 "[\"c40\",\"c41\",\"\",\"c43\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010020 begin');
      const detail: Array<string> = arrExact('c40|c41||c43');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010020 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010021
     * @tc.number SUB_CCE_HISTCMP_01_0021
     * @tc.desc   记录 "[\"\",\"c41\",\"\",\"c43\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010021 begin');
      const detail: Array<string> = arrExact('|c41||c43');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010021 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010022
     * @tc.number SUB_CCE_HISTCMP_01_0022
     * @tc.desc   记录 "[\"c40\",\"\",\"\",\"c43\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010022 begin');
      const detail: Array<string> = arrExact('c40|||c43');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010022 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010023
     * @tc.number SUB_CCE_HISTCMP_01_0023
     * @tc.desc   记录 "[\"\",\"\",\"\",\"c43\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010023 begin');
      const detail: Array<string> = arrExact('|||c43');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010023 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010024
     * @tc.number SUB_CCE_HISTCMP_01_0024
     * @tc.desc   记录 "[\"c40\",\"c41\",\"c42\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010024 begin');
      const detail: Array<string> = arrExact('c40|c41|c42|');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010024 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010025
     * @tc.number SUB_CCE_HISTCMP_01_0025
     * @tc.desc   记录 "[\"\",\"c41\",\"c42\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010025 begin');
      const detail: Array<string> = arrExact('|c41|c42|');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010025 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010026
     * @tc.number SUB_CCE_HISTCMP_01_0026
     * @tc.desc   记录 "[\"c40\",\"\",\"c42\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010026 begin');
      const detail: Array<string> = arrExact('c40||c42|');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010026 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010027
     * @tc.number SUB_CCE_HISTCMP_01_0027
     * @tc.desc   记录 "[\"\",\"\",\"c42\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010027 begin');
      const detail: Array<string> = arrExact('||c42|');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010027 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010028
     * @tc.number SUB_CCE_HISTCMP_01_0028
     * @tc.desc   记录 "[\"c40\",\"c41\",\"\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010028 begin');
      const detail: Array<string> = arrExact('c40|c41||');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010028 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010029
     * @tc.number SUB_CCE_HISTCMP_01_0029
     * @tc.desc   记录 "[\"\",\"c41\",\"\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010029 begin');
      const detail: Array<string> = arrExact('|c41||');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010029 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010030
     * @tc.number SUB_CCE_HISTCMP_01_0030
     * @tc.desc   记录 "[\"c40\",\"\",\"\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010030 begin');
      const detail: Array<string> = arrExact('c40|||');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010030 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010031
     * @tc.number SUB_CCE_HISTCMP_01_0031
     * @tc.desc   记录 "[\"\",\"\",\"\",\"\"]" 的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010031 begin');
      const detail: Array<string> = arrExact('|||');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('false'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(5));
      expect(String(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010031 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010032
     * @tc.number SUB_CCE_HISTCMP_01_0032
     * @tc.desc   记录 "[\"m0\",\"m1\",\"m2\",\"m3\",\"m4\"]" 的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010032 begin');
      const detail: Array<string> = arrExact('m0|m1|m2|m3|m4');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('true'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(4));
      expect(String(result).length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010032 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010033
     * @tc.number SUB_CCE_HISTCMP_01_0033
     * @tc.desc   记录 "[\"m0\",\"m1\",\"m2\",\"m3\",\"\"]" 的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010033 begin');
      const detail: Array<string> = arrExact('m0|m1|m2|m3|');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('true'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(4));
      expect(String(result).length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010033 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010034
     * @tc.number SUB_CCE_HISTCMP_01_0034
     * @tc.desc   记录 "[\" \",\"c1\",\"c2\",\"c3\"]" 的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010034 begin');
      const detail: Array<string> = arrExact(' |c1|c2|c3');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('true'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(4));
      expect(String(result).length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010034 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010035
     * @tc.number SUB_CCE_HISTCMP_01_0035
     * @tc.desc   记录 "[\"null\",\"c1\",\"c2\",\"c3\"]" 的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010035 begin');
      const detail: Array<string> = arrExact('null|c1|c2|c3');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('true'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(4));
      expect(String(result).length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010035 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010036
     * @tc.number SUB_CCE_HISTCMP_01_0036
     * @tc.desc   记录 "[\"0\",\"c1\",\"c2\",\"c3\"]" 的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010036 begin');
      const detail: Array<string> = arrExact('0|c1|c2|c3');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('true'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(4));
      expect(String(result).length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010036 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010037
     * @tc.number SUB_CCE_HISTCMP_01_0037
     * @tc.desc   记录 "[\"中文\",\"c1\",\"c2\",\"c3\"]" 的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010037 begin');
      const detail: Array<string> = arrExact('中文|c1|c2|c3');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('true'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(4));
      expect(String(result).length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010037 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010038
     * @tc.number SUB_CCE_HISTCMP_01_0038
     * @tc.desc   记录 "[\"true\",\"c1\",\"c2\",\"c3\"]" 的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010038 begin');
      const detail: Array<string> = arrExact('true|c1|c2|c3');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('true'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(4));
      expect(String(result).length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010038 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010039
     * @tc.number SUB_CCE_HISTCMP_01_0039
     * @tc.desc   记录 "[\"-1\",\"c1\",\"c2\",\"c3\"]" 的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010039 begin');
      const detail: Array<string> = arrExact('-1|c1|c2|c3');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('true'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(4));
      expect(String(result).length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010039 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010040
     * @tc.number SUB_CCE_HISTCMP_01_0040
     * @tc.desc   记录 "[\"a b\",\"c1\",\"c2\",\"c3\"]" 的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010040 begin');
      const detail: Array<string> = arrExact('a b|c1|c2|c3');
      const result: boolean = historyFeature.isCompleteRecord(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.isCompleteRecord(detail.concat([])))), String('true'));
      expect(String(historyFeature.isCompleteRecord(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result).length), String(4));
      expect(String(result).length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010040 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume010041
     * @tc.number SUB_CCE_HISTCMP_01_0041
     * @tc.desc   只有 3 个字段时判为不完整，第 4 字段为空串同样不完整
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010041 begin');
      const threeFields: Array<string> = ['2026-11-18 10:00:00', '10:01:01', '00:01:01'];
      const blankFourth: Array<string> = ['2026-11-18 10:00:00', '10:01:01', '00:01:01', ''];
      const full: Array<string> = ['2026-11-18 10:00:00', '10:01:01', '00:01:01', '7'];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(historyFeature.isCompleteRecord(threeFields)), 'false');
      expect(historyFeature.isCompleteRecord(threeFields)).assertFalse();
      expect(historyFeature.isCompleteRecord(blankFourth)).assertFalse();
      expect(historyFeature.isCompleteRecord(full)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume010041 end');
    })
  })
}
