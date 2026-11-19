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

export default function ContactSearchExtraGridMatrixPart3Test(): void {
  describe('ContactSearchExtraGridMatrixPart3', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_8100
     * @tc.name      testSearchExtra0081
     * @tc.desc      Verify search fixture 6 keyword ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0081 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0081 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_8200
     * @tc.name      testSearchExtra0082
     * @tc.desc      Verify search fixture 6 keyword 'person'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0082 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('person');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0082 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_8300
     * @tc.name      testSearchExtra0083
     * @tc.desc      Verify search fixture 6 keyword 'alpha'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0083 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0083 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_8400
     * @tc.name      testSearchExtra0084
     * @tc.desc      Verify search fixture 6 keyword 'beta'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0084 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0084 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_8500
     * @tc.name      testSearchExtra0085
     * @tc.desc      Verify search fixture 6 keyword 'gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0085 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('gamma');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0085 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_8600
     * @tc.name      testSearchExtra0086
     * @tc.desc      Verify search fixture 6 keyword 'team'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0086 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('team');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0086 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_8700
     * @tc.name      testSearchExtra0087
     * @tc.desc      Verify search fixture 6 keyword 'one'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0087 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('one');
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,3,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0087 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_8800
     * @tc.name      testSearchExtra0088
     * @tc.desc      Verify search fixture 6 keyword 'two'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0088 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('two');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0088 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_8900
     * @tc.name      testSearchExtra0089
     * @tc.desc      Verify search fixture 6 keyword 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0089 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('missing');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0089 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_9000
     * @tc.name      testSearchExtra0090
     * @tc.desc      Verify search fixture 6 keyword 'PERSON'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0090 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('PERSON');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0090 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_9100
     * @tc.name      testSearchExtra0091
     * @tc.desc      Verify search fixture 6 keyword '-3-'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0091 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', '13900001', 'team-5-one');
      store.add('person-5-beta', '13900002', 'team-5-two');
      store.add('person-5-gamma', '13900003', 'team-5-one');
      store.add('person-5-delta', '13900004', 'team-5-two');
      store.add('person-5-epsilon', '13900005', 'team-5-one');
      const hits: ContactItem[] = store.search('-3-');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0091 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_9200
     * @tc.name      testSearchExact0092
     * @tc.desc      Verify exact/uppercase search fixture 6 index 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0092 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', 'p0', 'team-5-one');
      store.add('person-5-beta', 'p1', 'team-5-two');
      store.add('person-5-gamma', 'p2', 'team-5-one');
      store.add('person-5-delta', 'p3', 'team-5-two');
      store.add('person-5-epsilon', 'p4', 'team-5-one');
      expect(store.search('person-5-alpha').length).assertEqual(1);
      expect(store.search('PERSON-5-ALPHA').length).assertEqual(1);
      expect(store.search('team-5-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0092 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_9300
     * @tc.name      testSearchExact0093
     * @tc.desc      Verify exact/uppercase search fixture 6 index 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0093 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', 'p0', 'team-5-one');
      store.add('person-5-beta', 'p1', 'team-5-two');
      store.add('person-5-gamma', 'p2', 'team-5-one');
      store.add('person-5-delta', 'p3', 'team-5-two');
      store.add('person-5-epsilon', 'p4', 'team-5-one');
      expect(store.search('person-5-beta').length).assertEqual(1);
      expect(store.search('PERSON-5-BETA').length).assertEqual(1);
      expect(store.search('team-5-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0093 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_9400
     * @tc.name      testSearchExact0094
     * @tc.desc      Verify exact/uppercase search fixture 6 index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0094 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', 'p0', 'team-5-one');
      store.add('person-5-beta', 'p1', 'team-5-two');
      store.add('person-5-gamma', 'p2', 'team-5-one');
      store.add('person-5-delta', 'p3', 'team-5-two');
      store.add('person-5-epsilon', 'p4', 'team-5-one');
      expect(store.search('person-5-gamma').length).assertEqual(1);
      expect(store.search('PERSON-5-GAMMA').length).assertEqual(1);
      expect(store.search('team-5-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0094 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_9500
     * @tc.name      testSearchExact0095
     * @tc.desc      Verify exact/uppercase search fixture 6 index 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0095 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', 'p0', 'team-5-one');
      store.add('person-5-beta', 'p1', 'team-5-two');
      store.add('person-5-gamma', 'p2', 'team-5-one');
      store.add('person-5-delta', 'p3', 'team-5-two');
      store.add('person-5-epsilon', 'p4', 'team-5-one');
      expect(store.search('person-5-delta').length).assertEqual(1);
      expect(store.search('PERSON-5-DELTA').length).assertEqual(1);
      expect(store.search('team-5-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0095 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_9600
     * @tc.name      testSearchExact0096
     * @tc.desc      Verify exact/uppercase search fixture 6 index 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0096 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-5-alpha', 'p0', 'team-5-one');
      store.add('person-5-beta', 'p1', 'team-5-two');
      store.add('person-5-gamma', 'p2', 'team-5-one');
      store.add('person-5-delta', 'p3', 'team-5-two');
      store.add('person-5-epsilon', 'p4', 'team-5-one');
      expect(store.search('person-5-epsilon').length).assertEqual(1);
      expect(store.search('PERSON-5-EPSILON').length).assertEqual(1);
      expect(store.search('team-5-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0096 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_9700
     * @tc.name      testSearchExtra0097
     * @tc.desc      Verify search fixture 7 keyword ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0097 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0097 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_9800
     * @tc.name      testSearchExtra0098
     * @tc.desc      Verify search fixture 7 keyword 'person'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0098 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('person');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0098 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_9900
     * @tc.name      testSearchExtra0099
     * @tc.desc      Verify search fixture 7 keyword 'alpha'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0099 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0099 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_10000
     * @tc.name      testSearchExtra0100
     * @tc.desc      Verify search fixture 7 keyword 'beta'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0100 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0100 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_10100
     * @tc.name      testSearchExtra0101
     * @tc.desc      Verify search fixture 7 keyword 'gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0101 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('gamma');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0101 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_10200
     * @tc.name      testSearchExtra0102
     * @tc.desc      Verify search fixture 7 keyword 'team'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0102 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('team');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0102 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_10300
     * @tc.name      testSearchExtra0103
     * @tc.desc      Verify search fixture 7 keyword 'one'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0103 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('one');
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,3,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0103 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_10400
     * @tc.name      testSearchExtra0104
     * @tc.desc      Verify search fixture 7 keyword 'two'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0104 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('two');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0104 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_10500
     * @tc.name      testSearchExtra0105
     * @tc.desc      Verify search fixture 7 keyword 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0105 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('missing');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0105 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_10600
     * @tc.name      testSearchExtra0106
     * @tc.desc      Verify search fixture 7 keyword 'PERSON'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0106 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('PERSON');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0106 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_10700
     * @tc.name      testSearchExtra0107
     * @tc.desc      Verify search fixture 7 keyword '-3-'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0107 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', '13900001', 'team-6-one');
      store.add('person-6-beta', '13900002', 'team-6-two');
      store.add('person-6-gamma', '13900003', 'team-6-one');
      store.add('person-6-delta', '13900004', 'team-6-two');
      store.add('person-6-epsilon', '13900005', 'team-6-one');
      const hits: ContactItem[] = store.search('-3-');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0107 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_10800
     * @tc.name      testSearchExact0108
     * @tc.desc      Verify exact/uppercase search fixture 7 index 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0108 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', 'p0', 'team-6-one');
      store.add('person-6-beta', 'p1', 'team-6-two');
      store.add('person-6-gamma', 'p2', 'team-6-one');
      store.add('person-6-delta', 'p3', 'team-6-two');
      store.add('person-6-epsilon', 'p4', 'team-6-one');
      expect(store.search('person-6-alpha').length).assertEqual(1);
      expect(store.search('PERSON-6-ALPHA').length).assertEqual(1);
      expect(store.search('team-6-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0108 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_10900
     * @tc.name      testSearchExact0109
     * @tc.desc      Verify exact/uppercase search fixture 7 index 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0109 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', 'p0', 'team-6-one');
      store.add('person-6-beta', 'p1', 'team-6-two');
      store.add('person-6-gamma', 'p2', 'team-6-one');
      store.add('person-6-delta', 'p3', 'team-6-two');
      store.add('person-6-epsilon', 'p4', 'team-6-one');
      expect(store.search('person-6-beta').length).assertEqual(1);
      expect(store.search('PERSON-6-BETA').length).assertEqual(1);
      expect(store.search('team-6-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0109 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_11000
     * @tc.name      testSearchExact0110
     * @tc.desc      Verify exact/uppercase search fixture 7 index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0110 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', 'p0', 'team-6-one');
      store.add('person-6-beta', 'p1', 'team-6-two');
      store.add('person-6-gamma', 'p2', 'team-6-one');
      store.add('person-6-delta', 'p3', 'team-6-two');
      store.add('person-6-epsilon', 'p4', 'team-6-one');
      expect(store.search('person-6-gamma').length).assertEqual(1);
      expect(store.search('PERSON-6-GAMMA').length).assertEqual(1);
      expect(store.search('team-6-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0110 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_11100
     * @tc.name      testSearchExact0111
     * @tc.desc      Verify exact/uppercase search fixture 7 index 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0111 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', 'p0', 'team-6-one');
      store.add('person-6-beta', 'p1', 'team-6-two');
      store.add('person-6-gamma', 'p2', 'team-6-one');
      store.add('person-6-delta', 'p3', 'team-6-two');
      store.add('person-6-epsilon', 'p4', 'team-6-one');
      expect(store.search('person-6-delta').length).assertEqual(1);
      expect(store.search('PERSON-6-DELTA').length).assertEqual(1);
      expect(store.search('team-6-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0111 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_11200
     * @tc.name      testSearchExact0112
     * @tc.desc      Verify exact/uppercase search fixture 7 index 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0112 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-6-alpha', 'p0', 'team-6-one');
      store.add('person-6-beta', 'p1', 'team-6-two');
      store.add('person-6-gamma', 'p2', 'team-6-one');
      store.add('person-6-delta', 'p3', 'team-6-two');
      store.add('person-6-epsilon', 'p4', 'team-6-one');
      expect(store.search('person-6-epsilon').length).assertEqual(1);
      expect(store.search('PERSON-6-EPSILON').length).assertEqual(1);
      expect(store.search('team-6-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0112 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_11300
     * @tc.name      testSearchExtra0113
     * @tc.desc      Verify search fixture 8 keyword ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0113 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0113 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_11400
     * @tc.name      testSearchExtra0114
     * @tc.desc      Verify search fixture 8 keyword 'person'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0114 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('person');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0114 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_11500
     * @tc.name      testSearchExtra0115
     * @tc.desc      Verify search fixture 8 keyword 'alpha'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0115 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0115 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_11600
     * @tc.name      testSearchExtra0116
     * @tc.desc      Verify search fixture 8 keyword 'beta'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0116 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0116 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_11700
     * @tc.name      testSearchExtra0117
     * @tc.desc      Verify search fixture 8 keyword 'gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0117 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('gamma');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0117 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_11800
     * @tc.name      testSearchExtra0118
     * @tc.desc      Verify search fixture 8 keyword 'team'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0118 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('team');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0118 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_11900
     * @tc.name      testSearchExtra0119
     * @tc.desc      Verify search fixture 8 keyword 'one'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0119 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('one');
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,3,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0119 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP3_12000
     * @tc.name      testSearchExtra0120
     * @tc.desc      Verify search fixture 8 keyword 'two'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0120 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-7-alpha', '13900001', 'team-7-one');
      store.add('person-7-beta', '13900002', 'team-7-two');
      store.add('person-7-gamma', '13900003', 'team-7-one');
      store.add('person-7-delta', '13900004', 'team-7-two');
      store.add('person-7-epsilon', '13900005', 'team-7-one');
      const hits: ContactItem[] = store.search('two');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0120 end');
    })

  })
}
