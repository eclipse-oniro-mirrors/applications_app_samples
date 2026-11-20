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
import { arrExact } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function mainCompactVolume01Test(): void {
  describe('MainCompactVolume01Test', () => {

    /**
     * @tc.name   testMainCompactVolume010001
     * @tc.number SUB_CCE_MAINCMP_01_0001
     * @tc.desc   定长表 0 槽位含空串时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010001 begin');
      const rec: Array<string> = arrExact('');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(0));
      expect(rec.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010001 end');
    })

    /**
     * @tc.name   testMainCompactVolume010002
     * @tc.number SUB_CCE_MAINCMP_01_0002
     * @tc.desc   定长表 1 槽位含空串时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010002 begin');
      const rec: Array<string> = arrExact('e10');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e10"]'));
      expect(JSON.stringify(result)).assertEqual('["e10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(1));
      expect(rec.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010002 end');
    })

    /**
     * @tc.name   testMainCompactVolume010003
     * @tc.number SUB_CCE_MAINCMP_01_0003
     * @tc.desc   定长表 1 槽位含空串时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010003 begin');
      const rec: Array<string> = arrExact('~');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(1));
      expect(rec.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010003 end');
    })

    /**
     * @tc.name   testMainCompactVolume010004
     * @tc.number SUB_CCE_MAINCMP_01_0004
     * @tc.desc   定长表 2 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010004 begin');
      const rec: Array<string> = arrExact('e20|e21');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e20","e21"]'));
      expect(JSON.stringify(result)).assertEqual('["e20","e21"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(2));
      expect(rec.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010004 end');
    })

    /**
     * @tc.name   testMainCompactVolume010005
     * @tc.number SUB_CCE_MAINCMP_01_0005
     * @tc.desc   定长表 2 槽位含空串时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010005 begin');
      const rec: Array<string> = arrExact('|e21');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e21"]'));
      expect(JSON.stringify(result)).assertEqual('["e21"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(2));
      expect(rec.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010005 end');
    })

    /**
     * @tc.name   testMainCompactVolume010006
     * @tc.number SUB_CCE_MAINCMP_01_0006
     * @tc.desc   定长表 2 槽位含空串时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010006 begin');
      const rec: Array<string> = arrExact('e20|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e20"]'));
      expect(JSON.stringify(result)).assertEqual('["e20"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(2));
      expect(rec.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010006 end');
    })

    /**
     * @tc.name   testMainCompactVolume010007
     * @tc.number SUB_CCE_MAINCMP_01_0007
     * @tc.desc   定长表 2 槽位含空串时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010007 begin');
      const rec: Array<string> = arrExact('|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(2));
      expect(rec.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010007 end');
    })

    /**
     * @tc.name   testMainCompactVolume010008
     * @tc.number SUB_CCE_MAINCMP_01_0008
     * @tc.desc   定长表 3 槽位含空串时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010008 begin');
      const rec: Array<string> = arrExact('e30|e31|e32');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e30","e31","e32"]'));
      expect(JSON.stringify(result)).assertEqual('["e30","e31","e32"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010008 end');
    })

    /**
     * @tc.name   testMainCompactVolume010009
     * @tc.number SUB_CCE_MAINCMP_01_0009
     * @tc.desc   定长表 3 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010009 begin');
      const rec: Array<string> = arrExact('|e31|e32');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e31","e32"]'));
      expect(JSON.stringify(result)).assertEqual('["e31","e32"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010009 end');
    })

    /**
     * @tc.name   testMainCompactVolume010010
     * @tc.number SUB_CCE_MAINCMP_01_0010
     * @tc.desc   定长表 3 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010010 begin');
      const rec: Array<string> = arrExact('e30||e32');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e30","e32"]'));
      expect(JSON.stringify(result)).assertEqual('["e30","e32"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010010 end');
    })

    /**
     * @tc.name   testMainCompactVolume010011
     * @tc.number SUB_CCE_MAINCMP_01_0011
     * @tc.desc   定长表 3 槽位含空串时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010011 begin');
      const rec: Array<string> = arrExact('||e32');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e32"]'));
      expect(JSON.stringify(result)).assertEqual('["e32"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010011 end');
    })

    /**
     * @tc.name   testMainCompactVolume010012
     * @tc.number SUB_CCE_MAINCMP_01_0012
     * @tc.desc   定长表 3 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010012 begin');
      const rec: Array<string> = arrExact('e30|e31|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e30","e31"]'));
      expect(JSON.stringify(result)).assertEqual('["e30","e31"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010012 end');
    })

    /**
     * @tc.name   testMainCompactVolume010013
     * @tc.number SUB_CCE_MAINCMP_01_0013
     * @tc.desc   定长表 3 槽位含空串时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010013 begin');
      const rec: Array<string> = arrExact('|e31|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e31"]'));
      expect(JSON.stringify(result)).assertEqual('["e31"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010013 end');
    })

    /**
     * @tc.name   testMainCompactVolume010014
     * @tc.number SUB_CCE_MAINCMP_01_0014
     * @tc.desc   定长表 3 槽位含空串时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010014 begin');
      const rec: Array<string> = arrExact('e30||');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e30"]'));
      expect(JSON.stringify(result)).assertEqual('["e30"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010014 end');
    })

    /**
     * @tc.name   testMainCompactVolume010015
     * @tc.number SUB_CCE_MAINCMP_01_0015
     * @tc.desc   定长表 3 槽位含空串时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010015 begin');
      const rec: Array<string> = arrExact('||');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(3));
      expect(rec.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010015 end');
    })

    /**
     * @tc.name   testMainCompactVolume010016
     * @tc.number SUB_CCE_MAINCMP_01_0016
     * @tc.desc   定长表 4 槽位含空串时保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010016 begin');
      const rec: Array<string> = arrExact('e40|e41|e42|e43');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e40","e41","e42","e43"]'));
      expect(JSON.stringify(result)).assertEqual('["e40","e41","e42","e43"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010016 end');
    })

    /**
     * @tc.name   testMainCompactVolume010017
     * @tc.number SUB_CCE_MAINCMP_01_0017
     * @tc.desc   定长表 4 槽位含空串时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010017 begin');
      const rec: Array<string> = arrExact('|e41|e42|e43');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e41","e42","e43"]'));
      expect(JSON.stringify(result)).assertEqual('["e41","e42","e43"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010017 end');
    })

    /**
     * @tc.name   testMainCompactVolume010018
     * @tc.number SUB_CCE_MAINCMP_01_0018
     * @tc.desc   定长表 4 槽位含空串时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010018 begin');
      const rec: Array<string> = arrExact('e40||e42|e43');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e40","e42","e43"]'));
      expect(JSON.stringify(result)).assertEqual('["e40","e42","e43"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010018 end');
    })

    /**
     * @tc.name   testMainCompactVolume010019
     * @tc.number SUB_CCE_MAINCMP_01_0019
     * @tc.desc   定长表 4 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010019 begin');
      const rec: Array<string> = arrExact('||e42|e43');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e42","e43"]'));
      expect(JSON.stringify(result)).assertEqual('["e42","e43"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010019 end');
    })

    /**
     * @tc.name   testMainCompactVolume010020
     * @tc.number SUB_CCE_MAINCMP_01_0020
     * @tc.desc   定长表 4 槽位含空串时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010020 begin');
      const rec: Array<string> = arrExact('e40|e41||e43');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e40","e41","e43"]'));
      expect(JSON.stringify(result)).assertEqual('["e40","e41","e43"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010020 end');
    })

    /**
     * @tc.name   testMainCompactVolume010021
     * @tc.number SUB_CCE_MAINCMP_01_0021
     * @tc.desc   定长表 4 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010021 begin');
      const rec: Array<string> = arrExact('|e41||e43');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e41","e43"]'));
      expect(JSON.stringify(result)).assertEqual('["e41","e43"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010021 end');
    })

    /**
     * @tc.name   testMainCompactVolume010022
     * @tc.number SUB_CCE_MAINCMP_01_0022
     * @tc.desc   定长表 4 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010022 begin');
      const rec: Array<string> = arrExact('e40|||e43');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e40","e43"]'));
      expect(JSON.stringify(result)).assertEqual('["e40","e43"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010022 end');
    })

    /**
     * @tc.name   testMainCompactVolume010023
     * @tc.number SUB_CCE_MAINCMP_01_0023
     * @tc.desc   定长表 4 槽位含空串时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010023 begin');
      const rec: Array<string> = arrExact('|||e43');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e43"]'));
      expect(JSON.stringify(result)).assertEqual('["e43"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010023 end');
    })

    /**
     * @tc.name   testMainCompactVolume010024
     * @tc.number SUB_CCE_MAINCMP_01_0024
     * @tc.desc   定长表 4 槽位含空串时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010024 begin');
      const rec: Array<string> = arrExact('e40|e41|e42|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e40","e41","e42"]'));
      expect(JSON.stringify(result)).assertEqual('["e40","e41","e42"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010024 end');
    })

    /**
     * @tc.name   testMainCompactVolume010025
     * @tc.number SUB_CCE_MAINCMP_01_0025
     * @tc.desc   定长表 4 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010025 begin');
      const rec: Array<string> = arrExact('|e41|e42|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e41","e42"]'));
      expect(JSON.stringify(result)).assertEqual('["e41","e42"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010025 end');
    })

    /**
     * @tc.name   testMainCompactVolume010026
     * @tc.number SUB_CCE_MAINCMP_01_0026
     * @tc.desc   定长表 4 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010026 begin');
      const rec: Array<string> = arrExact('e40||e42|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e40","e42"]'));
      expect(JSON.stringify(result)).assertEqual('["e40","e42"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010026 end');
    })

    /**
     * @tc.name   testMainCompactVolume010027
     * @tc.number SUB_CCE_MAINCMP_01_0027
     * @tc.desc   定长表 4 槽位含空串时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010027 begin');
      const rec: Array<string> = arrExact('||e42|');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e42"]'));
      expect(JSON.stringify(result)).assertEqual('["e42"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010027 end');
    })

    /**
     * @tc.name   testMainCompactVolume010028
     * @tc.number SUB_CCE_MAINCMP_01_0028
     * @tc.desc   定长表 4 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010028 begin');
      const rec: Array<string> = arrExact('e40|e41||');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e40","e41"]'));
      expect(JSON.stringify(result)).assertEqual('["e40","e41"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010028 end');
    })

    /**
     * @tc.name   testMainCompactVolume010029
     * @tc.number SUB_CCE_MAINCMP_01_0029
     * @tc.desc   定长表 4 槽位含空串时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010029 begin');
      const rec: Array<string> = arrExact('|e41||');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e41"]'));
      expect(JSON.stringify(result)).assertEqual('["e41"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010029 end');
    })

    /**
     * @tc.name   testMainCompactVolume010030
     * @tc.number SUB_CCE_MAINCMP_01_0030
     * @tc.desc   定长表 4 槽位含空串时保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010030 begin');
      const rec: Array<string> = arrExact('e40|||');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e40"]'));
      expect(JSON.stringify(result)).assertEqual('["e40"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010030 end');
    })

    /**
     * @tc.name   testMainCompactVolume010031
     * @tc.number SUB_CCE_MAINCMP_01_0031
     * @tc.desc   定长表 4 槽位含空串时保留 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010031 begin');
      const rec: Array<string> = arrExact('|||');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(4));
      expect(rec.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010031 end');
    })

    /**
     * @tc.name   testMainCompactVolume010032
     * @tc.number SUB_CCE_MAINCMP_01_0032
     * @tc.desc   定长表 5 槽位含空串时保留 5 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010032 begin');
      const rec: Array<string> = arrExact('n0|n1|n2|n3|n4');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["n0","n1","n2","n3","n4"]'));
      expect(JSON.stringify(result)).assertEqual('["n0","n1","n2","n3","n4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010032 end');
    })

    /**
     * @tc.name   testMainCompactVolume010033
     * @tc.number SUB_CCE_MAINCMP_01_0033
     * @tc.desc   定长表 5 槽位含空串时保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010033 begin');
      const rec: Array<string> = arrExact('|n1|n2|n3|n4');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["n1","n2","n3","n4"]'));
      expect(JSON.stringify(result)).assertEqual('["n1","n2","n3","n4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010033 end');
    })

    /**
     * @tc.name   testMainCompactVolume010034
     * @tc.number SUB_CCE_MAINCMP_01_0034
     * @tc.desc   定长表 5 槽位含空串时保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010034 begin');
      const rec: Array<string> = arrExact('n0||n2|n3|n4');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["n0","n2","n3","n4"]'));
      expect(JSON.stringify(result)).assertEqual('["n0","n2","n3","n4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010034 end');
    })

    /**
     * @tc.name   testMainCompactVolume010035
     * @tc.number SUB_CCE_MAINCMP_01_0035
     * @tc.desc   定长表 5 槽位含空串时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010035 begin');
      const rec: Array<string> = arrExact('||n2|n3|n4');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["n2","n3","n4"]'));
      expect(JSON.stringify(result)).assertEqual('["n2","n3","n4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010035 end');
    })

    /**
     * @tc.name   testMainCompactVolume010036
     * @tc.number SUB_CCE_MAINCMP_01_0036
     * @tc.desc   定长表 5 槽位含空串时保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010036 begin');
      const rec: Array<string> = arrExact('n0|n1||n3|n4');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["n0","n1","n3","n4"]'));
      expect(JSON.stringify(result)).assertEqual('["n0","n1","n3","n4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010036 end');
    })

    /**
     * @tc.name   testMainCompactVolume010037
     * @tc.number SUB_CCE_MAINCMP_01_0037
     * @tc.desc   定长表 5 槽位含空串时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010037 begin');
      const rec: Array<string> = arrExact('|n1||n3|n4');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["n1","n3","n4"]'));
      expect(JSON.stringify(result)).assertEqual('["n1","n3","n4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010037 end');
    })

    /**
     * @tc.name   testMainCompactVolume010038
     * @tc.number SUB_CCE_MAINCMP_01_0038
     * @tc.desc   定长表 5 槽位含空串时保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010038 begin');
      const rec: Array<string> = arrExact('n0|||n3|n4');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["n0","n3","n4"]'));
      expect(JSON.stringify(result)).assertEqual('["n0","n3","n4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010038 end');
    })

    /**
     * @tc.name   testMainCompactVolume010039
     * @tc.number SUB_CCE_MAINCMP_01_0039
     * @tc.desc   定长表 5 槽位含空串时保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010039 begin');
      const rec: Array<string> = arrExact('|||n3|n4');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["n3","n4"]'));
      expect(JSON.stringify(result)).assertEqual('["n3","n4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010039 end');
    })

    /**
     * @tc.name   testMainCompactVolume010040
     * @tc.number SUB_CCE_MAINCMP_01_0040
     * @tc.desc   定长表 5 槽位含空串时保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010040 begin');
      const rec: Array<string> = arrExact('n0|n1|n2||n4');
      const result: Array<string> = mainFeature.compactRecordedEvents(rec);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["n0","n1","n2","n4"]'));
      expect(JSON.stringify(result)).assertEqual('["n0","n1","n2","n4"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rec.length), String(5));
      expect(rec.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010040 end');
    })

    /**
     * @tc.name   testMainCompactVolume010041
     * @tc.number SUB_CCE_MAINCMP_01_0041
     * @tc.desc   全空串表过滤为空数组，混合表只保留非空槽位且入参不变
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMainCompactVolume010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010041 begin');
      const allBlank: Array<string> = ['', '', '', '', '', ''];
      const mixed: Array<string> = ['', 'a : 1', '', 'b : 2', '', 'c : 3'];
      const empty: Array<string> = mainFeature.compactRecordedEvents(allBlank);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(empty.length), '0');
      expect(empty.length).assertEqual(0);
      const kept: Array<string> = mainFeature.compactRecordedEvents(mixed);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(kept), '["a : 1","b : 2","c : 3"]');
      expect(JSON.stringify(kept)).assertEqual('["a : 1","b : 2","c : 3"]');
      expect(mixed.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainCompactVolume010041 end');
    })
  })
}
