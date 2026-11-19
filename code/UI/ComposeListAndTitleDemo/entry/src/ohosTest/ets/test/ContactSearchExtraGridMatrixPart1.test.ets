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

export default function ContactSearchExtraGridMatrixPart1Test(): void {
  describe('ContactSearchExtraGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_0100
     * @tc.name      testSearchExtra0001
     * @tc.desc      Verify search fixture 1 keyword ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0001 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0001 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_0200
     * @tc.name      testSearchExtra0002
     * @tc.desc      Verify search fixture 1 keyword 'person'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0002 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('person');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0002 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_0300
     * @tc.name      testSearchExtra0003
     * @tc.desc      Verify search fixture 1 keyword 'alpha'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0003 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0003 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_0400
     * @tc.name      testSearchExtra0004
     * @tc.desc      Verify search fixture 1 keyword 'beta'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0004 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0004 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_0500
     * @tc.name      testSearchExtra0005
     * @tc.desc      Verify search fixture 1 keyword 'gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0005 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('gamma');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0005 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_0600
     * @tc.name      testSearchExtra0006
     * @tc.desc      Verify search fixture 1 keyword 'team'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0006 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('team');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0006 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_0700
     * @tc.name      testSearchExtra0007
     * @tc.desc      Verify search fixture 1 keyword 'one'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0007 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('one');
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,3,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0007 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_0800
     * @tc.name      testSearchExtra0008
     * @tc.desc      Verify search fixture 1 keyword 'two'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0008 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('two');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0008 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_0900
     * @tc.name      testSearchExtra0009
     * @tc.desc      Verify search fixture 1 keyword 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0009 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('missing');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0009 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_1000
     * @tc.name      testSearchExtra0010
     * @tc.desc      Verify search fixture 1 keyword 'PERSON'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0010 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('PERSON');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0010 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_1100
     * @tc.name      testSearchExtra0011
     * @tc.desc      Verify search fixture 1 keyword '-3-'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0011 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', '13900001', 'team-0-one');
      store.add('person-0-beta', '13900002', 'team-0-two');
      store.add('person-0-gamma', '13900003', 'team-0-one');
      store.add('person-0-delta', '13900004', 'team-0-two');
      store.add('person-0-epsilon', '13900005', 'team-0-one');
      const hits: ContactItem[] = store.search('-3-');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0011 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_1200
     * @tc.name      testSearchExact0012
     * @tc.desc      Verify exact/uppercase search fixture 1 index 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0012 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', 'p0', 'team-0-one');
      store.add('person-0-beta', 'p1', 'team-0-two');
      store.add('person-0-gamma', 'p2', 'team-0-one');
      store.add('person-0-delta', 'p3', 'team-0-two');
      store.add('person-0-epsilon', 'p4', 'team-0-one');
      expect(store.search('person-0-alpha').length).assertEqual(1);
      expect(store.search('PERSON-0-ALPHA').length).assertEqual(1);
      expect(store.search('team-0-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0012 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_1300
     * @tc.name      testSearchExact0013
     * @tc.desc      Verify exact/uppercase search fixture 1 index 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0013 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', 'p0', 'team-0-one');
      store.add('person-0-beta', 'p1', 'team-0-two');
      store.add('person-0-gamma', 'p2', 'team-0-one');
      store.add('person-0-delta', 'p3', 'team-0-two');
      store.add('person-0-epsilon', 'p4', 'team-0-one');
      expect(store.search('person-0-beta').length).assertEqual(1);
      expect(store.search('PERSON-0-BETA').length).assertEqual(1);
      expect(store.search('team-0-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0013 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_1400
     * @tc.name      testSearchExact0014
     * @tc.desc      Verify exact/uppercase search fixture 1 index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0014 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', 'p0', 'team-0-one');
      store.add('person-0-beta', 'p1', 'team-0-two');
      store.add('person-0-gamma', 'p2', 'team-0-one');
      store.add('person-0-delta', 'p3', 'team-0-two');
      store.add('person-0-epsilon', 'p4', 'team-0-one');
      expect(store.search('person-0-gamma').length).assertEqual(1);
      expect(store.search('PERSON-0-GAMMA').length).assertEqual(1);
      expect(store.search('team-0-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0014 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_1500
     * @tc.name      testSearchExact0015
     * @tc.desc      Verify exact/uppercase search fixture 1 index 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0015 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', 'p0', 'team-0-one');
      store.add('person-0-beta', 'p1', 'team-0-two');
      store.add('person-0-gamma', 'p2', 'team-0-one');
      store.add('person-0-delta', 'p3', 'team-0-two');
      store.add('person-0-epsilon', 'p4', 'team-0-one');
      expect(store.search('person-0-delta').length).assertEqual(1);
      expect(store.search('PERSON-0-DELTA').length).assertEqual(1);
      expect(store.search('team-0-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0015 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_1600
     * @tc.name      testSearchExact0016
     * @tc.desc      Verify exact/uppercase search fixture 1 index 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0016 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-0-alpha', 'p0', 'team-0-one');
      store.add('person-0-beta', 'p1', 'team-0-two');
      store.add('person-0-gamma', 'p2', 'team-0-one');
      store.add('person-0-delta', 'p3', 'team-0-two');
      store.add('person-0-epsilon', 'p4', 'team-0-one');
      expect(store.search('person-0-epsilon').length).assertEqual(1);
      expect(store.search('PERSON-0-EPSILON').length).assertEqual(1);
      expect(store.search('team-0-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0016 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_1700
     * @tc.name      testSearchExtra0017
     * @tc.desc      Verify search fixture 2 keyword ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0017 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0017 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_1800
     * @tc.name      testSearchExtra0018
     * @tc.desc      Verify search fixture 2 keyword 'person'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0018 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('person');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0018 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_1900
     * @tc.name      testSearchExtra0019
     * @tc.desc      Verify search fixture 2 keyword 'alpha'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0019 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0019 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_2000
     * @tc.name      testSearchExtra0020
     * @tc.desc      Verify search fixture 2 keyword 'beta'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0020 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0020 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_2100
     * @tc.name      testSearchExtra0021
     * @tc.desc      Verify search fixture 2 keyword 'gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0021 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('gamma');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0021 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_2200
     * @tc.name      testSearchExtra0022
     * @tc.desc      Verify search fixture 2 keyword 'team'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0022 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('team');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0022 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_2300
     * @tc.name      testSearchExtra0023
     * @tc.desc      Verify search fixture 2 keyword 'one'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0023 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('one');
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,3,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0023 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_2400
     * @tc.name      testSearchExtra0024
     * @tc.desc      Verify search fixture 2 keyword 'two'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0024 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('two');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0024 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_2500
     * @tc.name      testSearchExtra0025
     * @tc.desc      Verify search fixture 2 keyword 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0025 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('missing');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0025 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_2600
     * @tc.name      testSearchExtra0026
     * @tc.desc      Verify search fixture 2 keyword 'PERSON'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0026 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('PERSON');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0026 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_2700
     * @tc.name      testSearchExtra0027
     * @tc.desc      Verify search fixture 2 keyword '-3-'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0027 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', '13900001', 'team-1-one');
      store.add('person-1-beta', '13900002', 'team-1-two');
      store.add('person-1-gamma', '13900003', 'team-1-one');
      store.add('person-1-delta', '13900004', 'team-1-two');
      store.add('person-1-epsilon', '13900005', 'team-1-one');
      const hits: ContactItem[] = store.search('-3-');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0027 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_2800
     * @tc.name      testSearchExact0028
     * @tc.desc      Verify exact/uppercase search fixture 2 index 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0028 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', 'p0', 'team-1-one');
      store.add('person-1-beta', 'p1', 'team-1-two');
      store.add('person-1-gamma', 'p2', 'team-1-one');
      store.add('person-1-delta', 'p3', 'team-1-two');
      store.add('person-1-epsilon', 'p4', 'team-1-one');
      expect(store.search('person-1-alpha').length).assertEqual(1);
      expect(store.search('PERSON-1-ALPHA').length).assertEqual(1);
      expect(store.search('team-1-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0028 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_2900
     * @tc.name      testSearchExact0029
     * @tc.desc      Verify exact/uppercase search fixture 2 index 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0029 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', 'p0', 'team-1-one');
      store.add('person-1-beta', 'p1', 'team-1-two');
      store.add('person-1-gamma', 'p2', 'team-1-one');
      store.add('person-1-delta', 'p3', 'team-1-two');
      store.add('person-1-epsilon', 'p4', 'team-1-one');
      expect(store.search('person-1-beta').length).assertEqual(1);
      expect(store.search('PERSON-1-BETA').length).assertEqual(1);
      expect(store.search('team-1-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0029 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_3000
     * @tc.name      testSearchExact0030
     * @tc.desc      Verify exact/uppercase search fixture 2 index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0030 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', 'p0', 'team-1-one');
      store.add('person-1-beta', 'p1', 'team-1-two');
      store.add('person-1-gamma', 'p2', 'team-1-one');
      store.add('person-1-delta', 'p3', 'team-1-two');
      store.add('person-1-epsilon', 'p4', 'team-1-one');
      expect(store.search('person-1-gamma').length).assertEqual(1);
      expect(store.search('PERSON-1-GAMMA').length).assertEqual(1);
      expect(store.search('team-1-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0030 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_3100
     * @tc.name      testSearchExact0031
     * @tc.desc      Verify exact/uppercase search fixture 2 index 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0031 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', 'p0', 'team-1-one');
      store.add('person-1-beta', 'p1', 'team-1-two');
      store.add('person-1-gamma', 'p2', 'team-1-one');
      store.add('person-1-delta', 'p3', 'team-1-two');
      store.add('person-1-epsilon', 'p4', 'team-1-one');
      expect(store.search('person-1-delta').length).assertEqual(1);
      expect(store.search('PERSON-1-DELTA').length).assertEqual(1);
      expect(store.search('team-1-two').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0031 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_3200
     * @tc.name      testSearchExact0032
     * @tc.desc      Verify exact/uppercase search fixture 2 index 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExact0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0032 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-1-alpha', 'p0', 'team-1-one');
      store.add('person-1-beta', 'p1', 'team-1-two');
      store.add('person-1-gamma', 'p2', 'team-1-one');
      store.add('person-1-delta', 'p3', 'team-1-two');
      store.add('person-1-epsilon', 'p4', 'team-1-one');
      expect(store.search('person-1-epsilon').length).assertEqual(1);
      expect(store.search('PERSON-1-EPSILON').length).assertEqual(1);
      expect(store.search('team-1-one').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExact0032 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_3300
     * @tc.name      testSearchExtra0033
     * @tc.desc      Verify search fixture 3 keyword ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0033 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0033 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_3400
     * @tc.name      testSearchExtra0034
     * @tc.desc      Verify search fixture 3 keyword 'person'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0034 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('person');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0034 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_3500
     * @tc.name      testSearchExtra0035
     * @tc.desc      Verify search fixture 3 keyword 'alpha'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0035 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0035 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_3600
     * @tc.name      testSearchExtra0036
     * @tc.desc      Verify search fixture 3 keyword 'beta'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0036 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0036 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_3700
     * @tc.name      testSearchExtra0037
     * @tc.desc      Verify search fixture 3 keyword 'gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0037 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('gamma');
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0037 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_3800
     * @tc.name      testSearchExtra0038
     * @tc.desc      Verify search fixture 3 keyword 'team'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0038 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('team');
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0038 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_3900
     * @tc.name      testSearchExtra0039
     * @tc.desc      Verify search fixture 3 keyword 'one'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0039 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('one');
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,3,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0039 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSXP1_4000
     * @tc.name      testSearchExtra0040
     * @tc.desc      Verify search fixture 3 keyword 'two'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchExtra0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0040 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('person-2-alpha', '13900001', 'team-2-one');
      store.add('person-2-beta', '13900002', 'team-2-two');
      store.add('person-2-gamma', '13900003', 'team-2-one');
      store.add('person-2-delta', '13900004', 'team-2-two');
      store.add('person-2-epsilon', '13900005', 'team-2-one');
      const hits: ContactItem[] = store.search('two');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchExtra0040 end');
    })

  })
}
