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

export default function ContactScenarioGridMatrixPart1Test(): void {
  describe('ContactScenarioGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_0100
     * @tc.name      testScenarioGrid0001
     * @tc.desc      Verify 1 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0001 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n1-c1', '13800001', 'dept-1', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(0);
      expect(store.search('dept-1').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0001 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_0200
     * @tc.name      testScenarioGrid0002
     * @tc.desc      Verify 1 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0002 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n1-c1', '13800001', 'dept-2', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(0);
      expect(store.search('dept-2').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0002 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_0300
     * @tc.name      testScenarioGrid0003
     * @tc.desc      Verify 1 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0003 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n1-c1', '13800001', 'dept-3', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(0);
      expect(store.search('dept-3').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0003 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_0400
     * @tc.name      testScenarioGrid0004
     * @tc.desc      Verify 1 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0004 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n1-c1', '13800001', 'dept-4', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(0);
      expect(store.search('dept-4').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0004 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_0500
     * @tc.name      testScenarioGrid0005
     * @tc.desc      Verify 1 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0005 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n1-c1', '13800001', 'dept-5', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(0);
      expect(store.search('dept-5').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0005 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_0600
     * @tc.name      testScenarioGrid0006
     * @tc.desc      Verify 1 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0006 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n1-c1', '13800001', 'dept-6', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(0);
      expect(store.search('dept-6').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0006 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_0700
     * @tc.name      testScenarioGrid0007
     * @tc.desc      Verify 1 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0007 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n1-c1', '13800001', 'dept-7', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(0);
      expect(store.search('dept-7').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0007 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_0800
     * @tc.name      testScenarioGrid0008
     * @tc.desc      Verify 1 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0008 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n1-c1', '13800001', 'dept-8', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(0);
      expect(store.search('dept-8').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0008 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_0900
     * @tc.name      testScenarioGrid0009
     * @tc.desc      Verify 1 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0009 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n1-c1', '13800001', 'dept-9', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(0);
      expect(store.search('dept-9').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0009 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_1000
     * @tc.name      testScenarioGrid0010
     * @tc.desc      Verify 1 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0010 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n1-c1', '13800001', 'dept-10', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(0);
      expect(store.search('dept-10').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0010 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_1100
     * @tc.name      testScenarioGrid0011
     * @tc.desc      Verify 1 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0011 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n1-c1', '13800001', 'dept-11', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(0);
      expect(store.search('dept-11').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0011 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_1200
     * @tc.name      testScenarioGrid0012
     * @tc.desc      Verify 1 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0012 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n1-c1', '13800001', 'dept-12', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(0);
      expect(store.search('dept-12').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0012 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_1300
     * @tc.name      testScenarioGrid0013
     * @tc.desc      Verify 1 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0013 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n1-c1', '13800001', 'dept-13', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(0);
      expect(store.search('dept-13').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0013 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_1400
     * @tc.name      testScenarioGrid0014
     * @tc.desc      Verify 1 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0014 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n1-c1', '13800001', 'dept-14', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(0);
      expect(store.search('dept-14').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0014 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_1500
     * @tc.name      testScenarioGrid0015
     * @tc.desc      Verify 1 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0015 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n1-c1', '13800001', 'dept-15', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(0);
      expect(store.search('dept-15').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0015 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_1600
     * @tc.name      testScenarioGrid0016
     * @tc.desc      Verify 1 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0016 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n1-c1', '13800001', 'dept-16', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(0);
      expect(store.search('dept-16').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0016 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_1700
     * @tc.name      testScenarioGrid0017
     * @tc.desc      Verify 1 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0017 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n1-c1', '13800001', 'dept-17', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(0);
      expect(store.search('dept-17').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0017 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_1800
     * @tc.name      testScenarioGrid0018
     * @tc.desc      Verify 1 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0018 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n1-c1', '13800001', 'dept-18', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(0);
      expect(store.search('dept-18').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0018 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_1900
     * @tc.name      testScenarioGrid0019
     * @tc.desc      Verify 1 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0019 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n1-c1', '13800001', 'dept-19', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(0);
      expect(store.search('dept-19').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0019 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_2000
     * @tc.name      testScenarioGrid0020
     * @tc.desc      Verify 1 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0020 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n1-c1', '13800001', 'dept-20', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(0);
      expect(store.search('dept-20').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0020 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_2100
     * @tc.name      testScenarioGrid0021
     * @tc.desc      Verify 2 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0021 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n2-c1', '13800001', 'dept-1', false);
      store.add('s1n2-c2', '13800002', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(1);
      expect(store.search('dept-1').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0021 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_2200
     * @tc.name      testScenarioGrid0022
     * @tc.desc      Verify 2 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0022 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n2-c1', '13800001', 'dept-2', false);
      store.add('s2n2-c2', '13800002', 'dept-2', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(1);
      expect(store.search('dept-2').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0022 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_2300
     * @tc.name      testScenarioGrid0023
     * @tc.desc      Verify 2 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0023 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n2-c1', '13800001', 'dept-3', true);
      store.add('s3n2-c2', '13800002', 'dept-3', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(1);
      expect(store.search('dept-3').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0023 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_2400
     * @tc.name      testScenarioGrid0024
     * @tc.desc      Verify 2 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0024 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n2-c1', '13800001', 'dept-4', false);
      store.add('s4n2-c2', '13800002', 'dept-4', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(1);
      expect(store.search('dept-4').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0024 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_2500
     * @tc.name      testScenarioGrid0025
     * @tc.desc      Verify 2 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0025 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n2-c1', '13800001', 'dept-5', false);
      store.add('s5n2-c2', '13800002', 'dept-5', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(1);
      expect(store.search('dept-5').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0025 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_2600
     * @tc.name      testScenarioGrid0026
     * @tc.desc      Verify 2 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0026 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n2-c1', '13800001', 'dept-6', false);
      store.add('s6n2-c2', '13800002', 'dept-6', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(1);
      expect(store.search('dept-6').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0026 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_2700
     * @tc.name      testScenarioGrid0027
     * @tc.desc      Verify 2 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0027 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n2-c1', '13800001', 'dept-7', true);
      store.add('s7n2-c2', '13800002', 'dept-7', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(1);
      expect(store.search('dept-7').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0027 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_2800
     * @tc.name      testScenarioGrid0028
     * @tc.desc      Verify 2 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0028 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n2-c1', '13800001', 'dept-8', false);
      store.add('s8n2-c2', '13800002', 'dept-8', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(1);
      expect(store.search('dept-8').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0028 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_2900
     * @tc.name      testScenarioGrid0029
     * @tc.desc      Verify 2 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0029 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n2-c1', '13800001', 'dept-9', false);
      store.add('s9n2-c2', '13800002', 'dept-9', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(1);
      expect(store.search('dept-9').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0029 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_3000
     * @tc.name      testScenarioGrid0030
     * @tc.desc      Verify 2 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0030 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n2-c1', '13800001', 'dept-10', false);
      store.add('s10n2-c2', '13800002', 'dept-10', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(1);
      expect(store.search('dept-10').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0030 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_3100
     * @tc.name      testScenarioGrid0031
     * @tc.desc      Verify 2 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0031 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n2-c1', '13800001', 'dept-11', true);
      store.add('s11n2-c2', '13800002', 'dept-11', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(1);
      expect(store.search('dept-11').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0031 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_3200
     * @tc.name      testScenarioGrid0032
     * @tc.desc      Verify 2 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0032 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n2-c1', '13800001', 'dept-12', false);
      store.add('s12n2-c2', '13800002', 'dept-12', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(1);
      expect(store.search('dept-12').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0032 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_3300
     * @tc.name      testScenarioGrid0033
     * @tc.desc      Verify 2 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0033 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n2-c1', '13800001', 'dept-13', false);
      store.add('s13n2-c2', '13800002', 'dept-13', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(1);
      expect(store.search('dept-13').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0033 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_3400
     * @tc.name      testScenarioGrid0034
     * @tc.desc      Verify 2 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0034 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n2-c1', '13800001', 'dept-14', false);
      store.add('s14n2-c2', '13800002', 'dept-14', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(1);
      expect(store.search('dept-14').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0034 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_3500
     * @tc.name      testScenarioGrid0035
     * @tc.desc      Verify 2 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0035 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n2-c1', '13800001', 'dept-15', true);
      store.add('s15n2-c2', '13800002', 'dept-15', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(1);
      expect(store.search('dept-15').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0035 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_3600
     * @tc.name      testScenarioGrid0036
     * @tc.desc      Verify 2 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0036 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n2-c1', '13800001', 'dept-16', false);
      store.add('s16n2-c2', '13800002', 'dept-16', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(1);
      expect(store.search('dept-16').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0036 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_3700
     * @tc.name      testScenarioGrid0037
     * @tc.desc      Verify 2 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0037 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n2-c1', '13800001', 'dept-17', false);
      store.add('s17n2-c2', '13800002', 'dept-17', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(1);
      expect(store.search('dept-17').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0037 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_3800
     * @tc.name      testScenarioGrid0038
     * @tc.desc      Verify 2 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0038 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n2-c1', '13800001', 'dept-18', false);
      store.add('s18n2-c2', '13800002', 'dept-18', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(1);
      expect(store.search('dept-18').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0038 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_3900
     * @tc.name      testScenarioGrid0039
     * @tc.desc      Verify 2 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0039 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n2-c1', '13800001', 'dept-19', true);
      store.add('s19n2-c2', '13800002', 'dept-19', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(1);
      expect(store.search('dept-19').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0039 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP1_4000
     * @tc.name      testScenarioGrid0040
     * @tc.desc      Verify 2 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0040 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n2-c1', '13800001', 'dept-20', false);
      store.add('s20n2-c2', '13800002', 'dept-20', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(1);
      expect(store.search('dept-20').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0040 end');
    })

  })
}
