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
import mainFeature from '../../../main/ets/feature/MainFeature';
import { arr } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function mainCompactVolume02Test(): void {
  describe('MainCompactVolume02Test', () => {

    /**
     * @tc.name   testMainCompactVolume020001
     * @tc.number SUB_CCE_MAINCMP_02_0001
     * @tc.desc   6 槽模式=全保留 时过滤后保留 6 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020001 begin');
      const rec: Array<string> = arr('e0|e1|e2|e3|e4|e5');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e1","e2","e3","e4","e5"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e1","e2","e3","e4","e5"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(6));
      expect(rec.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020001 end');
    })

    /**
     * @tc.name   testMainCompactVolume020002
     * @tc.number SUB_CCE_MAINCMP_02_0002
     * @tc.desc   6 槽模式=全空 时过滤后保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020002 begin');
      const rec: Array<string> = arr('|||||');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(6));
      expect(rec.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020002 end');
    })

    /**
     * @tc.name   testMainCompactVolume020003
     * @tc.number SUB_CCE_MAINCMP_02_0003
     * @tc.desc   6 槽模式=奇数位空 时过滤后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020003 begin');
      const rec: Array<string> = arr('|e1||e3||e5');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e1","e3","e5"]'));
      expect(JSON.stringify(result)).assertEqual('["e1","e3","e5"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(6));
      expect(rec.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020003 end');
    })

    /**
     * @tc.name   testMainCompactVolume020004
     * @tc.number SUB_CCE_MAINCMP_02_0004
     * @tc.desc   6 槽模式=偶数位空 时过滤后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020004 begin');
      const rec: Array<string> = arr('e0||e2||e4|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e2","e4"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e2","e4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(6));
      expect(rec.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020004 end');
    })

    /**
     * @tc.name   testMainCompactVolume020005
     * @tc.number SUB_CCE_MAINCMP_02_0005
     * @tc.desc   6 槽模式=首位空 时过滤后保留 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020005 begin');
      const rec: Array<string> = arr('|e1|e2|e3|e4|e5');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e1","e2","e3","e4","e5"]'));
      expect(JSON.stringify(result)).assertEqual('["e1","e2","e3","e4","e5"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(6));
      expect(rec.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020005 end');
    })

    /**
     * @tc.name   testMainCompactVolume020006
     * @tc.number SUB_CCE_MAINCMP_02_0006
     * @tc.desc   6 槽模式=末位空 时过滤后保留 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020006 begin');
      const rec: Array<string> = arr('e0|e1|e2|e3|e4|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e1","e2","e3","e4"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e1","e2","e3","e4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(6));
      expect(rec.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020006 end');
    })

    /**
     * @tc.name   testMainCompactVolume020007
     * @tc.number SUB_CCE_MAINCMP_02_0007
     * @tc.desc   6 槽模式=中段连空 时过滤后保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020007 begin');
      const rec: Array<string> = arr('e0|e1|||e4|e5');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e1","e4","e5"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e1","e4","e5"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(6));
      expect(rec.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020007 end');
    })

    /**
     * @tc.name   testMainCompactVolume020008
     * @tc.number SUB_CCE_MAINCMP_02_0008
     * @tc.desc   6 槽模式=交替空 时过滤后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020008 begin');
      const rec: Array<string> = arr('|e1||e3||e5');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e1","e3","e5"]'));
      expect(JSON.stringify(result)).assertEqual('["e1","e3","e5"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(6));
      expect(rec.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020008 end');
    })

    /**
     * @tc.name   testMainCompactVolume020009
     * @tc.number SUB_CCE_MAINCMP_02_0009
     * @tc.desc   7 槽模式=全保留 时过滤后保留 7 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020009 begin');
      const rec: Array<string> = arr('e0|e1|e2|e3|e4|e5|e6');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e1","e2","e3","e4","e5","e6"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e1","e2","e3","e4","e5","e6"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(7));
      expect(rec.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020009 end');
    })

    /**
     * @tc.name   testMainCompactVolume020010
     * @tc.number SUB_CCE_MAINCMP_02_0010
     * @tc.desc   7 槽模式=全空 时过滤后保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020010 begin');
      const rec: Array<string> = arr('||||||');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(7));
      expect(rec.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020010 end');
    })

    /**
     * @tc.name   testMainCompactVolume020011
     * @tc.number SUB_CCE_MAINCMP_02_0011
     * @tc.desc   7 槽模式=奇数位空 时过滤后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020011 begin');
      const rec: Array<string> = arr('|e1||e3||e5|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e1","e3","e5"]'));
      expect(JSON.stringify(result)).assertEqual('["e1","e3","e5"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(7));
      expect(rec.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020011 end');
    })

    /**
     * @tc.name   testMainCompactVolume020012
     * @tc.number SUB_CCE_MAINCMP_02_0012
     * @tc.desc   7 槽模式=偶数位空 时过滤后保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020012 begin');
      const rec: Array<string> = arr('e0||e2||e4||e6');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e2","e4","e6"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e2","e4","e6"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(7));
      expect(rec.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020012 end');
    })

    /**
     * @tc.name   testMainCompactVolume020013
     * @tc.number SUB_CCE_MAINCMP_02_0013
     * @tc.desc   7 槽模式=首位空 时过滤后保留 6 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020013 begin');
      const rec: Array<string> = arr('|e1|e2|e3|e4|e5|e6');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e1","e2","e3","e4","e5","e6"]'));
      expect(JSON.stringify(result)).assertEqual('["e1","e2","e3","e4","e5","e6"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(7));
      expect(rec.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020013 end');
    })

    /**
     * @tc.name   testMainCompactVolume020014
     * @tc.number SUB_CCE_MAINCMP_02_0014
     * @tc.desc   7 槽模式=末位空 时过滤后保留 6 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020014 begin');
      const rec: Array<string> = arr('e0|e1|e2|e3|e4|e5|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e1","e2","e3","e4","e5"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e1","e2","e3","e4","e5"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(7));
      expect(rec.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020014 end');
    })

    /**
     * @tc.name   testMainCompactVolume020015
     * @tc.number SUB_CCE_MAINCMP_02_0015
     * @tc.desc   7 槽模式=中段连空 时过滤后保留 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020015 begin');
      const rec: Array<string> = arr('e0|e1|||e4|e5|e6');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e1","e4","e5","e6"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e1","e4","e5","e6"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(7));
      expect(rec.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020015 end');
    })

    /**
     * @tc.name   testMainCompactVolume020016
     * @tc.number SUB_CCE_MAINCMP_02_0016
     * @tc.desc   7 槽模式=交替空 时过滤后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020016 begin');
      const rec: Array<string> = arr('|e1||e3||e5|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e1","e3","e5"]'));
      expect(JSON.stringify(result)).assertEqual('["e1","e3","e5"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(7));
      expect(rec.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020016 end');
    })

    /**
     * @tc.name   testMainCompactVolume020017
     * @tc.number SUB_CCE_MAINCMP_02_0017
     * @tc.desc   8 槽模式=全保留 时过滤后保留 8 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020017 begin');
      const rec: Array<string> = arr('e0|e1|e2|e3|e4|e5|e6|e7');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e1","e2","e3","e4","e5","e6","e7"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e1","e2","e3","e4","e5","e6","e7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(8));
      expect(rec.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020017 end');
    })

    /**
     * @tc.name   testMainCompactVolume020018
     * @tc.number SUB_CCE_MAINCMP_02_0018
     * @tc.desc   8 槽模式=全空 时过滤后保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020018 begin');
      const rec: Array<string> = arr('|||||||');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(8));
      expect(rec.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020018 end');
    })

    /**
     * @tc.name   testMainCompactVolume020019
     * @tc.number SUB_CCE_MAINCMP_02_0019
     * @tc.desc   8 槽模式=奇数位空 时过滤后保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020019 begin');
      const rec: Array<string> = arr('|e1||e3||e5||e7');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e1","e3","e5","e7"]'));
      expect(JSON.stringify(result)).assertEqual('["e1","e3","e5","e7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(8));
      expect(rec.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020019 end');
    })

    /**
     * @tc.name   testMainCompactVolume020020
     * @tc.number SUB_CCE_MAINCMP_02_0020
     * @tc.desc   8 槽模式=偶数位空 时过滤后保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020020 begin');
      const rec: Array<string> = arr('e0||e2||e4||e6|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e2","e4","e6"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e2","e4","e6"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(8));
      expect(rec.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020020 end');
    })

    /**
     * @tc.name   testMainCompactVolume020021
     * @tc.number SUB_CCE_MAINCMP_02_0021
     * @tc.desc   8 槽模式=首位空 时过滤后保留 7 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020021 begin');
      const rec: Array<string> = arr('|e1|e2|e3|e4|e5|e6|e7');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e1","e2","e3","e4","e5","e6","e7"]'));
      expect(JSON.stringify(result)).assertEqual('["e1","e2","e3","e4","e5","e6","e7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(8));
      expect(rec.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020021 end');
    })

    /**
     * @tc.name   testMainCompactVolume020022
     * @tc.number SUB_CCE_MAINCMP_02_0022
     * @tc.desc   8 槽模式=末位空 时过滤后保留 7 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020022 begin');
      const rec: Array<string> = arr('e0|e1|e2|e3|e4|e5|e6|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e1","e2","e3","e4","e5","e6"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e1","e2","e3","e4","e5","e6"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(8));
      expect(rec.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020022 end');
    })

    /**
     * @tc.name   testMainCompactVolume020023
     * @tc.number SUB_CCE_MAINCMP_02_0023
     * @tc.desc   8 槽模式=中段连空 时过滤后保留 6 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020023 begin');
      const rec: Array<string> = arr('e0|e1|e2|||e5|e6|e7');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e0","e1","e2","e5","e6","e7"]'));
      expect(JSON.stringify(result)).assertEqual('["e0","e1","e2","e5","e6","e7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(8));
      expect(rec.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020023 end');
    })

    /**
     * @tc.name   testMainCompactVolume020024
     * @tc.number SUB_CCE_MAINCMP_02_0024
     * @tc.desc   8 槽模式=交替空 时过滤后保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020024 begin');
      const rec: Array<string> = arr('|e1||e3||e5||e7');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e1","e3","e5","e7"]'));
      expect(JSON.stringify(result)).assertEqual('["e1","e3","e5","e7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(8));
      expect(rec.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020024 end');
    })

    /**
     * @tc.name   testMainCompactVolume020025
     * @tc.number SUB_CCE_MAINCMP_02_0025
     * @tc.desc   重复值无空串『a,a,a』时全量保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020025 begin');
      const rec: Array<string> = arr('a|a|a');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","a","a"]'));
      expect(JSON.stringify(result)).assertEqual('["a","a","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020025 end');
    })

    /**
     * @tc.name   testMainCompactVolume020026
     * @tc.number SUB_CCE_MAINCMP_02_0026
     * @tc.desc   重复值无空串『a,a,a,a』时全量保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020026 begin');
      const rec: Array<string> = arr('a|a|a|a');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","a","a","a"]'));
      expect(JSON.stringify(result)).assertEqual('["a","a","a","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020026 end');
    })

    /**
     * @tc.name   testMainCompactVolume020027
     * @tc.number SUB_CCE_MAINCMP_02_0027
     * @tc.desc   重复值无空串『a,b,a』时全量保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020027 begin');
      const rec: Array<string> = arr('a|b|a');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","b","a"]'));
      expect(JSON.stringify(result)).assertEqual('["a","b","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020027 end');
    })

    /**
     * @tc.name   testMainCompactVolume020028
     * @tc.number SUB_CCE_MAINCMP_02_0028
     * @tc.desc   重复值无空串『a,b,a,b』时全量保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020028 begin');
      const rec: Array<string> = arr('a|b|a|b');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","b","a","b"]'));
      expect(JSON.stringify(result)).assertEqual('["a","b","a","b"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020028 end');
    })

    /**
     * @tc.name   testMainCompactVolume020029
     * @tc.number SUB_CCE_MAINCMP_02_0029
     * @tc.desc   重复值无空串『x,x,y,y,x』时全量保留 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020029 begin');
      const rec: Array<string> = arr('x|x|y|y|x');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["x","x","y","y","x"]'));
      expect(JSON.stringify(result)).assertEqual('["x","x","y","y","x"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020029 end');
    })

    /**
     * @tc.name   testMainCompactVolume020030
     * @tc.number SUB_CCE_MAINCMP_02_0030
     * @tc.desc   重复值无空串『d,d,d,d,d,d』时全量保留 6 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020030 begin');
      const rec: Array<string> = arr('d|d|d|d|d|d');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["d","d","d","d","d","d"]'));
      expect(JSON.stringify(result)).assertEqual('["d","d","d","d","d","d"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(6));
      expect(rec.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020030 end');
    })

    /**
     * @tc.name   testMainCompactVolume020031
     * @tc.number SUB_CCE_MAINCMP_02_0031
     * @tc.desc   重复值混合空串（入参 4 槽）时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020031 begin');
      const rec: Array<string> = arr('a|a||a');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","a","a"]'));
      expect(JSON.stringify(result)).assertEqual('["a","a","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020031 end');
    })

    /**
     * @tc.name   testMainCompactVolume020032
     * @tc.number SUB_CCE_MAINCMP_02_0032
     * @tc.desc   重复值混合空串（入参 5 槽）时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020032 begin');
      const rec: Array<string> = arr('a||a|a|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","a","a"]'));
      expect(JSON.stringify(result)).assertEqual('["a","a","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020032 end');
    })

    /**
     * @tc.name   testMainCompactVolume020033
     * @tc.number SUB_CCE_MAINCMP_02_0033
     * @tc.desc   重复值混合空串（入参 3 槽）时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020033 begin');
      const rec: Array<string> = arr('|a|a');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","a"]'));
      expect(JSON.stringify(result)).assertEqual('["a","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020033 end');
    })

    /**
     * @tc.name   testMainCompactVolume020034
     * @tc.number SUB_CCE_MAINCMP_02_0034
     * @tc.desc   重复值混合空串（入参 5 槽）时保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020034 begin');
      const rec: Array<string> = arr('a|a||a|a');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","a","a","a"]'));
      expect(JSON.stringify(result)).assertEqual('["a","a","a","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020034 end');
    })

    /**
     * @tc.name   testMainCompactVolume020035
     * @tc.number SUB_CCE_MAINCMP_02_0035
     * @tc.desc   重复值混合空串（入参 3 槽）时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020035 begin');
      const rec: Array<string> = arr('a||a');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","a"]'));
      expect(JSON.stringify(result)).assertEqual('["a","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020035 end');
    })

    /**
     * @tc.name   testMainCompactVolume020036
     * @tc.number SUB_CCE_MAINCMP_02_0036
     * @tc.desc   重复值混合空串（入参 4 槽）时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020036 begin');
      const rec: Array<string> = arr('b||b|b');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["b","b","b"]'));
      expect(JSON.stringify(result)).assertEqual('["b","b","b"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020036 end');
    })

    /**
     * @tc.name   testMainCompactVolume020037
     * @tc.number SUB_CCE_MAINCMP_02_0037
     * @tc.desc   重复值混合空串（入参 6 槽）时保留 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020037 begin');
      const rec: Array<string> = arr('c|c||c|c|c');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["c","c","c","c","c"]'));
      expect(JSON.stringify(result)).assertEqual('["c","c","c","c","c"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(6));
      expect(rec.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020037 end');
    })

    /**
     * @tc.name   testMainCompactVolume020038
     * @tc.number SUB_CCE_MAINCMP_02_0038
     * @tc.desc   重复值混合空串（入参 5 槽）时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020038 begin');
      const rec: Array<string> = arr('|a|a|a|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","a","a"]'));
      expect(JSON.stringify(result)).assertEqual('["a","a","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020038 end');
    })

    /**
     * @tc.name   testMainCompactVolume020039
     * @tc.number SUB_CCE_MAINCMP_02_0039
     * @tc.desc   重复值混合空串（入参 7 槽）时保留 6 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020039 begin');
      const rec: Array<string> = arr('a|a|a||a|a|a');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a","a","a","a","a","a"]'));
      expect(JSON.stringify(result)).assertEqual('["a","a","a","a","a","a"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(7));
      expect(rec.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020039 end');
    })

    /**
     * @tc.name   testMainCompactVolume020040
     * @tc.number SUB_CCE_MAINCMP_02_0040
     * @tc.desc   重复值混合空串（入参 5 槽）时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020040 begin');
      const rec: Array<string> = arr('e||e||e');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e","e","e"]'));
      expect(JSON.stringify(result)).assertEqual('["e","e","e"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020040 end');
    })

    /**
     * @tc.name   testMainCompactVolume020041
     * @tc.number SUB_CCE_MAINCMP_02_0041
     * @tc.desc   重复值混合空串（入参 8 槽）时保留 7 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020041 begin');
      const rec: Array<string> = arr('f|f|f|f||f|f|f');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f","f","f","f","f","f","f"]'));
      expect(JSON.stringify(result)).assertEqual('["f","f","f","f","f","f","f"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(8));
      expect(rec.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020041 end');
    })

    /**
     * @tc.name   testMainCompactVolume020042
     * @tc.number SUB_CCE_MAINCMP_02_0042
     * @tc.desc   8 槽全空串的定长表过滤后为空且入参长度保持不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020042 begin');
      const rec: Array<string> = ['', '', '', '', '', '', '', ''];
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(result), '[]');
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(8));
      expect(rec.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume020042 end');
    })
  })
}
