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
import { delayTick } from './shared/AsyncYield';
import { ContactStore, ContactItem } from '../../../main/ets/model/ListModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_ComposeList]';

export default function ContactSearchExtraGridMatrixPart4Test(): void {
  describe('ContactSearchExtraGridMatrixPart4', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_12100
     * @tc.name      testSearchExtra0121
     * @tc.desc      Verify search fixture 8 keyword 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0121 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('missing');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0121 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_12200
     * @tc.name      testSearchExtra0122
     * @tc.desc      Verify search fixture 8 keyword 'PERSON'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0122 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('PERSON');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0122 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_12300
     * @tc.name      testSearchExtra0123
     * @tc.desc      Verify search fixture 8 keyword '-3-'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0123 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('-3-');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0123 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_12400
     * @tc.name      testSearchExact0124
     * @tc.desc      Verify exact/uppercase search fixture 8 index 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0124 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', 'p0', 'team-7-one');
      store.add('person-7-beta', 'p1', 'team-7-two');
      store.add('person-7-gamma', 'p2', 'team-7-one');
      store.add('person-7-delta', 'p3', 'team-7-two');
      store.add('person-7-epsilon', 'p4', 'team-7-one');
      expect(store.search('person-7-alpha').length).assertEqual(1);
      expect(store.search('PERSON-7-ALPHA').length).assertEqual(1);
      expect(store.search('team-7-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0124 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_12500
     * @tc.name      testSearchExact0125
     * @tc.desc      Verify exact/uppercase search fixture 8 index 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0125 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', 'p0', 'team-7-one');
      store.add('person-7-beta', 'p1', 'team-7-two');
      store.add('person-7-gamma', 'p2', 'team-7-one');
      store.add('person-7-delta', 'p3', 'team-7-two');
      store.add('person-7-epsilon', 'p4', 'team-7-one');
      expect(store.search('person-7-beta').length).assertEqual(1);
      expect(store.search('PERSON-7-BETA').length).assertEqual(1);
      expect(store.search('team-7-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0125 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_12600
     * @tc.name      testSearchExact0126
     * @tc.desc      Verify exact/uppercase search fixture 8 index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0126 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', 'p0', 'team-7-one');
      store.add('person-7-beta', 'p1', 'team-7-two');
      store.add('person-7-gamma', 'p2', 'team-7-one');
      store.add('person-7-delta', 'p3', 'team-7-two');
      store.add('person-7-epsilon', 'p4', 'team-7-one');
      expect(store.search('person-7-gamma').length).assertEqual(1);
      expect(store.search('PERSON-7-GAMMA').length).assertEqual(1);
      expect(store.search('team-7-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0126 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_12700
     * @tc.name      testSearchExact0127
     * @tc.desc      Verify exact/uppercase search fixture 8 index 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0127 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', 'p0', 'team-7-one');
      store.add('person-7-beta', 'p1', 'team-7-two');
      store.add('person-7-gamma', 'p2', 'team-7-one');
      store.add('person-7-delta', 'p3', 'team-7-two');
      store.add('person-7-epsilon', 'p4', 'team-7-one');
      expect(store.search('person-7-delta').length).assertEqual(1);
      expect(store.search('PERSON-7-DELTA').length).assertEqual(1);
      expect(store.search('team-7-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0127 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_12800
     * @tc.name      testSearchExact0128
     * @tc.desc      Verify exact/uppercase search fixture 8 index 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0128 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', 'p0', 'team-7-one');
      store.add('person-7-beta', 'p1', 'team-7-two');
      store.add('person-7-gamma', 'p2', 'team-7-one');
      store.add('person-7-delta', 'p3', 'team-7-two');
      store.add('person-7-epsilon', 'p4', 'team-7-one');
      expect(store.search('person-7-epsilon').length).assertEqual(1);
      expect(store.search('PERSON-7-EPSILON').length).assertEqual(1);
      expect(store.search('team-7-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0128 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_12900
     * @tc.name      testSearchExtra0129
     * @tc.desc      Verify search fixture 9 keyword ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0129 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0129 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_13000
     * @tc.name      testSearchExtra0130
     * @tc.desc      Verify search fixture 9 keyword 'person'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0130 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('person');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0130 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_13100
     * @tc.name      testSearchExtra0131
     * @tc.desc      Verify search fixture 9 keyword 'alpha'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0131 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0131 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_13200
     * @tc.name      testSearchExtra0132
     * @tc.desc      Verify search fixture 9 keyword 'beta'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0132 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0132 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_13300
     * @tc.name      testSearchExtra0133
     * @tc.desc      Verify search fixture 9 keyword 'gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0133 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('gamma');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0133 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_13400
     * @tc.name      testSearchExtra0134
     * @tc.desc      Verify search fixture 9 keyword 'team'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0134 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('team');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0134 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_13500
     * @tc.name      testSearchExtra0135
     * @tc.desc      Verify search fixture 9 keyword 'one'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0135 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('one');
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,3,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0135 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_13600
     * @tc.name      testSearchExtra0136
     * @tc.desc      Verify search fixture 9 keyword 'two'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0136 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('two');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0136 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_13700
     * @tc.name      testSearchExtra0137
     * @tc.desc      Verify search fixture 9 keyword 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0137 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('missing');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0137 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_13800
     * @tc.name      testSearchExtra0138
     * @tc.desc      Verify search fixture 9 keyword 'PERSON'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0138 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('PERSON');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0138 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_13900
     * @tc.name      testSearchExtra0139
     * @tc.desc      Verify search fixture 9 keyword '-3-'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0139 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', '13900001', 'team-8-one');
      store.add('person-8-beta', '13900002', 'team-8-two');
      store.add('person-8-gamma', '13900003', 'team-8-one');
      store.add('person-8-delta', '13900004', 'team-8-two');
      store.add('person-8-epsilon', '13900005', 'team-8-one');
      const hits: ContactItem[] = store.search('-3-');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0139 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_14000
     * @tc.name      testSearchExact0140
     * @tc.desc      Verify exact/uppercase search fixture 9 index 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0140 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', 'p0', 'team-8-one');
      store.add('person-8-beta', 'p1', 'team-8-two');
      store.add('person-8-gamma', 'p2', 'team-8-one');
      store.add('person-8-delta', 'p3', 'team-8-two');
      store.add('person-8-epsilon', 'p4', 'team-8-one');
      expect(store.search('person-8-alpha').length).assertEqual(1);
      expect(store.search('PERSON-8-ALPHA').length).assertEqual(1);
      expect(store.search('team-8-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0140 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_14100
     * @tc.name      testSearchExact0141
     * @tc.desc      Verify exact/uppercase search fixture 9 index 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0141 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', 'p0', 'team-8-one');
      store.add('person-8-beta', 'p1', 'team-8-two');
      store.add('person-8-gamma', 'p2', 'team-8-one');
      store.add('person-8-delta', 'p3', 'team-8-two');
      store.add('person-8-epsilon', 'p4', 'team-8-one');
      expect(store.search('person-8-beta').length).assertEqual(1);
      expect(store.search('PERSON-8-BETA').length).assertEqual(1);
      expect(store.search('team-8-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0141 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_14200
     * @tc.name      testSearchExact0142
     * @tc.desc      Verify exact/uppercase search fixture 9 index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0142 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', 'p0', 'team-8-one');
      store.add('person-8-beta', 'p1', 'team-8-two');
      store.add('person-8-gamma', 'p2', 'team-8-one');
      store.add('person-8-delta', 'p3', 'team-8-two');
      store.add('person-8-epsilon', 'p4', 'team-8-one');
      expect(store.search('person-8-gamma').length).assertEqual(1);
      expect(store.search('PERSON-8-GAMMA').length).assertEqual(1);
      expect(store.search('team-8-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0142 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_14300
     * @tc.name      testSearchExact0143
     * @tc.desc      Verify exact/uppercase search fixture 9 index 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0143 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', 'p0', 'team-8-one');
      store.add('person-8-beta', 'p1', 'team-8-two');
      store.add('person-8-gamma', 'p2', 'team-8-one');
      store.add('person-8-delta', 'p3', 'team-8-two');
      store.add('person-8-epsilon', 'p4', 'team-8-one');
      expect(store.search('person-8-delta').length).assertEqual(1);
      expect(store.search('PERSON-8-DELTA').length).assertEqual(1);
      expect(store.search('team-8-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0143 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_14400
     * @tc.name      testSearchExact0144
     * @tc.desc      Verify exact/uppercase search fixture 9 index 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0144 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-8-alpha', 'p0', 'team-8-one');
      store.add('person-8-beta', 'p1', 'team-8-two');
      store.add('person-8-gamma', 'p2', 'team-8-one');
      store.add('person-8-delta', 'p3', 'team-8-two');
      store.add('person-8-epsilon', 'p4', 'team-8-one');
      expect(store.search('person-8-epsilon').length).assertEqual(1);
      expect(store.search('PERSON-8-EPSILON').length).assertEqual(1);
      expect(store.search('team-8-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0144 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_14500
     * @tc.name      testSearchExtra0145
     * @tc.desc      Verify search fixture 10 keyword ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0145 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0145 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_14600
     * @tc.name      testSearchExtra0146
     * @tc.desc      Verify search fixture 10 keyword 'person'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0146 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('person');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0146 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_14700
     * @tc.name      testSearchExtra0147
     * @tc.desc      Verify search fixture 10 keyword 'alpha'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0147 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0147 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_14800
     * @tc.name      testSearchExtra0148
     * @tc.desc      Verify search fixture 10 keyword 'beta'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0148 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0148 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_14900
     * @tc.name      testSearchExtra0149
     * @tc.desc      Verify search fixture 10 keyword 'gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0149 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('gamma');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0149 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_15000
     * @tc.name      testSearchExtra0150
     * @tc.desc      Verify search fixture 10 keyword 'team'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0150 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('team');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0150 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_15100
     * @tc.name      testSearchExtra0151
     * @tc.desc      Verify search fixture 10 keyword 'one'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0151 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('one');
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,3,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0151 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_15200
     * @tc.name      testSearchExtra0152
     * @tc.desc      Verify search fixture 10 keyword 'two'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0152 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('two');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0152 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_15300
     * @tc.name      testSearchExtra0153
     * @tc.desc      Verify search fixture 10 keyword 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0153 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('missing');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0153 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_15400
     * @tc.name      testSearchExtra0154
     * @tc.desc      Verify search fixture 10 keyword 'PERSON'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0154 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('PERSON');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0154 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_15500
     * @tc.name      testSearchExtra0155
     * @tc.desc      Verify search fixture 10 keyword '-3-'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0155 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', '13900001', 'team-9-one');
      store.add('person-9-beta', '13900002', 'team-9-two');
      store.add('person-9-gamma', '13900003', 'team-9-one');
      store.add('person-9-delta', '13900004', 'team-9-two');
      store.add('person-9-epsilon', '13900005', 'team-9-one');
      const hits: ContactItem[] = store.search('-3-');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0155 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_15600
     * @tc.name      testSearchExact0156
     * @tc.desc      Verify exact/uppercase search fixture 10 index 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0156 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', 'p0', 'team-9-one');
      store.add('person-9-beta', 'p1', 'team-9-two');
      store.add('person-9-gamma', 'p2', 'team-9-one');
      store.add('person-9-delta', 'p3', 'team-9-two');
      store.add('person-9-epsilon', 'p4', 'team-9-one');
      expect(store.search('person-9-alpha').length).assertEqual(1);
      expect(store.search('PERSON-9-ALPHA').length).assertEqual(1);
      expect(store.search('team-9-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0156 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_15700
     * @tc.name      testSearchExact0157
     * @tc.desc      Verify exact/uppercase search fixture 10 index 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0157 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', 'p0', 'team-9-one');
      store.add('person-9-beta', 'p1', 'team-9-two');
      store.add('person-9-gamma', 'p2', 'team-9-one');
      store.add('person-9-delta', 'p3', 'team-9-two');
      store.add('person-9-epsilon', 'p4', 'team-9-one');
      expect(store.search('person-9-beta').length).assertEqual(1);
      expect(store.search('PERSON-9-BETA').length).assertEqual(1);
      expect(store.search('team-9-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0157 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_15800
     * @tc.name      testSearchExact0158
     * @tc.desc      Verify exact/uppercase search fixture 10 index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0158 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', 'p0', 'team-9-one');
      store.add('person-9-beta', 'p1', 'team-9-two');
      store.add('person-9-gamma', 'p2', 'team-9-one');
      store.add('person-9-delta', 'p3', 'team-9-two');
      store.add('person-9-epsilon', 'p4', 'team-9-one');
      expect(store.search('person-9-gamma').length).assertEqual(1);
      expect(store.search('PERSON-9-GAMMA').length).assertEqual(1);
      expect(store.search('team-9-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0158 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_15900
     * @tc.name      testSearchExact0159
     * @tc.desc      Verify exact/uppercase search fixture 10 index 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0159 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', 'p0', 'team-9-one');
      store.add('person-9-beta', 'p1', 'team-9-two');
      store.add('person-9-gamma', 'p2', 'team-9-one');
      store.add('person-9-delta', 'p3', 'team-9-two');
      store.add('person-9-epsilon', 'p4', 'team-9-one');
      expect(store.search('person-9-delta').length).assertEqual(1);
      expect(store.search('PERSON-9-DELTA').length).assertEqual(1);
      expect(store.search('team-9-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0159 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP4_16000
     * @tc.name      testSearchExact0160
     * @tc.desc      Verify exact/uppercase search fixture 10 index 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0160 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-9-alpha', 'p0', 'team-9-one');
      store.add('person-9-beta', 'p1', 'team-9-two');
      store.add('person-9-gamma', 'p2', 'team-9-one');
      store.add('person-9-delta', 'p3', 'team-9-two');
      store.add('person-9-epsilon', 'p4', 'team-9-one');
      expect(store.search('person-9-epsilon').length).assertEqual(1);
      expect(store.search('PERSON-9-EPSILON').length).assertEqual(1);
      expect(store.search('team-9-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0160 end');
    })

  })
}
