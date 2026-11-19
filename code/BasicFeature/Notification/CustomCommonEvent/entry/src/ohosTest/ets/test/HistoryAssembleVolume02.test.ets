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

export default function historyAssembleVolume02Test(): void {
  describe('HistoryAssembleVolume02Test', () => {

    /**
     * @tc.name   testHistoryAssembleVolume020001
     * @tc.number SUB_CCE_HISTASM_02_0001
     * @tc.desc   记录数=2 模式=全保留 时保留 2 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020001 begin');
      const records: Array<string> = arr('r0|r1');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020001 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020002
     * @tc.number SUB_CCE_HISTASM_02_0002
     * @tc.desc   记录数=2 模式=奇数位丢弃 时保留 1 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020002 begin');
      const records: Array<string> = arr('r0|r1');
      const details: Array<Array<string>> = rows('~;a1|b1');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020002 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020003
     * @tc.number SUB_CCE_HISTASM_02_0003
     * @tc.desc   记录数=2 模式=偶数位丢弃 时保留 1 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020003 begin');
      const records: Array<string> = arr('r0|r1');
      const details: Array<Array<string>> = rows('a0|b0;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020003 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020004
     * @tc.number SUB_CCE_HISTASM_02_0004
     * @tc.desc   记录数=2 模式=首位丢弃 时保留 1 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020004 begin');
      const records: Array<string> = arr('r0|r1');
      const details: Array<Array<string>> = rows('~;a1|b1');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020004 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020005
     * @tc.number SUB_CCE_HISTASM_02_0005
     * @tc.desc   记录数=2 模式=末位丢弃 时保留 1 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020005 begin');
      const records: Array<string> = arr('r0|r1');
      const details: Array<Array<string>> = rows('a0|b0;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020005 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020006
     * @tc.number SUB_CCE_HISTASM_02_0006
     * @tc.desc   记录数=3 模式=全保留 时保留 3 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020006 begin');
      const records: Array<string> = arr('r0|r1|r2');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020006 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020007
     * @tc.number SUB_CCE_HISTASM_02_0007
     * @tc.desc   记录数=3 模式=全丢弃 时保留 0 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020007 begin');
      const records: Array<string> = arr('r0|r1|r2');
      const details: Array<Array<string>> = rows('~;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020007 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020008
     * @tc.number SUB_CCE_HISTASM_02_0008
     * @tc.desc   记录数=3 模式=奇数位丢弃 时保留 1 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020008 begin');
      const records: Array<string> = arr('r0|r1|r2');
      const details: Array<Array<string>> = rows('~;a1|b1;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020008 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020009
     * @tc.number SUB_CCE_HISTASM_02_0009
     * @tc.desc   记录数=3 模式=偶数位丢弃 时保留 2 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020009 begin');
      const records: Array<string> = arr('r0|r1|r2');
      const details: Array<Array<string>> = rows('a0|b0;~;a2|b2');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a2","b2"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a2","b2"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020009 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020010
     * @tc.number SUB_CCE_HISTASM_02_0010
     * @tc.desc   记录数=3 模式=首位丢弃 时保留 2 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020010 begin');
      const records: Array<string> = arr('r0|r1|r2');
      const details: Array<Array<string>> = rows('~;a1|b1;a2|b2');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a2","b2"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a2","b2"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020010 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020011
     * @tc.number SUB_CCE_HISTASM_02_0011
     * @tc.desc   记录数=3 模式=末位丢弃 时保留 2 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020011 begin');
      const records: Array<string> = arr('r0|r1|r2');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020011 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020012
     * @tc.number SUB_CCE_HISTASM_02_0012
     * @tc.desc   记录数=4 模式=全保留 时保留 4 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020012 begin');
      const records: Array<string> = arr('r0|r1|r2|r3');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2;a3|b3');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020012 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020013
     * @tc.number SUB_CCE_HISTASM_02_0013
     * @tc.desc   记录数=4 模式=全丢弃 时保留 0 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020013 begin');
      const records: Array<string> = arr('r0|r1|r2|r3');
      const details: Array<Array<string>> = rows('~;~;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020013 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020014
     * @tc.number SUB_CCE_HISTASM_02_0014
     * @tc.desc   记录数=4 模式=奇数位丢弃 时保留 2 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020014 begin');
      const records: Array<string> = arr('r0|r1|r2|r3');
      const details: Array<Array<string>> = rows('~;a1|b1;~;a3|b3');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a3","b3"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a3","b3"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020014 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020015
     * @tc.number SUB_CCE_HISTASM_02_0015
     * @tc.desc   记录数=4 模式=偶数位丢弃 时保留 2 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020015 begin');
      const records: Array<string> = arr('r0|r1|r2|r3');
      const details: Array<Array<string>> = rows('a0|b0;~;a2|b2;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a2","b2"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a2","b2"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020015 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020016
     * @tc.number SUB_CCE_HISTASM_02_0016
     * @tc.desc   记录数=4 模式=首位丢弃 时保留 3 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020016 begin');
      const records: Array<string> = arr('r0|r1|r2|r3');
      const details: Array<Array<string>> = rows('~;a1|b1;a2|b2;a3|b3');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a2","b2"],["a3","b3"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a2","b2"],["a3","b3"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020016 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020017
     * @tc.number SUB_CCE_HISTASM_02_0017
     * @tc.desc   记录数=4 模式=末位丢弃 时保留 3 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020017 begin');
      const records: Array<string> = arr('r0|r1|r2|r3');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020017 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020018
     * @tc.number SUB_CCE_HISTASM_02_0018
     * @tc.desc   记录数=5 模式=全保留 时保留 5 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020018 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2;a3|b3;a4|b4');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020018 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020019
     * @tc.number SUB_CCE_HISTASM_02_0019
     * @tc.desc   记录数=5 模式=全丢弃 时保留 0 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020019 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4');
      const details: Array<Array<string>> = rows('~;~;~;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020019 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020020
     * @tc.number SUB_CCE_HISTASM_02_0020
     * @tc.desc   记录数=5 模式=奇数位丢弃 时保留 2 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020020 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4');
      const details: Array<Array<string>> = rows('~;a1|b1;~;a3|b3;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a3","b3"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a3","b3"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020020 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020021
     * @tc.number SUB_CCE_HISTASM_02_0021
     * @tc.desc   记录数=5 模式=偶数位丢弃 时保留 3 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020021 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4');
      const details: Array<Array<string>> = rows('a0|b0;~;a2|b2;~;a4|b4');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a2","b2"],["a4","b4"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a2","b2"],["a4","b4"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020021 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020022
     * @tc.number SUB_CCE_HISTASM_02_0022
     * @tc.desc   记录数=5 模式=首位丢弃 时保留 4 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020022 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4');
      const details: Array<Array<string>> = rows('~;a1|b1;a2|b2;a3|b3;a4|b4');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020022 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020023
     * @tc.number SUB_CCE_HISTASM_02_0023
     * @tc.desc   记录数=5 模式=末位丢弃 时保留 4 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020023 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2;a3|b3;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020023 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020024
     * @tc.number SUB_CCE_HISTASM_02_0024
     * @tc.desc   记录数=6 模式=全保留 时保留 6 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020024 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2;a3|b3;a4|b4;a5|b5');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020024 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020025
     * @tc.number SUB_CCE_HISTASM_02_0025
     * @tc.desc   记录数=6 模式=全丢弃 时保留 0 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020025 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5');
      const details: Array<Array<string>> = rows('~;~;~;~;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020025 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020026
     * @tc.number SUB_CCE_HISTASM_02_0026
     * @tc.desc   记录数=6 模式=奇数位丢弃 时保留 3 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020026 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5');
      const details: Array<Array<string>> = rows('~;a1|b1;~;a3|b3;~;a5|b5');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a3","b3"],["a5","b5"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a3","b3"],["a5","b5"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020026 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020027
     * @tc.number SUB_CCE_HISTASM_02_0027
     * @tc.desc   记录数=6 模式=偶数位丢弃 时保留 3 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020027 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5');
      const details: Array<Array<string>> = rows('a0|b0;~;a2|b2;~;a4|b4;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a2","b2"],["a4","b4"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a2","b2"],["a4","b4"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020027 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020028
     * @tc.number SUB_CCE_HISTASM_02_0028
     * @tc.desc   记录数=6 模式=首位丢弃 时保留 5 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020028 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5');
      const details: Array<Array<string>> = rows('~;a1|b1;a2|b2;a3|b3;a4|b4;a5|b5');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020028 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020029
     * @tc.number SUB_CCE_HISTASM_02_0029
     * @tc.desc   记录数=6 模式=末位丢弃 时保留 5 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020029 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2;a3|b3;a4|b4;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020029 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020030
     * @tc.number SUB_CCE_HISTASM_02_0030
     * @tc.desc   记录数=7 模式=全保留 时保留 7 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020030 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2;a3|b3;a4|b4;a5|b5;a6|b6');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"],["a6","b6"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"],["a6","b6"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020030 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020031
     * @tc.number SUB_CCE_HISTASM_02_0031
     * @tc.desc   记录数=7 模式=全丢弃 时保留 0 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020031 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6');
      const details: Array<Array<string>> = rows('~;~;~;~;~;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020031 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020032
     * @tc.number SUB_CCE_HISTASM_02_0032
     * @tc.desc   记录数=7 模式=奇数位丢弃 时保留 3 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020032 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6');
      const details: Array<Array<string>> = rows('~;a1|b1;~;a3|b3;~;a5|b5;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a3","b3"],["a5","b5"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a3","b3"],["a5","b5"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020032 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020033
     * @tc.number SUB_CCE_HISTASM_02_0033
     * @tc.desc   记录数=7 模式=偶数位丢弃 时保留 4 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020033 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6');
      const details: Array<Array<string>> = rows('a0|b0;~;a2|b2;~;a4|b4;~;a6|b6');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a2","b2"],["a4","b4"],["a6","b6"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a2","b2"],["a4","b4"],["a6","b6"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020033 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020034
     * @tc.number SUB_CCE_HISTASM_02_0034
     * @tc.desc   记录数=7 模式=首位丢弃 时保留 6 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020034 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6');
      const details: Array<Array<string>> = rows('~;a1|b1;a2|b2;a3|b3;a4|b4;a5|b5;a6|b6');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"],["a6","b6"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"],["a6","b6"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020034 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020035
     * @tc.number SUB_CCE_HISTASM_02_0035
     * @tc.desc   记录数=7 模式=末位丢弃 时保留 6 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020035 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2;a3|b3;a4|b4;a5|b5;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020035 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020036
     * @tc.number SUB_CCE_HISTASM_02_0036
     * @tc.desc   记录数=8 模式=全保留 时保留 8 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020036 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6|r7');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2;a3|b3;a4|b4;a5|b5;a6|b6;a7|b7');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"],["a6","b6"],["a7","b7"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"],["a6","b6"],["a7","b7"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020036 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020037
     * @tc.number SUB_CCE_HISTASM_02_0037
     * @tc.desc   记录数=8 模式=全丢弃 时保留 0 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020037 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6|r7');
      const details: Array<Array<string>> = rows('~;~;~;~;~;~;~;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020037 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020038
     * @tc.number SUB_CCE_HISTASM_02_0038
     * @tc.desc   记录数=8 模式=奇数位丢弃 时保留 4 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020038 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6|r7');
      const details: Array<Array<string>> = rows('~;a1|b1;~;a3|b3;~;a5|b5;~;a7|b7');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a3","b3"],["a5","b5"],["a7","b7"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a3","b3"],["a5","b5"],["a7","b7"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020038 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020039
     * @tc.number SUB_CCE_HISTASM_02_0039
     * @tc.desc   记录数=8 模式=偶数位丢弃 时保留 4 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020039 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6|r7');
      const details: Array<Array<string>> = rows('a0|b0;~;a2|b2;~;a4|b4;~;a6|b6;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a2","b2"],["a4","b4"],["a6","b6"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a2","b2"],["a4","b4"],["a6","b6"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020039 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020040
     * @tc.number SUB_CCE_HISTASM_02_0040
     * @tc.desc   记录数=8 模式=首位丢弃 时保留 7 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020040 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6|r7');
      const details: Array<Array<string>> = rows('~;a1|b1;a2|b2;a3|b3;a4|b4;a5|b5;a6|b6;a7|b7');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"],["a6","b6"],["a7","b7"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"],["a6","b6"],["a7","b7"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020040 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020041
     * @tc.number SUB_CCE_HISTASM_02_0041
     * @tc.desc   记录数=8 模式=末位丢弃 时保留 7 条（2 元素详情行）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020041 begin');
      const records: Array<string> = arr('r0|r1|r2|r3|r4|r5|r6|r7');
      const details: Array<Array<string>> = rows('a0|b0;a1|b1;a2|b2;a3|b3;a4|b4;a5|b5;a6|b6;~');
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"],["a6","b6"]]'));
      expect(JSON.stringify(result)).assertEqual('[["a0","b0"],["a1","b1"],["a2","b2"],["a3","b3"],["a4","b4"],["a5","b5"],["a6","b6"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length), String(0));
      expect(result.filter((item: Array<string>) => JSON.stringify(item) === '[]').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020041 end');
    })

    /**
     * @tc.name   testHistoryAssembleVolume020042
     * @tc.number SUB_CCE_HISTASM_02_0042
     * @tc.desc   details 远长于 records 时多余详情被整体忽略，只按 records 数量配对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryAssembleVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020042 begin');
      const records: Array<string> = ['r1'];
      const details: Array<Array<string>> = [['d1'], ['d2'], ['d3']];
      const result: Array<Array<string>> = historyFeature.assemble(records, details);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(result), '[["d1"]]');
      expect(JSON.stringify(result)).assertEqual('[["d1"]]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(details.length), String(3));
      expect(details.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryAssembleVolume020042 end');
    })
  })
}
