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

export default function ContactScenarioGridMatrixPart5Test(): void {
  describe('ContactScenarioGridMatrixPart5', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_16100
     * @tc.name      testScenarioGrid0161
     * @tc.desc      Verify 9 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0161 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n9-c1', '13800001', 'dept-1', false);
      store.add('s1n9-c2', '13800002', 'dept-1', false);
      store.add('s1n9-c3', '13800003', 'dept-1', true);
      store.add('s1n9-c4', '13800004', 'dept-1', false);
      store.add('s1n9-c5', '13800005', 'dept-1', false);
      store.add('s1n9-c6', '13800006', 'dept-1', false);
      store.add('s1n9-c7', '13800007', 'dept-1', true);
      store.add('s1n9-c8', '13800008', 'dept-1', false);
      store.add('s1n9-c9', '13800009', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(8);
      expect(store.search('dept-1').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0161 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_16200
     * @tc.name      testScenarioGrid0162
     * @tc.desc      Verify 9 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0162 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n9-c1', '13800001', 'dept-2', false);
      store.add('s2n9-c2', '13800002', 'dept-2', true);
      store.add('s2n9-c3', '13800003', 'dept-2', false);
      store.add('s2n9-c4', '13800004', 'dept-2', false);
      store.add('s2n9-c5', '13800005', 'dept-2', false);
      store.add('s2n9-c6', '13800006', 'dept-2', true);
      store.add('s2n9-c7', '13800007', 'dept-2', false);
      store.add('s2n9-c8', '13800008', 'dept-2', false);
      store.add('s2n9-c9', '13800009', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(8);
      expect(store.search('dept-2').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0162 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_16300
     * @tc.name      testScenarioGrid0163
     * @tc.desc      Verify 9 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0163 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n9-c1', '13800001', 'dept-3', true);
      store.add('s3n9-c2', '13800002', 'dept-3', false);
      store.add('s3n9-c3', '13800003', 'dept-3', false);
      store.add('s3n9-c4', '13800004', 'dept-3', false);
      store.add('s3n9-c5', '13800005', 'dept-3', true);
      store.add('s3n9-c6', '13800006', 'dept-3', false);
      store.add('s3n9-c7', '13800007', 'dept-3', false);
      store.add('s3n9-c8', '13800008', 'dept-3', false);
      store.add('s3n9-c9', '13800009', 'dept-3', true);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(false);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(8);
      expect(store.search('dept-3').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0163 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_16400
     * @tc.name      testScenarioGrid0164
     * @tc.desc      Verify 9 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0164 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n9-c1', '13800001', 'dept-4', false);
      store.add('s4n9-c2', '13800002', 'dept-4', false);
      store.add('s4n9-c3', '13800003', 'dept-4', false);
      store.add('s4n9-c4', '13800004', 'dept-4', true);
      store.add('s4n9-c5', '13800005', 'dept-4', false);
      store.add('s4n9-c6', '13800006', 'dept-4', false);
      store.add('s4n9-c7', '13800007', 'dept-4', false);
      store.add('s4n9-c8', '13800008', 'dept-4', true);
      store.add('s4n9-c9', '13800009', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(false);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(8);
      expect(store.search('dept-4').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0164 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_16500
     * @tc.name      testScenarioGrid0165
     * @tc.desc      Verify 9 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0165 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n9-c1', '13800001', 'dept-5', false);
      store.add('s5n9-c2', '13800002', 'dept-5', false);
      store.add('s5n9-c3', '13800003', 'dept-5', true);
      store.add('s5n9-c4', '13800004', 'dept-5', false);
      store.add('s5n9-c5', '13800005', 'dept-5', false);
      store.add('s5n9-c6', '13800006', 'dept-5', false);
      store.add('s5n9-c7', '13800007', 'dept-5', true);
      store.add('s5n9-c8', '13800008', 'dept-5', false);
      store.add('s5n9-c9', '13800009', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(false);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(8);
      expect(store.search('dept-5').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0165 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_16600
     * @tc.name      testScenarioGrid0166
     * @tc.desc      Verify 9 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0166 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n9-c1', '13800001', 'dept-6', false);
      store.add('s6n9-c2', '13800002', 'dept-6', true);
      store.add('s6n9-c3', '13800003', 'dept-6', false);
      store.add('s6n9-c4', '13800004', 'dept-6', false);
      store.add('s6n9-c5', '13800005', 'dept-6', false);
      store.add('s6n9-c6', '13800006', 'dept-6', true);
      store.add('s6n9-c7', '13800007', 'dept-6', false);
      store.add('s6n9-c8', '13800008', 'dept-6', false);
      store.add('s6n9-c9', '13800009', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(8);
      expect(store.search('dept-6').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0166 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_16700
     * @tc.name      testScenarioGrid0167
     * @tc.desc      Verify 9 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0167 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n9-c1', '13800001', 'dept-7', true);
      store.add('s7n9-c2', '13800002', 'dept-7', false);
      store.add('s7n9-c3', '13800003', 'dept-7', false);
      store.add('s7n9-c4', '13800004', 'dept-7', false);
      store.add('s7n9-c5', '13800005', 'dept-7', true);
      store.add('s7n9-c6', '13800006', 'dept-7', false);
      store.add('s7n9-c7', '13800007', 'dept-7', false);
      store.add('s7n9-c8', '13800008', 'dept-7', false);
      store.add('s7n9-c9', '13800009', 'dept-7', true);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(8);
      expect(store.search('dept-7').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0167 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_16800
     * @tc.name      testScenarioGrid0168
     * @tc.desc      Verify 9 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0168 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n9-c1', '13800001', 'dept-8', false);
      store.add('s8n9-c2', '13800002', 'dept-8', false);
      store.add('s8n9-c3', '13800003', 'dept-8', false);
      store.add('s8n9-c4', '13800004', 'dept-8', true);
      store.add('s8n9-c5', '13800005', 'dept-8', false);
      store.add('s8n9-c6', '13800006', 'dept-8', false);
      store.add('s8n9-c7', '13800007', 'dept-8', false);
      store.add('s8n9-c8', '13800008', 'dept-8', true);
      store.add('s8n9-c9', '13800009', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(8);
      expect(store.search('dept-8').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0168 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_16900
     * @tc.name      testScenarioGrid0169
     * @tc.desc      Verify 9 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0169 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n9-c1', '13800001', 'dept-9', false);
      store.add('s9n9-c2', '13800002', 'dept-9', false);
      store.add('s9n9-c3', '13800003', 'dept-9', true);
      store.add('s9n9-c4', '13800004', 'dept-9', false);
      store.add('s9n9-c5', '13800005', 'dept-9', false);
      store.add('s9n9-c6', '13800006', 'dept-9', false);
      store.add('s9n9-c7', '13800007', 'dept-9', true);
      store.add('s9n9-c8', '13800008', 'dept-9', false);
      store.add('s9n9-c9', '13800009', 'dept-9', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(8);
      expect(store.search('dept-9').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0169 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_17000
     * @tc.name      testScenarioGrid0170
     * @tc.desc      Verify 9 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0170 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n9-c1', '13800001', 'dept-10', false);
      store.add('s10n9-c2', '13800002', 'dept-10', true);
      store.add('s10n9-c3', '13800003', 'dept-10', false);
      store.add('s10n9-c4', '13800004', 'dept-10', false);
      store.add('s10n9-c5', '13800005', 'dept-10', false);
      store.add('s10n9-c6', '13800006', 'dept-10', true);
      store.add('s10n9-c7', '13800007', 'dept-10', false);
      store.add('s10n9-c8', '13800008', 'dept-10', false);
      store.add('s10n9-c9', '13800009', 'dept-10', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(8);
      expect(store.search('dept-10').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0170 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_17100
     * @tc.name      testScenarioGrid0171
     * @tc.desc      Verify 9 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0171 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n9-c1', '13800001', 'dept-11', true);
      store.add('s11n9-c2', '13800002', 'dept-11', false);
      store.add('s11n9-c3', '13800003', 'dept-11', false);
      store.add('s11n9-c4', '13800004', 'dept-11', false);
      store.add('s11n9-c5', '13800005', 'dept-11', true);
      store.add('s11n9-c6', '13800006', 'dept-11', false);
      store.add('s11n9-c7', '13800007', 'dept-11', false);
      store.add('s11n9-c8', '13800008', 'dept-11', false);
      store.add('s11n9-c9', '13800009', 'dept-11', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(8);
      expect(store.search('dept-11').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0171 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_17200
     * @tc.name      testScenarioGrid0172
     * @tc.desc      Verify 9 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0172 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n9-c1', '13800001', 'dept-12', false);
      store.add('s12n9-c2', '13800002', 'dept-12', false);
      store.add('s12n9-c3', '13800003', 'dept-12', false);
      store.add('s12n9-c4', '13800004', 'dept-12', true);
      store.add('s12n9-c5', '13800005', 'dept-12', false);
      store.add('s12n9-c6', '13800006', 'dept-12', false);
      store.add('s12n9-c7', '13800007', 'dept-12', false);
      store.add('s12n9-c8', '13800008', 'dept-12', true);
      store.add('s12n9-c9', '13800009', 'dept-12', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(8);
      expect(store.search('dept-12').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0172 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_17300
     * @tc.name      testScenarioGrid0173
     * @tc.desc      Verify 9 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0173 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n9-c1', '13800001', 'dept-13', false);
      store.add('s13n9-c2', '13800002', 'dept-13', false);
      store.add('s13n9-c3', '13800003', 'dept-13', true);
      store.add('s13n9-c4', '13800004', 'dept-13', false);
      store.add('s13n9-c5', '13800005', 'dept-13', false);
      store.add('s13n9-c6', '13800006', 'dept-13', false);
      store.add('s13n9-c7', '13800007', 'dept-13', true);
      store.add('s13n9-c8', '13800008', 'dept-13', false);
      store.add('s13n9-c9', '13800009', 'dept-13', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(8);
      expect(store.search('dept-13').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0173 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_17400
     * @tc.name      testScenarioGrid0174
     * @tc.desc      Verify 9 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0174 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n9-c1', '13800001', 'dept-14', false);
      store.add('s14n9-c2', '13800002', 'dept-14', true);
      store.add('s14n9-c3', '13800003', 'dept-14', false);
      store.add('s14n9-c4', '13800004', 'dept-14', false);
      store.add('s14n9-c5', '13800005', 'dept-14', false);
      store.add('s14n9-c6', '13800006', 'dept-14', true);
      store.add('s14n9-c7', '13800007', 'dept-14', false);
      store.add('s14n9-c8', '13800008', 'dept-14', false);
      store.add('s14n9-c9', '13800009', 'dept-14', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(8);
      expect(store.search('dept-14').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0174 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_17500
     * @tc.name      testScenarioGrid0175
     * @tc.desc      Verify 9 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0175 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n9-c1', '13800001', 'dept-15', true);
      store.add('s15n9-c2', '13800002', 'dept-15', false);
      store.add('s15n9-c3', '13800003', 'dept-15', false);
      store.add('s15n9-c4', '13800004', 'dept-15', false);
      store.add('s15n9-c5', '13800005', 'dept-15', true);
      store.add('s15n9-c6', '13800006', 'dept-15', false);
      store.add('s15n9-c7', '13800007', 'dept-15', false);
      store.add('s15n9-c8', '13800008', 'dept-15', false);
      store.add('s15n9-c9', '13800009', 'dept-15', true);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(false);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(8);
      expect(store.search('dept-15').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0175 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_17600
     * @tc.name      testScenarioGrid0176
     * @tc.desc      Verify 9 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0176 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n9-c1', '13800001', 'dept-16', false);
      store.add('s16n9-c2', '13800002', 'dept-16', false);
      store.add('s16n9-c3', '13800003', 'dept-16', false);
      store.add('s16n9-c4', '13800004', 'dept-16', true);
      store.add('s16n9-c5', '13800005', 'dept-16', false);
      store.add('s16n9-c6', '13800006', 'dept-16', false);
      store.add('s16n9-c7', '13800007', 'dept-16', false);
      store.add('s16n9-c8', '13800008', 'dept-16', true);
      store.add('s16n9-c9', '13800009', 'dept-16', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(false);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(8);
      expect(store.search('dept-16').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0176 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_17700
     * @tc.name      testScenarioGrid0177
     * @tc.desc      Verify 9 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0177 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n9-c1', '13800001', 'dept-17', false);
      store.add('s17n9-c2', '13800002', 'dept-17', false);
      store.add('s17n9-c3', '13800003', 'dept-17', true);
      store.add('s17n9-c4', '13800004', 'dept-17', false);
      store.add('s17n9-c5', '13800005', 'dept-17', false);
      store.add('s17n9-c6', '13800006', 'dept-17', false);
      store.add('s17n9-c7', '13800007', 'dept-17', true);
      store.add('s17n9-c8', '13800008', 'dept-17', false);
      store.add('s17n9-c9', '13800009', 'dept-17', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(false);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(8);
      expect(store.search('dept-17').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0177 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_17800
     * @tc.name      testScenarioGrid0178
     * @tc.desc      Verify 9 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0178 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n9-c1', '13800001', 'dept-18', false);
      store.add('s18n9-c2', '13800002', 'dept-18', true);
      store.add('s18n9-c3', '13800003', 'dept-18', false);
      store.add('s18n9-c4', '13800004', 'dept-18', false);
      store.add('s18n9-c5', '13800005', 'dept-18', false);
      store.add('s18n9-c6', '13800006', 'dept-18', true);
      store.add('s18n9-c7', '13800007', 'dept-18', false);
      store.add('s18n9-c8', '13800008', 'dept-18', false);
      store.add('s18n9-c9', '13800009', 'dept-18', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(8);
      expect(store.search('dept-18').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0178 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_17900
     * @tc.name      testScenarioGrid0179
     * @tc.desc      Verify 9 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0179 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n9-c1', '13800001', 'dept-19', true);
      store.add('s19n9-c2', '13800002', 'dept-19', false);
      store.add('s19n9-c3', '13800003', 'dept-19', false);
      store.add('s19n9-c4', '13800004', 'dept-19', false);
      store.add('s19n9-c5', '13800005', 'dept-19', true);
      store.add('s19n9-c6', '13800006', 'dept-19', false);
      store.add('s19n9-c7', '13800007', 'dept-19', false);
      store.add('s19n9-c8', '13800008', 'dept-19', false);
      store.add('s19n9-c9', '13800009', 'dept-19', true);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(8);
      expect(store.search('dept-19').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0179 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_18000
     * @tc.name      testScenarioGrid0180
     * @tc.desc      Verify 9 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0180 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n9-c1', '13800001', 'dept-20', false);
      store.add('s20n9-c2', '13800002', 'dept-20', false);
      store.add('s20n9-c3', '13800003', 'dept-20', false);
      store.add('s20n9-c4', '13800004', 'dept-20', true);
      store.add('s20n9-c5', '13800005', 'dept-20', false);
      store.add('s20n9-c6', '13800006', 'dept-20', false);
      store.add('s20n9-c7', '13800007', 'dept-20', false);
      store.add('s20n9-c8', '13800008', 'dept-20', true);
      store.add('s20n9-c9', '13800009', 'dept-20', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(8);
      expect(store.search('dept-20').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0180 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_18100
     * @tc.name      testScenarioGrid0181
     * @tc.desc      Verify 10 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0181 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n10-c1', '13800001', 'dept-1', false);
      store.add('s1n10-c2', '13800002', 'dept-1', false);
      store.add('s1n10-c3', '13800003', 'dept-1', true);
      store.add('s1n10-c4', '13800004', 'dept-1', false);
      store.add('s1n10-c5', '13800005', 'dept-1', false);
      store.add('s1n10-c6', '13800006', 'dept-1', false);
      store.add('s1n10-c7', '13800007', 'dept-1', true);
      store.add('s1n10-c8', '13800008', 'dept-1', false);
      store.add('s1n10-c9', '13800009', 'dept-1', false);
      store.add('s1n10-c10', '138000010', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(9);
      expect(store.search('dept-1').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0181 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_18200
     * @tc.name      testScenarioGrid0182
     * @tc.desc      Verify 10 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0182 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n10-c1', '13800001', 'dept-2', false);
      store.add('s2n10-c2', '13800002', 'dept-2', true);
      store.add('s2n10-c3', '13800003', 'dept-2', false);
      store.add('s2n10-c4', '13800004', 'dept-2', false);
      store.add('s2n10-c5', '13800005', 'dept-2', false);
      store.add('s2n10-c6', '13800006', 'dept-2', true);
      store.add('s2n10-c7', '13800007', 'dept-2', false);
      store.add('s2n10-c8', '13800008', 'dept-2', false);
      store.add('s2n10-c9', '13800009', 'dept-2', false);
      store.add('s2n10-c10', '138000010', 'dept-2', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(9);
      expect(store.search('dept-2').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0182 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_18300
     * @tc.name      testScenarioGrid0183
     * @tc.desc      Verify 10 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0183 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n10-c1', '13800001', 'dept-3', true);
      store.add('s3n10-c2', '13800002', 'dept-3', false);
      store.add('s3n10-c3', '13800003', 'dept-3', false);
      store.add('s3n10-c4', '13800004', 'dept-3', false);
      store.add('s3n10-c5', '13800005', 'dept-3', true);
      store.add('s3n10-c6', '13800006', 'dept-3', false);
      store.add('s3n10-c7', '13800007', 'dept-3', false);
      store.add('s3n10-c8', '13800008', 'dept-3', false);
      store.add('s3n10-c9', '13800009', 'dept-3', true);
      store.add('s3n10-c10', '138000010', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(9);
      expect(store.search('dept-3').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0183 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_18400
     * @tc.name      testScenarioGrid0184
     * @tc.desc      Verify 10 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0184 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n10-c1', '13800001', 'dept-4', false);
      store.add('s4n10-c2', '13800002', 'dept-4', false);
      store.add('s4n10-c3', '13800003', 'dept-4', false);
      store.add('s4n10-c4', '13800004', 'dept-4', true);
      store.add('s4n10-c5', '13800005', 'dept-4', false);
      store.add('s4n10-c6', '13800006', 'dept-4', false);
      store.add('s4n10-c7', '13800007', 'dept-4', false);
      store.add('s4n10-c8', '13800008', 'dept-4', true);
      store.add('s4n10-c9', '13800009', 'dept-4', false);
      store.add('s4n10-c10', '138000010', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(9);
      expect(store.search('dept-4').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0184 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_18500
     * @tc.name      testScenarioGrid0185
     * @tc.desc      Verify 10 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0185 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n10-c1', '13800001', 'dept-5', false);
      store.add('s5n10-c2', '13800002', 'dept-5', false);
      store.add('s5n10-c3', '13800003', 'dept-5', true);
      store.add('s5n10-c4', '13800004', 'dept-5', false);
      store.add('s5n10-c5', '13800005', 'dept-5', false);
      store.add('s5n10-c6', '13800006', 'dept-5', false);
      store.add('s5n10-c7', '13800007', 'dept-5', true);
      store.add('s5n10-c8', '13800008', 'dept-5', false);
      store.add('s5n10-c9', '13800009', 'dept-5', false);
      store.add('s5n10-c10', '138000010', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(null);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(9);
      expect(store.search('dept-5').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0185 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_18600
     * @tc.name      testScenarioGrid0186
     * @tc.desc      Verify 10 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0186 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n10-c1', '13800001', 'dept-6', false);
      store.add('s6n10-c2', '13800002', 'dept-6', true);
      store.add('s6n10-c3', '13800003', 'dept-6', false);
      store.add('s6n10-c4', '13800004', 'dept-6', false);
      store.add('s6n10-c5', '13800005', 'dept-6', false);
      store.add('s6n10-c6', '13800006', 'dept-6', true);
      store.add('s6n10-c7', '13800007', 'dept-6', false);
      store.add('s6n10-c8', '13800008', 'dept-6', false);
      store.add('s6n10-c9', '13800009', 'dept-6', false);
      store.add('s6n10-c10', '138000010', 'dept-6', true);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(9);
      expect(store.search('dept-6').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0186 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_18700
     * @tc.name      testScenarioGrid0187
     * @tc.desc      Verify 10 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0187 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n10-c1', '13800001', 'dept-7', true);
      store.add('s7n10-c2', '13800002', 'dept-7', false);
      store.add('s7n10-c3', '13800003', 'dept-7', false);
      store.add('s7n10-c4', '13800004', 'dept-7', false);
      store.add('s7n10-c5', '13800005', 'dept-7', true);
      store.add('s7n10-c6', '13800006', 'dept-7', false);
      store.add('s7n10-c7', '13800007', 'dept-7', false);
      store.add('s7n10-c8', '13800008', 'dept-7', false);
      store.add('s7n10-c9', '13800009', 'dept-7', true);
      store.add('s7n10-c10', '138000010', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(9);
      expect(store.search('dept-7').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0187 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_18800
     * @tc.name      testScenarioGrid0188
     * @tc.desc      Verify 10 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0188 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n10-c1', '13800001', 'dept-8', false);
      store.add('s8n10-c2', '13800002', 'dept-8', false);
      store.add('s8n10-c3', '13800003', 'dept-8', false);
      store.add('s8n10-c4', '13800004', 'dept-8', true);
      store.add('s8n10-c5', '13800005', 'dept-8', false);
      store.add('s8n10-c6', '13800006', 'dept-8', false);
      store.add('s8n10-c7', '13800007', 'dept-8', false);
      store.add('s8n10-c8', '13800008', 'dept-8', true);
      store.add('s8n10-c9', '13800009', 'dept-8', false);
      store.add('s8n10-c10', '138000010', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(9);
      expect(store.search('dept-8').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0188 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_18900
     * @tc.name      testScenarioGrid0189
     * @tc.desc      Verify 10 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0189 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n10-c1', '13800001', 'dept-9', false);
      store.add('s9n10-c2', '13800002', 'dept-9', false);
      store.add('s9n10-c3', '13800003', 'dept-9', true);
      store.add('s9n10-c4', '13800004', 'dept-9', false);
      store.add('s9n10-c5', '13800005', 'dept-9', false);
      store.add('s9n10-c6', '13800006', 'dept-9', false);
      store.add('s9n10-c7', '13800007', 'dept-9', true);
      store.add('s9n10-c8', '13800008', 'dept-9', false);
      store.add('s9n10-c9', '13800009', 'dept-9', false);
      store.add('s9n10-c10', '138000010', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(9);
      expect(store.search('dept-9').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0189 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_19000
     * @tc.name      testScenarioGrid0190
     * @tc.desc      Verify 10 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0190 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n10-c1', '13800001', 'dept-10', false);
      store.add('s10n10-c2', '13800002', 'dept-10', true);
      store.add('s10n10-c3', '13800003', 'dept-10', false);
      store.add('s10n10-c4', '13800004', 'dept-10', false);
      store.add('s10n10-c5', '13800005', 'dept-10', false);
      store.add('s10n10-c6', '13800006', 'dept-10', true);
      store.add('s10n10-c7', '13800007', 'dept-10', false);
      store.add('s10n10-c8', '13800008', 'dept-10', false);
      store.add('s10n10-c9', '13800009', 'dept-10', false);
      store.add('s10n10-c10', '138000010', 'dept-10', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(9);
      expect(store.search('dept-10').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0190 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_19100
     * @tc.name      testScenarioGrid0191
     * @tc.desc      Verify 10 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0191 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n10-c1', '13800001', 'dept-11', true);
      store.add('s11n10-c2', '13800002', 'dept-11', false);
      store.add('s11n10-c3', '13800003', 'dept-11', false);
      store.add('s11n10-c4', '13800004', 'dept-11', false);
      store.add('s11n10-c5', '13800005', 'dept-11', true);
      store.add('s11n10-c6', '13800006', 'dept-11', false);
      store.add('s11n10-c7', '13800007', 'dept-11', false);
      store.add('s11n10-c8', '13800008', 'dept-11', false);
      store.add('s11n10-c9', '13800009', 'dept-11', true);
      store.add('s11n10-c10', '138000010', 'dept-11', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(9);
      expect(store.search('dept-11').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0191 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_19200
     * @tc.name      testScenarioGrid0192
     * @tc.desc      Verify 10 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0192 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n10-c1', '13800001', 'dept-12', false);
      store.add('s12n10-c2', '13800002', 'dept-12', false);
      store.add('s12n10-c3', '13800003', 'dept-12', false);
      store.add('s12n10-c4', '13800004', 'dept-12', true);
      store.add('s12n10-c5', '13800005', 'dept-12', false);
      store.add('s12n10-c6', '13800006', 'dept-12', false);
      store.add('s12n10-c7', '13800007', 'dept-12', false);
      store.add('s12n10-c8', '13800008', 'dept-12', true);
      store.add('s12n10-c9', '13800009', 'dept-12', false);
      store.add('s12n10-c10', '138000010', 'dept-12', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(9);
      expect(store.search('dept-12').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0192 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_19300
     * @tc.name      testScenarioGrid0193
     * @tc.desc      Verify 10 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0193 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n10-c1', '13800001', 'dept-13', false);
      store.add('s13n10-c2', '13800002', 'dept-13', false);
      store.add('s13n10-c3', '13800003', 'dept-13', true);
      store.add('s13n10-c4', '13800004', 'dept-13', false);
      store.add('s13n10-c5', '13800005', 'dept-13', false);
      store.add('s13n10-c6', '13800006', 'dept-13', false);
      store.add('s13n10-c7', '13800007', 'dept-13', true);
      store.add('s13n10-c8', '13800008', 'dept-13', false);
      store.add('s13n10-c9', '13800009', 'dept-13', false);
      store.add('s13n10-c10', '138000010', 'dept-13', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(9);
      expect(store.search('dept-13').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0193 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_19400
     * @tc.name      testScenarioGrid0194
     * @tc.desc      Verify 10 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0194 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n10-c1', '13800001', 'dept-14', false);
      store.add('s14n10-c2', '13800002', 'dept-14', true);
      store.add('s14n10-c3', '13800003', 'dept-14', false);
      store.add('s14n10-c4', '13800004', 'dept-14', false);
      store.add('s14n10-c5', '13800005', 'dept-14', false);
      store.add('s14n10-c6', '13800006', 'dept-14', true);
      store.add('s14n10-c7', '13800007', 'dept-14', false);
      store.add('s14n10-c8', '13800008', 'dept-14', false);
      store.add('s14n10-c9', '13800009', 'dept-14', false);
      store.add('s14n10-c10', '138000010', 'dept-14', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(9);
      expect(store.search('dept-14').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0194 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_19500
     * @tc.name      testScenarioGrid0195
     * @tc.desc      Verify 10 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0195 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n10-c1', '13800001', 'dept-15', true);
      store.add('s15n10-c2', '13800002', 'dept-15', false);
      store.add('s15n10-c3', '13800003', 'dept-15', false);
      store.add('s15n10-c4', '13800004', 'dept-15', false);
      store.add('s15n10-c5', '13800005', 'dept-15', true);
      store.add('s15n10-c6', '13800006', 'dept-15', false);
      store.add('s15n10-c7', '13800007', 'dept-15', false);
      store.add('s15n10-c8', '13800008', 'dept-15', false);
      store.add('s15n10-c9', '13800009', 'dept-15', true);
      store.add('s15n10-c10', '138000010', 'dept-15', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(null);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(9);
      expect(store.search('dept-15').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0195 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_19600
     * @tc.name      testScenarioGrid0196
     * @tc.desc      Verify 10 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0196 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n10-c1', '13800001', 'dept-16', false);
      store.add('s16n10-c2', '13800002', 'dept-16', false);
      store.add('s16n10-c3', '13800003', 'dept-16', false);
      store.add('s16n10-c4', '13800004', 'dept-16', true);
      store.add('s16n10-c5', '13800005', 'dept-16', false);
      store.add('s16n10-c6', '13800006', 'dept-16', false);
      store.add('s16n10-c7', '13800007', 'dept-16', false);
      store.add('s16n10-c8', '13800008', 'dept-16', true);
      store.add('s16n10-c9', '13800009', 'dept-16', false);
      store.add('s16n10-c10', '138000010', 'dept-16', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(9);
      expect(store.search('dept-16').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0196 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_19700
     * @tc.name      testScenarioGrid0197
     * @tc.desc      Verify 10 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0197 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n10-c1', '13800001', 'dept-17', false);
      store.add('s17n10-c2', '13800002', 'dept-17', false);
      store.add('s17n10-c3', '13800003', 'dept-17', true);
      store.add('s17n10-c4', '13800004', 'dept-17', false);
      store.add('s17n10-c5', '13800005', 'dept-17', false);
      store.add('s17n10-c6', '13800006', 'dept-17', false);
      store.add('s17n10-c7', '13800007', 'dept-17', true);
      store.add('s17n10-c8', '13800008', 'dept-17', false);
      store.add('s17n10-c9', '13800009', 'dept-17', false);
      store.add('s17n10-c10', '138000010', 'dept-17', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(9);
      expect(store.search('dept-17').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0197 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_19800
     * @tc.name      testScenarioGrid0198
     * @tc.desc      Verify 10 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0198 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n10-c1', '13800001', 'dept-18', false);
      store.add('s18n10-c2', '13800002', 'dept-18', true);
      store.add('s18n10-c3', '13800003', 'dept-18', false);
      store.add('s18n10-c4', '13800004', 'dept-18', false);
      store.add('s18n10-c5', '13800005', 'dept-18', false);
      store.add('s18n10-c6', '13800006', 'dept-18', true);
      store.add('s18n10-c7', '13800007', 'dept-18', false);
      store.add('s18n10-c8', '13800008', 'dept-18', false);
      store.add('s18n10-c9', '13800009', 'dept-18', false);
      store.add('s18n10-c10', '138000010', 'dept-18', true);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(9);
      expect(store.search('dept-18').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0198 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_19900
     * @tc.name      testScenarioGrid0199
     * @tc.desc      Verify 10 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0199 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n10-c1', '13800001', 'dept-19', true);
      store.add('s19n10-c2', '13800002', 'dept-19', false);
      store.add('s19n10-c3', '13800003', 'dept-19', false);
      store.add('s19n10-c4', '13800004', 'dept-19', false);
      store.add('s19n10-c5', '13800005', 'dept-19', true);
      store.add('s19n10-c6', '13800006', 'dept-19', false);
      store.add('s19n10-c7', '13800007', 'dept-19', false);
      store.add('s19n10-c8', '13800008', 'dept-19', false);
      store.add('s19n10-c9', '13800009', 'dept-19', true);
      store.add('s19n10-c10', '138000010', 'dept-19', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(9);
      expect(store.search('dept-19').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0199 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP5_20000
     * @tc.name      testScenarioGrid0200
     * @tc.desc      Verify 10 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0200 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n10-c1', '13800001', 'dept-20', false);
      store.add('s20n10-c2', '13800002', 'dept-20', false);
      store.add('s20n10-c3', '13800003', 'dept-20', false);
      store.add('s20n10-c4', '13800004', 'dept-20', true);
      store.add('s20n10-c5', '13800005', 'dept-20', false);
      store.add('s20n10-c6', '13800006', 'dept-20', false);
      store.add('s20n10-c7', '13800007', 'dept-20', false);
      store.add('s20n10-c8', '13800008', 'dept-20', true);
      store.add('s20n10-c9', '13800009', 'dept-20', false);
      store.add('s20n10-c10', '138000010', 'dept-20', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(9);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(9);
      expect(store.search('dept-20').length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0200 end');
    })

  })
}
