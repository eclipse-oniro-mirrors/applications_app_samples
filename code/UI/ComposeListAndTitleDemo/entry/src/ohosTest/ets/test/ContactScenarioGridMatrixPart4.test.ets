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

export default function ContactScenarioGridMatrixPart4Test(): void {
  describe('ContactScenarioGridMatrixPart4', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_12100
     * @tc.name      testScenarioGrid0121
     * @tc.desc      Verify 7 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0121 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n7-c1', '13800001', 'dept-1', false);
      store.add('s1n7-c2', '13800002', 'dept-1', false);
      store.add('s1n7-c3', '13800003', 'dept-1', true);
      store.add('s1n7-c4', '13800004', 'dept-1', false);
      store.add('s1n7-c5', '13800005', 'dept-1', false);
      store.add('s1n7-c6', '13800006', 'dept-1', false);
      store.add('s1n7-c7', '13800007', 'dept-1', true);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(6);
      expect(store.search('dept-1').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0121 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_12200
     * @tc.name      testScenarioGrid0122
     * @tc.desc      Verify 7 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0122 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n7-c1', '13800001', 'dept-2', false);
      store.add('s2n7-c2', '13800002', 'dept-2', true);
      store.add('s2n7-c3', '13800003', 'dept-2', false);
      store.add('s2n7-c4', '13800004', 'dept-2', false);
      store.add('s2n7-c5', '13800005', 'dept-2', false);
      store.add('s2n7-c6', '13800006', 'dept-2', true);
      store.add('s2n7-c7', '13800007', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(6);
      expect(store.search('dept-2').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0122 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_12300
     * @tc.name      testScenarioGrid0123
     * @tc.desc      Verify 7 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0123 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n7-c1', '13800001', 'dept-3', true);
      store.add('s3n7-c2', '13800002', 'dept-3', false);
      store.add('s3n7-c3', '13800003', 'dept-3', false);
      store.add('s3n7-c4', '13800004', 'dept-3', false);
      store.add('s3n7-c5', '13800005', 'dept-3', true);
      store.add('s3n7-c6', '13800006', 'dept-3', false);
      store.add('s3n7-c7', '13800007', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(6);
      expect(store.search('dept-3').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0123 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_12400
     * @tc.name      testScenarioGrid0124
     * @tc.desc      Verify 7 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0124 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n7-c1', '13800001', 'dept-4', false);
      store.add('s4n7-c2', '13800002', 'dept-4', false);
      store.add('s4n7-c3', '13800003', 'dept-4', false);
      store.add('s4n7-c4', '13800004', 'dept-4', true);
      store.add('s4n7-c5', '13800005', 'dept-4', false);
      store.add('s4n7-c6', '13800006', 'dept-4', false);
      store.add('s4n7-c7', '13800007', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(6);
      expect(store.search('dept-4').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0124 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_12500
     * @tc.name      testScenarioGrid0125
     * @tc.desc      Verify 7 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0125 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n7-c1', '13800001', 'dept-5', false);
      store.add('s5n7-c2', '13800002', 'dept-5', false);
      store.add('s5n7-c3', '13800003', 'dept-5', true);
      store.add('s5n7-c4', '13800004', 'dept-5', false);
      store.add('s5n7-c5', '13800005', 'dept-5', false);
      store.add('s5n7-c6', '13800006', 'dept-5', false);
      store.add('s5n7-c7', '13800007', 'dept-5', true);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(6);
      expect(store.search('dept-5').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0125 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_12600
     * @tc.name      testScenarioGrid0126
     * @tc.desc      Verify 7 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0126 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n7-c1', '13800001', 'dept-6', false);
      store.add('s6n7-c2', '13800002', 'dept-6', true);
      store.add('s6n7-c3', '13800003', 'dept-6', false);
      store.add('s6n7-c4', '13800004', 'dept-6', false);
      store.add('s6n7-c5', '13800005', 'dept-6', false);
      store.add('s6n7-c6', '13800006', 'dept-6', true);
      store.add('s6n7-c7', '13800007', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(6);
      expect(store.search('dept-6').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0126 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_12700
     * @tc.name      testScenarioGrid0127
     * @tc.desc      Verify 7 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0127 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n7-c1', '13800001', 'dept-7', true);
      store.add('s7n7-c2', '13800002', 'dept-7', false);
      store.add('s7n7-c3', '13800003', 'dept-7', false);
      store.add('s7n7-c4', '13800004', 'dept-7', false);
      store.add('s7n7-c5', '13800005', 'dept-7', true);
      store.add('s7n7-c6', '13800006', 'dept-7', false);
      store.add('s7n7-c7', '13800007', 'dept-7', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(6);
      expect(store.search('dept-7').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0127 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_12800
     * @tc.name      testScenarioGrid0128
     * @tc.desc      Verify 7 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0128 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n7-c1', '13800001', 'dept-8', false);
      store.add('s8n7-c2', '13800002', 'dept-8', false);
      store.add('s8n7-c3', '13800003', 'dept-8', false);
      store.add('s8n7-c4', '13800004', 'dept-8', true);
      store.add('s8n7-c5', '13800005', 'dept-8', false);
      store.add('s8n7-c6', '13800006', 'dept-8', false);
      store.add('s8n7-c7', '13800007', 'dept-8', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(false);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(6);
      expect(store.search('dept-8').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0128 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_12900
     * @tc.name      testScenarioGrid0129
     * @tc.desc      Verify 7 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0129 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n7-c1', '13800001', 'dept-9', false);
      store.add('s9n7-c2', '13800002', 'dept-9', false);
      store.add('s9n7-c3', '13800003', 'dept-9', true);
      store.add('s9n7-c4', '13800004', 'dept-9', false);
      store.add('s9n7-c5', '13800005', 'dept-9', false);
      store.add('s9n7-c6', '13800006', 'dept-9', false);
      store.add('s9n7-c7', '13800007', 'dept-9', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(false);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(6);
      expect(store.search('dept-9').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0129 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_13000
     * @tc.name      testScenarioGrid0130
     * @tc.desc      Verify 7 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0130 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n7-c1', '13800001', 'dept-10', false);
      store.add('s10n7-c2', '13800002', 'dept-10', true);
      store.add('s10n7-c3', '13800003', 'dept-10', false);
      store.add('s10n7-c4', '13800004', 'dept-10', false);
      store.add('s10n7-c5', '13800005', 'dept-10', false);
      store.add('s10n7-c6', '13800006', 'dept-10', true);
      store.add('s10n7-c7', '13800007', 'dept-10', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(6);
      expect(store.search('dept-10').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0130 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_13100
     * @tc.name      testScenarioGrid0131
     * @tc.desc      Verify 7 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0131 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n7-c1', '13800001', 'dept-11', true);
      store.add('s11n7-c2', '13800002', 'dept-11', false);
      store.add('s11n7-c3', '13800003', 'dept-11', false);
      store.add('s11n7-c4', '13800004', 'dept-11', false);
      store.add('s11n7-c5', '13800005', 'dept-11', true);
      store.add('s11n7-c6', '13800006', 'dept-11', false);
      store.add('s11n7-c7', '13800007', 'dept-11', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(6);
      expect(store.search('dept-11').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0131 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_13200
     * @tc.name      testScenarioGrid0132
     * @tc.desc      Verify 7 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0132 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n7-c1', '13800001', 'dept-12', false);
      store.add('s12n7-c2', '13800002', 'dept-12', false);
      store.add('s12n7-c3', '13800003', 'dept-12', false);
      store.add('s12n7-c4', '13800004', 'dept-12', true);
      store.add('s12n7-c5', '13800005', 'dept-12', false);
      store.add('s12n7-c6', '13800006', 'dept-12', false);
      store.add('s12n7-c7', '13800007', 'dept-12', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(6);
      expect(store.search('dept-12').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0132 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_13300
     * @tc.name      testScenarioGrid0133
     * @tc.desc      Verify 7 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0133 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n7-c1', '13800001', 'dept-13', false);
      store.add('s13n7-c2', '13800002', 'dept-13', false);
      store.add('s13n7-c3', '13800003', 'dept-13', true);
      store.add('s13n7-c4', '13800004', 'dept-13', false);
      store.add('s13n7-c5', '13800005', 'dept-13', false);
      store.add('s13n7-c6', '13800006', 'dept-13', false);
      store.add('s13n7-c7', '13800007', 'dept-13', true);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(6);
      expect(store.search('dept-13').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0133 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_13400
     * @tc.name      testScenarioGrid0134
     * @tc.desc      Verify 7 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0134 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n7-c1', '13800001', 'dept-14', false);
      store.add('s14n7-c2', '13800002', 'dept-14', true);
      store.add('s14n7-c3', '13800003', 'dept-14', false);
      store.add('s14n7-c4', '13800004', 'dept-14', false);
      store.add('s14n7-c5', '13800005', 'dept-14', false);
      store.add('s14n7-c6', '13800006', 'dept-14', true);
      store.add('s14n7-c7', '13800007', 'dept-14', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(6);
      expect(store.search('dept-14').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0134 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_13500
     * @tc.name      testScenarioGrid0135
     * @tc.desc      Verify 7 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0135 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n7-c1', '13800001', 'dept-15', true);
      store.add('s15n7-c2', '13800002', 'dept-15', false);
      store.add('s15n7-c3', '13800003', 'dept-15', false);
      store.add('s15n7-c4', '13800004', 'dept-15', false);
      store.add('s15n7-c5', '13800005', 'dept-15', true);
      store.add('s15n7-c6', '13800006', 'dept-15', false);
      store.add('s15n7-c7', '13800007', 'dept-15', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(6);
      expect(store.search('dept-15').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0135 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_13600
     * @tc.name      testScenarioGrid0136
     * @tc.desc      Verify 7 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0136 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n7-c1', '13800001', 'dept-16', false);
      store.add('s16n7-c2', '13800002', 'dept-16', false);
      store.add('s16n7-c3', '13800003', 'dept-16', false);
      store.add('s16n7-c4', '13800004', 'dept-16', true);
      store.add('s16n7-c5', '13800005', 'dept-16', false);
      store.add('s16n7-c6', '13800006', 'dept-16', false);
      store.add('s16n7-c7', '13800007', 'dept-16', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(6);
      expect(store.search('dept-16').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0136 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_13700
     * @tc.name      testScenarioGrid0137
     * @tc.desc      Verify 7 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0137 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n7-c1', '13800001', 'dept-17', false);
      store.add('s17n7-c2', '13800002', 'dept-17', false);
      store.add('s17n7-c3', '13800003', 'dept-17', true);
      store.add('s17n7-c4', '13800004', 'dept-17', false);
      store.add('s17n7-c5', '13800005', 'dept-17', false);
      store.add('s17n7-c6', '13800006', 'dept-17', false);
      store.add('s17n7-c7', '13800007', 'dept-17', true);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(false);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(6);
      expect(store.search('dept-17').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0137 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_13800
     * @tc.name      testScenarioGrid0138
     * @tc.desc      Verify 7 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0138 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n7-c1', '13800001', 'dept-18', false);
      store.add('s18n7-c2', '13800002', 'dept-18', true);
      store.add('s18n7-c3', '13800003', 'dept-18', false);
      store.add('s18n7-c4', '13800004', 'dept-18', false);
      store.add('s18n7-c5', '13800005', 'dept-18', false);
      store.add('s18n7-c6', '13800006', 'dept-18', true);
      store.add('s18n7-c7', '13800007', 'dept-18', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(false);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(6);
      expect(store.search('dept-18').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0138 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_13900
     * @tc.name      testScenarioGrid0139
     * @tc.desc      Verify 7 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0139 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n7-c1', '13800001', 'dept-19', true);
      store.add('s19n7-c2', '13800002', 'dept-19', false);
      store.add('s19n7-c3', '13800003', 'dept-19', false);
      store.add('s19n7-c4', '13800004', 'dept-19', false);
      store.add('s19n7-c5', '13800005', 'dept-19', true);
      store.add('s19n7-c6', '13800006', 'dept-19', false);
      store.add('s19n7-c7', '13800007', 'dept-19', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(6);
      expect(store.search('dept-19').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0139 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_14000
     * @tc.name      testScenarioGrid0140
     * @tc.desc      Verify 7 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0140 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n7-c1', '13800001', 'dept-20', false);
      store.add('s20n7-c2', '13800002', 'dept-20', false);
      store.add('s20n7-c3', '13800003', 'dept-20', false);
      store.add('s20n7-c4', '13800004', 'dept-20', true);
      store.add('s20n7-c5', '13800005', 'dept-20', false);
      store.add('s20n7-c6', '13800006', 'dept-20', false);
      store.add('s20n7-c7', '13800007', 'dept-20', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(6);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(6);
      expect(store.search('dept-20').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0140 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_14100
     * @tc.name      testScenarioGrid0141
     * @tc.desc      Verify 8 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0141 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n8-c1', '13800001', 'dept-1', false);
      store.add('s1n8-c2', '13800002', 'dept-1', false);
      store.add('s1n8-c3', '13800003', 'dept-1', true);
      store.add('s1n8-c4', '13800004', 'dept-1', false);
      store.add('s1n8-c5', '13800005', 'dept-1', false);
      store.add('s1n8-c6', '13800006', 'dept-1', false);
      store.add('s1n8-c7', '13800007', 'dept-1', true);
      store.add('s1n8-c8', '13800008', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(7);
      expect(store.search('dept-1').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0141 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_14200
     * @tc.name      testScenarioGrid0142
     * @tc.desc      Verify 8 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0142 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n8-c1', '13800001', 'dept-2', false);
      store.add('s2n8-c2', '13800002', 'dept-2', true);
      store.add('s2n8-c3', '13800003', 'dept-2', false);
      store.add('s2n8-c4', '13800004', 'dept-2', false);
      store.add('s2n8-c5', '13800005', 'dept-2', false);
      store.add('s2n8-c6', '13800006', 'dept-2', true);
      store.add('s2n8-c7', '13800007', 'dept-2', false);
      store.add('s2n8-c8', '13800008', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(7);
      expect(store.search('dept-2').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0142 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_14300
     * @tc.name      testScenarioGrid0143
     * @tc.desc      Verify 8 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0143 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n8-c1', '13800001', 'dept-3', true);
      store.add('s3n8-c2', '13800002', 'dept-3', false);
      store.add('s3n8-c3', '13800003', 'dept-3', false);
      store.add('s3n8-c4', '13800004', 'dept-3', false);
      store.add('s3n8-c5', '13800005', 'dept-3', true);
      store.add('s3n8-c6', '13800006', 'dept-3', false);
      store.add('s3n8-c7', '13800007', 'dept-3', false);
      store.add('s3n8-c8', '13800008', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(7);
      expect(store.search('dept-3').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0143 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_14400
     * @tc.name      testScenarioGrid0144
     * @tc.desc      Verify 8 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0144 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n8-c1', '13800001', 'dept-4', false);
      store.add('s4n8-c2', '13800002', 'dept-4', false);
      store.add('s4n8-c3', '13800003', 'dept-4', false);
      store.add('s4n8-c4', '13800004', 'dept-4', true);
      store.add('s4n8-c5', '13800005', 'dept-4', false);
      store.add('s4n8-c6', '13800006', 'dept-4', false);
      store.add('s4n8-c7', '13800007', 'dept-4', false);
      store.add('s4n8-c8', '13800008', 'dept-4', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(null);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(7);
      expect(store.search('dept-4').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0144 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_14500
     * @tc.name      testScenarioGrid0145
     * @tc.desc      Verify 8 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0145 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n8-c1', '13800001', 'dept-5', false);
      store.add('s5n8-c2', '13800002', 'dept-5', false);
      store.add('s5n8-c3', '13800003', 'dept-5', true);
      store.add('s5n8-c4', '13800004', 'dept-5', false);
      store.add('s5n8-c5', '13800005', 'dept-5', false);
      store.add('s5n8-c6', '13800006', 'dept-5', false);
      store.add('s5n8-c7', '13800007', 'dept-5', true);
      store.add('s5n8-c8', '13800008', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(7);
      expect(store.search('dept-5').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0145 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_14600
     * @tc.name      testScenarioGrid0146
     * @tc.desc      Verify 8 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0146 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n8-c1', '13800001', 'dept-6', false);
      store.add('s6n8-c2', '13800002', 'dept-6', true);
      store.add('s6n8-c3', '13800003', 'dept-6', false);
      store.add('s6n8-c4', '13800004', 'dept-6', false);
      store.add('s6n8-c5', '13800005', 'dept-6', false);
      store.add('s6n8-c6', '13800006', 'dept-6', true);
      store.add('s6n8-c7', '13800007', 'dept-6', false);
      store.add('s6n8-c8', '13800008', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(7);
      expect(store.search('dept-6').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0146 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_14700
     * @tc.name      testScenarioGrid0147
     * @tc.desc      Verify 8 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0147 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n8-c1', '13800001', 'dept-7', true);
      store.add('s7n8-c2', '13800002', 'dept-7', false);
      store.add('s7n8-c3', '13800003', 'dept-7', false);
      store.add('s7n8-c4', '13800004', 'dept-7', false);
      store.add('s7n8-c5', '13800005', 'dept-7', true);
      store.add('s7n8-c6', '13800006', 'dept-7', false);
      store.add('s7n8-c7', '13800007', 'dept-7', false);
      store.add('s7n8-c8', '13800008', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(7);
      expect(store.search('dept-7').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0147 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_14800
     * @tc.name      testScenarioGrid0148
     * @tc.desc      Verify 8 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0148 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n8-c1', '13800001', 'dept-8', false);
      store.add('s8n8-c2', '13800002', 'dept-8', false);
      store.add('s8n8-c3', '13800003', 'dept-8', false);
      store.add('s8n8-c4', '13800004', 'dept-8', true);
      store.add('s8n8-c5', '13800005', 'dept-8', false);
      store.add('s8n8-c6', '13800006', 'dept-8', false);
      store.add('s8n8-c7', '13800007', 'dept-8', false);
      store.add('s8n8-c8', '13800008', 'dept-8', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(7);
      expect(store.search('dept-8').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0148 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_14900
     * @tc.name      testScenarioGrid0149
     * @tc.desc      Verify 8 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0149 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n8-c1', '13800001', 'dept-9', false);
      store.add('s9n8-c2', '13800002', 'dept-9', false);
      store.add('s9n8-c3', '13800003', 'dept-9', true);
      store.add('s9n8-c4', '13800004', 'dept-9', false);
      store.add('s9n8-c5', '13800005', 'dept-9', false);
      store.add('s9n8-c6', '13800006', 'dept-9', false);
      store.add('s9n8-c7', '13800007', 'dept-9', true);
      store.add('s9n8-c8', '13800008', 'dept-9', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(7);
      expect(store.search('dept-9').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0149 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_15000
     * @tc.name      testScenarioGrid0150
     * @tc.desc      Verify 8 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0150 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n8-c1', '13800001', 'dept-10', false);
      store.add('s10n8-c2', '13800002', 'dept-10', true);
      store.add('s10n8-c3', '13800003', 'dept-10', false);
      store.add('s10n8-c4', '13800004', 'dept-10', false);
      store.add('s10n8-c5', '13800005', 'dept-10', false);
      store.add('s10n8-c6', '13800006', 'dept-10', true);
      store.add('s10n8-c7', '13800007', 'dept-10', false);
      store.add('s10n8-c8', '13800008', 'dept-10', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(7);
      expect(store.search('dept-10').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0150 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_15100
     * @tc.name      testScenarioGrid0151
     * @tc.desc      Verify 8 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0151 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n8-c1', '13800001', 'dept-11', true);
      store.add('s11n8-c2', '13800002', 'dept-11', false);
      store.add('s11n8-c3', '13800003', 'dept-11', false);
      store.add('s11n8-c4', '13800004', 'dept-11', false);
      store.add('s11n8-c5', '13800005', 'dept-11', true);
      store.add('s11n8-c6', '13800006', 'dept-11', false);
      store.add('s11n8-c7', '13800007', 'dept-11', false);
      store.add('s11n8-c8', '13800008', 'dept-11', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(7);
      expect(store.search('dept-11').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0151 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_15200
     * @tc.name      testScenarioGrid0152
     * @tc.desc      Verify 8 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0152 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n8-c1', '13800001', 'dept-12', false);
      store.add('s12n8-c2', '13800002', 'dept-12', false);
      store.add('s12n8-c3', '13800003', 'dept-12', false);
      store.add('s12n8-c4', '13800004', 'dept-12', true);
      store.add('s12n8-c5', '13800005', 'dept-12', false);
      store.add('s12n8-c6', '13800006', 'dept-12', false);
      store.add('s12n8-c7', '13800007', 'dept-12', false);
      store.add('s12n8-c8', '13800008', 'dept-12', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(null);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(7);
      expect(store.search('dept-12').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0152 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_15300
     * @tc.name      testScenarioGrid0153
     * @tc.desc      Verify 8 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0153 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n8-c1', '13800001', 'dept-13', false);
      store.add('s13n8-c2', '13800002', 'dept-13', false);
      store.add('s13n8-c3', '13800003', 'dept-13', true);
      store.add('s13n8-c4', '13800004', 'dept-13', false);
      store.add('s13n8-c5', '13800005', 'dept-13', false);
      store.add('s13n8-c6', '13800006', 'dept-13', false);
      store.add('s13n8-c7', '13800007', 'dept-13', true);
      store.add('s13n8-c8', '13800008', 'dept-13', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(7);
      expect(store.search('dept-13').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0153 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_15400
     * @tc.name      testScenarioGrid0154
     * @tc.desc      Verify 8 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0154 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n8-c1', '13800001', 'dept-14', false);
      store.add('s14n8-c2', '13800002', 'dept-14', true);
      store.add('s14n8-c3', '13800003', 'dept-14', false);
      store.add('s14n8-c4', '13800004', 'dept-14', false);
      store.add('s14n8-c5', '13800005', 'dept-14', false);
      store.add('s14n8-c6', '13800006', 'dept-14', true);
      store.add('s14n8-c7', '13800007', 'dept-14', false);
      store.add('s14n8-c8', '13800008', 'dept-14', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(7);
      expect(store.search('dept-14').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0154 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_15500
     * @tc.name      testScenarioGrid0155
     * @tc.desc      Verify 8 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0155 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n8-c1', '13800001', 'dept-15', true);
      store.add('s15n8-c2', '13800002', 'dept-15', false);
      store.add('s15n8-c3', '13800003', 'dept-15', false);
      store.add('s15n8-c4', '13800004', 'dept-15', false);
      store.add('s15n8-c5', '13800005', 'dept-15', true);
      store.add('s15n8-c6', '13800006', 'dept-15', false);
      store.add('s15n8-c7', '13800007', 'dept-15', false);
      store.add('s15n8-c8', '13800008', 'dept-15', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(7);
      expect(store.search('dept-15').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0155 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_15600
     * @tc.name      testScenarioGrid0156
     * @tc.desc      Verify 8 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0156 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n8-c1', '13800001', 'dept-16', false);
      store.add('s16n8-c2', '13800002', 'dept-16', false);
      store.add('s16n8-c3', '13800003', 'dept-16', false);
      store.add('s16n8-c4', '13800004', 'dept-16', true);
      store.add('s16n8-c5', '13800005', 'dept-16', false);
      store.add('s16n8-c6', '13800006', 'dept-16', false);
      store.add('s16n8-c7', '13800007', 'dept-16', false);
      store.add('s16n8-c8', '13800008', 'dept-16', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(7);
      expect(store.search('dept-16').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0156 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_15700
     * @tc.name      testScenarioGrid0157
     * @tc.desc      Verify 8 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0157 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n8-c1', '13800001', 'dept-17', false);
      store.add('s17n8-c2', '13800002', 'dept-17', false);
      store.add('s17n8-c3', '13800003', 'dept-17', true);
      store.add('s17n8-c4', '13800004', 'dept-17', false);
      store.add('s17n8-c5', '13800005', 'dept-17', false);
      store.add('s17n8-c6', '13800006', 'dept-17', false);
      store.add('s17n8-c7', '13800007', 'dept-17', true);
      store.add('s17n8-c8', '13800008', 'dept-17', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(7);
      expect(store.search('dept-17').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0157 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_15800
     * @tc.name      testScenarioGrid0158
     * @tc.desc      Verify 8 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0158 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n8-c1', '13800001', 'dept-18', false);
      store.add('s18n8-c2', '13800002', 'dept-18', true);
      store.add('s18n8-c3', '13800003', 'dept-18', false);
      store.add('s18n8-c4', '13800004', 'dept-18', false);
      store.add('s18n8-c5', '13800005', 'dept-18', false);
      store.add('s18n8-c6', '13800006', 'dept-18', true);
      store.add('s18n8-c7', '13800007', 'dept-18', false);
      store.add('s18n8-c8', '13800008', 'dept-18', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(7);
      expect(store.search('dept-18').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0158 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_15900
     * @tc.name      testScenarioGrid0159
     * @tc.desc      Verify 8 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0159 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n8-c1', '13800001', 'dept-19', true);
      store.add('s19n8-c2', '13800002', 'dept-19', false);
      store.add('s19n8-c3', '13800003', 'dept-19', false);
      store.add('s19n8-c4', '13800004', 'dept-19', false);
      store.add('s19n8-c5', '13800005', 'dept-19', true);
      store.add('s19n8-c6', '13800006', 'dept-19', false);
      store.add('s19n8-c7', '13800007', 'dept-19', false);
      store.add('s19n8-c8', '13800008', 'dept-19', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(7);
      expect(store.search('dept-19').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0159 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP4_16000
     * @tc.name      testScenarioGrid0160
     * @tc.desc      Verify 8 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0160 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n8-c1', '13800001', 'dept-20', false);
      store.add('s20n8-c2', '13800002', 'dept-20', false);
      store.add('s20n8-c3', '13800003', 'dept-20', false);
      store.add('s20n8-c4', '13800004', 'dept-20', true);
      store.add('s20n8-c5', '13800005', 'dept-20', false);
      store.add('s20n8-c6', '13800006', 'dept-20', false);
      store.add('s20n8-c7', '13800007', 'dept-20', false);
      store.add('s20n8-c8', '13800008', 'dept-20', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(null);
      expect(store.count()).assertEqual(7);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(7);
      expect(store.search('dept-20').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0160 end');
    })

  })
}
