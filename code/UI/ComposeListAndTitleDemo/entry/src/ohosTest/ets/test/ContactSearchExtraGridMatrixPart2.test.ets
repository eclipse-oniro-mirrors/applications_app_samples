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

export default function ContactSearchExtraGridMatrixPart2Test(): void {
  describe('ContactSearchExtraGridMatrixPart2', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_4100
     * @tc.name      testSearchExtra0041
     * @tc.desc      Verify search fixture 3 keyword 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0041 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('missing');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0041 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_4200
     * @tc.name      testSearchExtra0042
     * @tc.desc      Verify search fixture 3 keyword 'PERSON'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0042 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('PERSON');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0042 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_4300
     * @tc.name      testSearchExtra0043
     * @tc.desc      Verify search fixture 3 keyword '-3-'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0043 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('-3-');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0043 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_4400
     * @tc.name      testSearchExact0044
     * @tc.desc      Verify exact/uppercase search fixture 3 index 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0044 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', 'p0', 'team-2-one');
      store.add('person-2-beta', 'p1', 'team-2-two');
      store.add('person-2-gamma', 'p2', 'team-2-one');
      store.add('person-2-delta', 'p3', 'team-2-two');
      store.add('person-2-epsilon', 'p4', 'team-2-one');
      expect(store.search('person-2-alpha').length).assertEqual(1);
      expect(store.search('PERSON-2-ALPHA').length).assertEqual(1);
      expect(store.search('team-2-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0044 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_4500
     * @tc.name      testSearchExact0045
     * @tc.desc      Verify exact/uppercase search fixture 3 index 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0045 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', 'p0', 'team-2-one');
      store.add('person-2-beta', 'p1', 'team-2-two');
      store.add('person-2-gamma', 'p2', 'team-2-one');
      store.add('person-2-delta', 'p3', 'team-2-two');
      store.add('person-2-epsilon', 'p4', 'team-2-one');
      expect(store.search('person-2-beta').length).assertEqual(1);
      expect(store.search('PERSON-2-BETA').length).assertEqual(1);
      expect(store.search('team-2-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0045 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_4600
     * @tc.name      testSearchExact0046
     * @tc.desc      Verify exact/uppercase search fixture 3 index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0046 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', 'p0', 'team-2-one');
      store.add('person-2-beta', 'p1', 'team-2-two');
      store.add('person-2-gamma', 'p2', 'team-2-one');
      store.add('person-2-delta', 'p3', 'team-2-two');
      store.add('person-2-epsilon', 'p4', 'team-2-one');
      expect(store.search('person-2-gamma').length).assertEqual(1);
      expect(store.search('PERSON-2-GAMMA').length).assertEqual(1);
      expect(store.search('team-2-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0046 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_4700
     * @tc.name      testSearchExact0047
     * @tc.desc      Verify exact/uppercase search fixture 3 index 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0047 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', 'p0', 'team-2-one');
      store.add('person-2-beta', 'p1', 'team-2-two');
      store.add('person-2-gamma', 'p2', 'team-2-one');
      store.add('person-2-delta', 'p3', 'team-2-two');
      store.add('person-2-epsilon', 'p4', 'team-2-one');
      expect(store.search('person-2-delta').length).assertEqual(1);
      expect(store.search('PERSON-2-DELTA').length).assertEqual(1);
      expect(store.search('team-2-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0047 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_4800
     * @tc.name      testSearchExact0048
     * @tc.desc      Verify exact/uppercase search fixture 3 index 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0048 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', 'p0', 'team-2-one');
      store.add('person-2-beta', 'p1', 'team-2-two');
      store.add('person-2-gamma', 'p2', 'team-2-one');
      store.add('person-2-delta', 'p3', 'team-2-two');
      store.add('person-2-epsilon', 'p4', 'team-2-one');
      expect(store.search('person-2-epsilon').length).assertEqual(1);
      expect(store.search('PERSON-2-EPSILON').length).assertEqual(1);
      expect(store.search('team-2-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0048 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_4900
     * @tc.name      testSearchExtra0049
     * @tc.desc      Verify search fixture 4 keyword ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0049 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0049 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_5000
     * @tc.name      testSearchExtra0050
     * @tc.desc      Verify search fixture 4 keyword 'person'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0050 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('person');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0050 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_5100
     * @tc.name      testSearchExtra0051
     * @tc.desc      Verify search fixture 4 keyword 'alpha'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0051 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0051 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_5200
     * @tc.name      testSearchExtra0052
     * @tc.desc      Verify search fixture 4 keyword 'beta'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0052 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0052 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_5300
     * @tc.name      testSearchExtra0053
     * @tc.desc      Verify search fixture 4 keyword 'gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0053 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('gamma');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0053 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_5400
     * @tc.name      testSearchExtra0054
     * @tc.desc      Verify search fixture 4 keyword 'team'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0054 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('team');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0054 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_5500
     * @tc.name      testSearchExtra0055
     * @tc.desc      Verify search fixture 4 keyword 'one'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0055 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('one');
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,3,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0055 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_5600
     * @tc.name      testSearchExtra0056
     * @tc.desc      Verify search fixture 4 keyword 'two'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0056 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('two');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0056 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_5700
     * @tc.name      testSearchExtra0057
     * @tc.desc      Verify search fixture 4 keyword 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0057 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('missing');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0057 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_5800
     * @tc.name      testSearchExtra0058
     * @tc.desc      Verify search fixture 4 keyword 'PERSON'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0058 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('PERSON');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0058 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_5900
     * @tc.name      testSearchExtra0059
     * @tc.desc      Verify search fixture 4 keyword '-3-'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0059 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', '13900001', 'team-3-one');
      store.add('person-3-beta', '13900002', 'team-3-two');
      store.add('person-3-gamma', '13900003', 'team-3-one');
      store.add('person-3-delta', '13900004', 'team-3-two');
      store.add('person-3-epsilon', '13900005', 'team-3-one');
      const hits: ContactItem[] = store.search('-3-');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0059 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_6000
     * @tc.name      testSearchExact0060
     * @tc.desc      Verify exact/uppercase search fixture 4 index 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0060 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', 'p0', 'team-3-one');
      store.add('person-3-beta', 'p1', 'team-3-two');
      store.add('person-3-gamma', 'p2', 'team-3-one');
      store.add('person-3-delta', 'p3', 'team-3-two');
      store.add('person-3-epsilon', 'p4', 'team-3-one');
      expect(store.search('person-3-alpha').length).assertEqual(1);
      expect(store.search('PERSON-3-ALPHA').length).assertEqual(1);
      expect(store.search('team-3-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0060 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_6100
     * @tc.name      testSearchExact0061
     * @tc.desc      Verify exact/uppercase search fixture 4 index 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0061 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', 'p0', 'team-3-one');
      store.add('person-3-beta', 'p1', 'team-3-two');
      store.add('person-3-gamma', 'p2', 'team-3-one');
      store.add('person-3-delta', 'p3', 'team-3-two');
      store.add('person-3-epsilon', 'p4', 'team-3-one');
      expect(store.search('person-3-beta').length).assertEqual(1);
      expect(store.search('PERSON-3-BETA').length).assertEqual(1);
      expect(store.search('team-3-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0061 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_6200
     * @tc.name      testSearchExact0062
     * @tc.desc      Verify exact/uppercase search fixture 4 index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0062 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', 'p0', 'team-3-one');
      store.add('person-3-beta', 'p1', 'team-3-two');
      store.add('person-3-gamma', 'p2', 'team-3-one');
      store.add('person-3-delta', 'p3', 'team-3-two');
      store.add('person-3-epsilon', 'p4', 'team-3-one');
      expect(store.search('person-3-gamma').length).assertEqual(1);
      expect(store.search('PERSON-3-GAMMA').length).assertEqual(1);
      expect(store.search('team-3-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0062 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_6300
     * @tc.name      testSearchExact0063
     * @tc.desc      Verify exact/uppercase search fixture 4 index 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0063 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', 'p0', 'team-3-one');
      store.add('person-3-beta', 'p1', 'team-3-two');
      store.add('person-3-gamma', 'p2', 'team-3-one');
      store.add('person-3-delta', 'p3', 'team-3-two');
      store.add('person-3-epsilon', 'p4', 'team-3-one');
      expect(store.search('person-3-delta').length).assertEqual(1);
      expect(store.search('PERSON-3-DELTA').length).assertEqual(1);
      expect(store.search('team-3-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0063 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_6400
     * @tc.name      testSearchExact0064
     * @tc.desc      Verify exact/uppercase search fixture 4 index 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0064 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-3-alpha', 'p0', 'team-3-one');
      store.add('person-3-beta', 'p1', 'team-3-two');
      store.add('person-3-gamma', 'p2', 'team-3-one');
      store.add('person-3-delta', 'p3', 'team-3-two');
      store.add('person-3-epsilon', 'p4', 'team-3-one');
      expect(store.search('person-3-epsilon').length).assertEqual(1);
      expect(store.search('PERSON-3-EPSILON').length).assertEqual(1);
      expect(store.search('team-3-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0064 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_6500
     * @tc.name      testSearchExtra0065
     * @tc.desc      Verify search fixture 5 keyword ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0065 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0065 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_6600
     * @tc.name      testSearchExtra0066
     * @tc.desc      Verify search fixture 5 keyword 'person'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0066 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('person');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0066 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_6700
     * @tc.name      testSearchExtra0067
     * @tc.desc      Verify search fixture 5 keyword 'alpha'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0067 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0067 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_6800
     * @tc.name      testSearchExtra0068
     * @tc.desc      Verify search fixture 5 keyword 'beta'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0068 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0068 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_6900
     * @tc.name      testSearchExtra0069
     * @tc.desc      Verify search fixture 5 keyword 'gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0069 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('gamma');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0069 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_7000
     * @tc.name      testSearchExtra0070
     * @tc.desc      Verify search fixture 5 keyword 'team'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0070 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('team');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0070 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_7100
     * @tc.name      testSearchExtra0071
     * @tc.desc      Verify search fixture 5 keyword 'one'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0071 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('one');
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,3,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0071 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_7200
     * @tc.name      testSearchExtra0072
     * @tc.desc      Verify search fixture 5 keyword 'two'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0072 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('two');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0072 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_7300
     * @tc.name      testSearchExtra0073
     * @tc.desc      Verify search fixture 5 keyword 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0073 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('missing');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0073 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_7400
     * @tc.name      testSearchExtra0074
     * @tc.desc      Verify search fixture 5 keyword 'PERSON'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0074 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('PERSON');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0074 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_7500
     * @tc.name      testSearchExtra0075
     * @tc.desc      Verify search fixture 5 keyword '-3-'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0075 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', '13900001', 'team-4-one');
      store.add('person-4-beta', '13900002', 'team-4-two');
      store.add('person-4-gamma', '13900003', 'team-4-one');
      store.add('person-4-delta', '13900004', 'team-4-two');
      store.add('person-4-epsilon', '13900005', 'team-4-one');
      const hits: ContactItem[] = store.search('-3-');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0075 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_7600
     * @tc.name      testSearchExact0076
     * @tc.desc      Verify exact/uppercase search fixture 5 index 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0076 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', 'p0', 'team-4-one');
      store.add('person-4-beta', 'p1', 'team-4-two');
      store.add('person-4-gamma', 'p2', 'team-4-one');
      store.add('person-4-delta', 'p3', 'team-4-two');
      store.add('person-4-epsilon', 'p4', 'team-4-one');
      expect(store.search('person-4-alpha').length).assertEqual(1);
      expect(store.search('PERSON-4-ALPHA').length).assertEqual(1);
      expect(store.search('team-4-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0076 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_7700
     * @tc.name      testSearchExact0077
     * @tc.desc      Verify exact/uppercase search fixture 5 index 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0077 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', 'p0', 'team-4-one');
      store.add('person-4-beta', 'p1', 'team-4-two');
      store.add('person-4-gamma', 'p2', 'team-4-one');
      store.add('person-4-delta', 'p3', 'team-4-two');
      store.add('person-4-epsilon', 'p4', 'team-4-one');
      expect(store.search('person-4-beta').length).assertEqual(1);
      expect(store.search('PERSON-4-BETA').length).assertEqual(1);
      expect(store.search('team-4-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0077 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_7800
     * @tc.name      testSearchExact0078
     * @tc.desc      Verify exact/uppercase search fixture 5 index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0078 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', 'p0', 'team-4-one');
      store.add('person-4-beta', 'p1', 'team-4-two');
      store.add('person-4-gamma', 'p2', 'team-4-one');
      store.add('person-4-delta', 'p3', 'team-4-two');
      store.add('person-4-epsilon', 'p4', 'team-4-one');
      expect(store.search('person-4-gamma').length).assertEqual(1);
      expect(store.search('PERSON-4-GAMMA').length).assertEqual(1);
      expect(store.search('team-4-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0078 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_7900
     * @tc.name      testSearchExact0079
     * @tc.desc      Verify exact/uppercase search fixture 5 index 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0079 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', 'p0', 'team-4-one');
      store.add('person-4-beta', 'p1', 'team-4-two');
      store.add('person-4-gamma', 'p2', 'team-4-one');
      store.add('person-4-delta', 'p3', 'team-4-two');
      store.add('person-4-epsilon', 'p4', 'team-4-one');
      expect(store.search('person-4-delta').length).assertEqual(1);
      expect(store.search('PERSON-4-DELTA').length).assertEqual(1);
      expect(store.search('team-4-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0079 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP2_8000
     * @tc.name      testSearchExact0080
     * @tc.desc      Verify exact/uppercase search fixture 5 index 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0080 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-4-alpha', 'p0', 'team-4-one');
      store.add('person-4-beta', 'p1', 'team-4-two');
      store.add('person-4-gamma', 'p2', 'team-4-one');
      store.add('person-4-delta', 'p3', 'team-4-two');
      store.add('person-4-epsilon', 'p4', 'team-4-one');
      expect(store.search('person-4-epsilon').length).assertEqual(1);
      expect(store.search('PERSON-4-EPSILON').length).assertEqual(1);
      expect(store.search('team-4-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0080 end');
    })

  })
}
