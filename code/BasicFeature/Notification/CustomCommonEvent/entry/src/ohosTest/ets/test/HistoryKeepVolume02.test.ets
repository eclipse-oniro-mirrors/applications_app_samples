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

export default function historyKeepVolume02Test(): void {
  describe('HistoryKeepVolume02Test', () => {

    /**
     * @tc.name   testHistoryKeepVolume020001
     * @tc.number SUB_CCE_HISTKEEP_02_0001
     * @tc.desc   多元素空值变体『空串,空串』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020001 begin');
      const detail: Array<string> = arr('|');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["",""]'));
      expect(JSON.stringify(detail)).assertEqual('["",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020001 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020002
     * @tc.number SUB_CCE_HISTKEEP_02_0002
     * @tc.desc   多元素空值变体『空串,a』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020002 begin');
      const detail: Array<string> = arr('|a');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["","a"]'));
      expect(JSON.stringify(detail)).assertEqual('["","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020002 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020003
     * @tc.number SUB_CCE_HISTKEEP_02_0003
     * @tc.desc   多元素空值变体『a,空串』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020003 begin');
      const detail: Array<string> = arr('a|');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["a",""]'));
      expect(JSON.stringify(detail)).assertEqual('["a",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020003 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020004
     * @tc.number SUB_CCE_HISTKEEP_02_0004
     * @tc.desc   多元素空值变体『 , 』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020004 begin');
      const detail: Array<string> = arr(' | ');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('[" "," "]'));
      expect(JSON.stringify(detail)).assertEqual('[" "," "]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020004 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020005
     * @tc.number SUB_CCE_HISTKEEP_02_0005
     * @tc.desc   多元素空值变体『0,0』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020005 begin');
      const detail: Array<string> = arr('0|0');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["0","0"]'));
      expect(JSON.stringify(detail)).assertEqual('["0","0"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020005 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020006
     * @tc.number SUB_CCE_HISTKEEP_02_0006
     * @tc.desc   多元素空值变体『[],[]』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020006 begin');
      const detail: Array<string> = arr('[]|[]');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["[]","[]"]'));
      expect(JSON.stringify(detail)).assertEqual('["[]","[]"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020006 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020007
     * @tc.number SUB_CCE_HISTKEEP_02_0007
     * @tc.desc   多元素空值变体『null,undefined』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020007 begin');
      const detail: Array<string> = arr('null|undefined');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["null","undefined"]'));
      expect(JSON.stringify(detail)).assertEqual('["null","undefined"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020007 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020008
     * @tc.number SUB_CCE_HISTKEEP_02_0008
     * @tc.desc   多元素空值变体『空串,空串,空串』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020008 begin');
      const detail: Array<string> = arr('||');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(3));
      expect(detail.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["","",""]'));
      expect(JSON.stringify(detail)).assertEqual('["","",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020008 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020009
     * @tc.number SUB_CCE_HISTKEEP_02_0009
     * @tc.desc   多元素空值变体『空串, ,空串』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020009 begin');
      const detail: Array<string> = arr('| |');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(3));
      expect(detail.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('[""," ",""]'));
      expect(JSON.stringify(detail)).assertEqual('[""," ",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020009 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020010
     * @tc.number SUB_CCE_HISTKEEP_02_0010
     * @tc.desc   多元素空值变体『a,空串,b』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020010 begin');
      const detail: Array<string> = arr('a||b');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(3));
      expect(detail.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["a","","b"]'));
      expect(JSON.stringify(detail)).assertEqual('["a","","b"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020010 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020011
     * @tc.number SUB_CCE_HISTKEEP_02_0011
     * @tc.desc   多元素空值变体『空串,空串,空串,空串』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020011 begin');
      const detail: Array<string> = arr('|||');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(4));
      expect(detail.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["","","",""]'));
      expect(JSON.stringify(detail)).assertEqual('["","","",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020011 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020012
     * @tc.number SUB_CCE_HISTKEEP_02_0012
     * @tc.desc   多元素空值变体『中文,空串』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020012 begin');
      const detail: Array<string> = arr('中文|');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["中文",""]'));
      expect(JSON.stringify(detail)).assertEqual('["中文",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020012 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020013
     * @tc.number SUB_CCE_HISTKEEP_02_0013
     * @tc.desc   多元素空值变体『空串,中文』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020013 begin');
      const detail: Array<string> = arr('|中文');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["","中文"]'));
      expect(JSON.stringify(detail)).assertEqual('["","中文"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020013 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020014
     * @tc.number SUB_CCE_HISTKEEP_02_0014
     * @tc.desc   多元素空值变体『a b,x y』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020014 begin');
      const detail: Array<string> = arr('a b|x y');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["a b","x y"]'));
      expect(JSON.stringify(detail)).assertEqual('["a b","x y"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020014 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020015
     * @tc.number SUB_CCE_HISTKEEP_02_0015
     * @tc.desc   多元素空值变体『空串,[]』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020015 begin');
      const detail: Array<string> = arr('|[]');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["","[]"]'));
      expect(JSON.stringify(detail)).assertEqual('["","[]"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020015 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020016
     * @tc.number SUB_CCE_HISTKEEP_02_0016
     * @tc.desc   多元素空值变体『[],空串』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020016 begin');
      const detail: Array<string> = arr('[]|');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["[]",""]'));
      expect(JSON.stringify(detail)).assertEqual('["[]",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020016 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020017
     * @tc.number SUB_CCE_HISTKEEP_02_0017
     * @tc.desc   多元素空值变体『true,false』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020017 begin');
      const detail: Array<string> = arr('true|false');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["true","false"]'));
      expect(JSON.stringify(detail)).assertEqual('["true","false"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020017 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020018
     * @tc.number SUB_CCE_HISTKEEP_02_0018
     * @tc.desc   多元素空值变体『-1,0』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020018 begin');
      const detail: Array<string> = arr('-1|0');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["-1","0"]'));
      expect(JSON.stringify(detail)).assertEqual('["-1","0"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020018 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020019
     * @tc.number SUB_CCE_HISTKEEP_02_0019
     * @tc.desc   多元素空值变体『空串,空串,空串,空串,空串』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020019 begin');
      const detail: Array<string> = arr('||||');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(5));
      expect(detail.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["","","","",""]'));
      expect(JSON.stringify(detail)).assertEqual('["","","","",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020019 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020020
     * @tc.number SUB_CCE_HISTKEEP_02_0020
     * @tc.desc   多元素空值变体『k=v,a;b』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020020 begin');
      const detail: Array<string> = arr('k=v|a;b');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(2));
      expect(detail.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('["k=v","a;b"]'));
      expect(JSON.stringify(detail)).assertEqual('["k=v","a;b"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020020 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020021
     * @tc.number SUB_CCE_HISTKEEP_02_0021
     * @tc.desc   多元素空值变体『 ,0,null』时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020021 begin');
      const detail: Array<string> = arr(' |0|null');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), String(3));
      expect(detail.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(detail)), String('[" ","0","null"]'));
      expect(JSON.stringify(detail)).assertEqual('[" ","0","null"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020021 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume020022
     * @tc.number SUB_CCE_HISTKEEP_02_0022
     * @tc.desc   三空串数组保留且其序列化与空数组序列化不同，判据只认精确 "[]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020022 begin');
      const tripleBlank: Array<string> = ['', '', ''];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(historyFeature.shouldKeep(tripleBlank)), 'true');
      expect(historyFeature.shouldKeep(tripleBlank)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(tripleBlank), '["","",""]');
      expect(JSON.stringify(tripleBlank)).assertEqual('["","",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(tripleBlank) === '[]'), 'false');
      expect(JSON.stringify(tripleBlank) === '[]').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume020022 end');
    })
  })
}
