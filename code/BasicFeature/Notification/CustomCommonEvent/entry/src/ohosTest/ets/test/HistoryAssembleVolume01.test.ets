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
import { arr, rows } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function historyAssembleVolume01Test(): void {
  describe('HistoryAssembleVolume01Test', () => {

    /**
     * @tc.name   testHistoryAssembleVolume010001
     * @tc.number SUB_CCE_HISTASM_01_0001
     * @tc.desc   records=0 details=0 时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010001 begin');
      const records: Array<string> = arr('');
      const details: Array<Array<string>> = rows('');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010001 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010002
     * @tc.number SUB_CCE_HISTASM_01_0002
     * @tc.desc   records=1 details=1 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010002 begin');
      const records: Array<string> = arr('r10');
      const details: Array<Array<string>> = rows('d10');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d10"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d10"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010002 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010003
     * @tc.number SUB_CCE_HISTASM_01_0003
     * @tc.desc   records=1 details=1 时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010003 begin');
      const records: Array<string> = arr('r10');
      const details: Array<Array<string>> = rows('~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010003 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010004
     * @tc.number SUB_CCE_HISTASM_01_0004
     * @tc.desc   records=2 details=2 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010004 begin');
      const records: Array<string> = arr('r20|r21');
      const details: Array<Array<string>> = rows('d20;d21');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d20"],["d21"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d20"],["d21"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010004 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010005
     * @tc.number SUB_CCE_HISTASM_01_0005
     * @tc.desc   records=2 details=2 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010005 begin');
      const records: Array<string> = arr('r20|r21');
      const details: Array<Array<string>> = rows('~;d21');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d21"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d21"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010005 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010006
     * @tc.number SUB_CCE_HISTASM_01_0006
     * @tc.desc   records=2 details=2 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010006 begin');
      const records: Array<string> = arr('r20|r21');
      const details: Array<Array<string>> = rows('d20;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d20"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d20"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010006 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010007
     * @tc.number SUB_CCE_HISTASM_01_0007
     * @tc.desc   records=2 details=2 时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010007 begin');
      const records: Array<string> = arr('r20|r21');
      const details: Array<Array<string>> = rows('~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010007 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010008
     * @tc.number SUB_CCE_HISTASM_01_0008
     * @tc.desc   records=3 details=3 时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010008 begin');
      const records: Array<string> = arr('r30|r31|r32');
      const details: Array<Array<string>> = rows('d30;d31;d32');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d30"],["d31"],["d32"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d30"],["d31"],["d32"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010008 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010009
     * @tc.number SUB_CCE_HISTASM_01_0009
     * @tc.desc   records=3 details=3 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010009 begin');
      const records: Array<string> = arr('r30|r31|r32');
      const details: Array<Array<string>> = rows('~;d31;d32');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d31"],["d32"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d31"],["d32"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010009 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010010
     * @tc.number SUB_CCE_HISTASM_01_0010
     * @tc.desc   records=3 details=3 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010010 begin');
      const records: Array<string> = arr('r30|r31|r32');
      const details: Array<Array<string>> = rows('d30;~;d32');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d30"],["d32"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d30"],["d32"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010010 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010011
     * @tc.number SUB_CCE_HISTASM_01_0011
     * @tc.desc   records=3 details=3 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010011 begin');
      const records: Array<string> = arr('r30|r31|r32');
      const details: Array<Array<string>> = rows('~;~;d32');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d32"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d32"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010011 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010012
     * @tc.number SUB_CCE_HISTASM_01_0012
     * @tc.desc   records=3 details=3 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010012 begin');
      const records: Array<string> = arr('r30|r31|r32');
      const details: Array<Array<string>> = rows('d30;d31;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d30"],["d31"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d30"],["d31"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010012 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010013
     * @tc.number SUB_CCE_HISTASM_01_0013
     * @tc.desc   records=3 details=3 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010013 begin');
      const records: Array<string> = arr('r30|r31|r32');
      const details: Array<Array<string>> = rows('~;d31;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d31"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d31"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010013 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010014
     * @tc.number SUB_CCE_HISTASM_01_0014
     * @tc.desc   records=3 details=3 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010014 begin');
      const records: Array<string> = arr('r30|r31|r32');
      const details: Array<Array<string>> = rows('d30;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d30"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d30"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010014 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010015
     * @tc.number SUB_CCE_HISTASM_01_0015
     * @tc.desc   records=3 details=3 时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010015 begin');
      const records: Array<string> = arr('r30|r31|r32');
      const details: Array<Array<string>> = rows('~;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010015 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010016
     * @tc.number SUB_CCE_HISTASM_01_0016
     * @tc.desc   records=4 details=4 时保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010016 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('d40;d41;d42;d43');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d40"],["d41"],["d42"],["d43"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d40"],["d41"],["d42"],["d43"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010016 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010017
     * @tc.number SUB_CCE_HISTASM_01_0017
     * @tc.desc   records=4 details=4 时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010017 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('~;d41;d42;d43');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d41"],["d42"],["d43"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d41"],["d42"],["d43"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010017 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010018
     * @tc.number SUB_CCE_HISTASM_01_0018
     * @tc.desc   records=4 details=4 时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010018 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('d40;~;d42;d43');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d40"],["d42"],["d43"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d40"],["d42"],["d43"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010018 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010019
     * @tc.number SUB_CCE_HISTASM_01_0019
     * @tc.desc   records=4 details=4 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010019 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('~;~;d42;d43');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d42"],["d43"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d42"],["d43"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010019 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010020
     * @tc.number SUB_CCE_HISTASM_01_0020
     * @tc.desc   records=4 details=4 时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010020 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('d40;d41;~;d43');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d40"],["d41"],["d43"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d40"],["d41"],["d43"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010020 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010021
     * @tc.number SUB_CCE_HISTASM_01_0021
     * @tc.desc   records=4 details=4 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010021 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('~;d41;~;d43');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d41"],["d43"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d41"],["d43"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010021 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010022
     * @tc.number SUB_CCE_HISTASM_01_0022
     * @tc.desc   records=4 details=4 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010022 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('d40;~;~;d43');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d40"],["d43"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d40"],["d43"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010022 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010023
     * @tc.number SUB_CCE_HISTASM_01_0023
     * @tc.desc   records=4 details=4 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010023 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('~;~;~;d43');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d43"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d43"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010023 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010024
     * @tc.number SUB_CCE_HISTASM_01_0024
     * @tc.desc   records=4 details=4 时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010024 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('d40;d41;d42;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d40"],["d41"],["d42"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d40"],["d41"],["d42"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010024 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010025
     * @tc.number SUB_CCE_HISTASM_01_0025
     * @tc.desc   records=4 details=4 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010025 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('~;d41;d42;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d41"],["d42"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d41"],["d42"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010025 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010026
     * @tc.number SUB_CCE_HISTASM_01_0026
     * @tc.desc   records=4 details=4 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010026 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('d40;~;d42;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d40"],["d42"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d40"],["d42"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010026 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010027
     * @tc.number SUB_CCE_HISTASM_01_0027
     * @tc.desc   records=4 details=4 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010027 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('~;~;d42;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d42"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d42"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010027 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010028
     * @tc.number SUB_CCE_HISTASM_01_0028
     * @tc.desc   records=4 details=4 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010028 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('d40;d41;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d40"],["d41"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d40"],["d41"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010028 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010029
     * @tc.number SUB_CCE_HISTASM_01_0029
     * @tc.desc   records=4 details=4 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010029 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('~;d41;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d41"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d41"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010029 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010030
     * @tc.number SUB_CCE_HISTASM_01_0030
     * @tc.desc   records=4 details=4 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010030 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('d40;~;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["d40"]]'));
      expect(JSON.stringify(result)).assertEqual('[["d40"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010030 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010031
     * @tc.number SUB_CCE_HISTASM_01_0031
     * @tc.desc   records=4 details=4 时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010031 begin');
      const records: Array<string> = arr('r40|r41|r42|r43');
      const details: Array<Array<string>> = rows('~;~;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010031 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010032
     * @tc.number SUB_CCE_HISTASM_01_0032
     * @tc.desc   records=1 details=0 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010032 begin');
      const records: Array<string> = arr('s10');
      const details: Array<Array<string>> = rows('');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null]'));
      expect(JSON.stringify(result)).assertEqual('[null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010032 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010033
     * @tc.number SUB_CCE_HISTASM_01_0033
     * @tc.desc   records=2 details=1 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010033 begin');
      const records: Array<string> = arr('s20|s21');
      const details: Array<Array<string>> = rows('v20');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["v20"],null]'));
      expect(JSON.stringify(result)).assertEqual('[["v20"],null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010033 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010034
     * @tc.number SUB_CCE_HISTASM_01_0034
     * @tc.desc   records=3 details=2 时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010034 begin');
      const records: Array<string> = arr('s30|s31|s32');
      const details: Array<Array<string>> = rows('v30;v31');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["v30"],["v31"],null]'));
      expect(JSON.stringify(result)).assertEqual('[["v30"],["v31"],null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010034 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010035
     * @tc.number SUB_CCE_HISTASM_01_0035
     * @tc.desc   records=4 details=3 时保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010035 begin');
      const records: Array<string> = arr('s40|s41|s42|s43');
      const details: Array<Array<string>> = rows('v40;v41;v42');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["v40"],["v41"],["v42"],null]'));
      expect(JSON.stringify(result)).assertEqual('[["v40"],["v41"],["v42"],null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010035 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010036
     * @tc.number SUB_CCE_HISTASM_01_0036
     * @tc.desc   records=1 details=2 时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010036 begin');
      const records: Array<string> = arr('l10');
      const details: Array<Array<string>> = rows('w10;extra1');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["w10"]]'));
      expect(JSON.stringify(result)).assertEqual('[["w10"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010036 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010037
     * @tc.number SUB_CCE_HISTASM_01_0037
     * @tc.desc   records=2 details=3 时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010037 begin');
      const records: Array<string> = arr('l20|l21');
      const details: Array<Array<string>> = rows('w20;w21;extra2');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["w20"],["w21"]]'));
      expect(JSON.stringify(result)).assertEqual('[["w20"],["w21"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010037 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010038
     * @tc.number SUB_CCE_HISTASM_01_0038
     * @tc.desc   records=3 details=4 时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010038 begin');
      const records: Array<string> = arr('l30|l31|l32');
      const details: Array<Array<string>> = rows('w30;w31;w32;extra3');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["w30"],["w31"],["w32"]]'));
      expect(JSON.stringify(result)).assertEqual('[["w30"],["w31"],["w32"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010038 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010039
     * @tc.number SUB_CCE_HISTASM_01_0039
     * @tc.desc   records=4 details=5 时保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010039 begin');
      const records: Array<string> = arr('l40|l41|l42|l43');
      const details: Array<Array<string>> = rows('w40;w41;w42;w43;extra4');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["w40"],["w41"],["w42"],["w43"]]'));
      expect(JSON.stringify(result)).assertEqual('[["w40"],["w41"],["w42"],["w43"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010039 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010040
     * @tc.number SUB_CCE_HISTASM_01_0040
     * @tc.desc   records=5 details=5 时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010040 begin');
      const records: Array<string> = arr('m0|m1|m2|m3|m4');
      const details: Array<Array<string>> = rows('~;~;~;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010040 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume010041
     * @tc.number SUB_CCE_HISTASM_01_0041
     * @tc.desc   details 比 records 短时缺项位置按保留处理，记录 undefined 占位（main 现状，仅记录）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010041 begin');
      const records: Array<string> = ['r1', 'r2', 'r3'];
      const details: Array<Array<string>> = [['d1']];
      const kept: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(kept.length), '3');
      expect(kept.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(kept), '[["d1"],null,null]');
      expect(JSON.stringify(kept)).assertEqual('[["d1"],null,null]');
      expect(JSON.stringify(kept[0])).assertEqual('["d1"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume010041 end');
    })
  })
}
