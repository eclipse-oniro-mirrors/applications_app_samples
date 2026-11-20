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

export default function ContactScenarioGridMatrixPart6Test(): void {
  describe('ContactScenarioGridMatrixPart6', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_20100
     * @tc.name      testScenarioGrid0201
     * @tc.desc      Verify 11 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0201 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n11-c1', '13800001', 'dept-1', false);
      store.add('s1n11-c2', '13800002', 'dept-1', false);
      store.add('s1n11-c3', '13800003', 'dept-1', true);
      store.add('s1n11-c4', '13800004', 'dept-1', false);
      store.add('s1n11-c5', '13800005', 'dept-1', false);
      store.add('s1n11-c6', '13800006', 'dept-1', false);
      store.add('s1n11-c7', '13800007', 'dept-1', true);
      store.add('s1n11-c8', '13800008', 'dept-1', false);
      store.add('s1n11-c9', '13800009', 'dept-1', false);
      store.add('s1n11-c10', '138000010', 'dept-1', false);
      store.add('s1n11-c11', '138000011', 'dept-1', true);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(10);
      expect(store.search('dept-1').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0201 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_20200
     * @tc.name      testScenarioGrid0202
     * @tc.desc      Verify 11 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0202 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n11-c1', '13800001', 'dept-2', false);
      store.add('s2n11-c2', '13800002', 'dept-2', true);
      store.add('s2n11-c3', '13800003', 'dept-2', false);
      store.add('s2n11-c4', '13800004', 'dept-2', false);
      store.add('s2n11-c5', '13800005', 'dept-2', false);
      store.add('s2n11-c6', '13800006', 'dept-2', true);
      store.add('s2n11-c7', '13800007', 'dept-2', false);
      store.add('s2n11-c8', '13800008', 'dept-2', false);
      store.add('s2n11-c9', '13800009', 'dept-2', false);
      store.add('s2n11-c10', '138000010', 'dept-2', true);
      store.add('s2n11-c11', '138000011', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(10);
      expect(store.search('dept-2').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0202 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_20300
     * @tc.name      testScenarioGrid0203
     * @tc.desc      Verify 11 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0203 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n11-c1', '13800001', 'dept-3', true);
      store.add('s3n11-c2', '13800002', 'dept-3', false);
      store.add('s3n11-c3', '13800003', 'dept-3', false);
      store.add('s3n11-c4', '13800004', 'dept-3', false);
      store.add('s3n11-c5', '13800005', 'dept-3', true);
      store.add('s3n11-c6', '13800006', 'dept-3', false);
      store.add('s3n11-c7', '13800007', 'dept-3', false);
      store.add('s3n11-c8', '13800008', 'dept-3', false);
      store.add('s3n11-c9', '13800009', 'dept-3', true);
      store.add('s3n11-c10', '138000010', 'dept-3', false);
      store.add('s3n11-c11', '138000011', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(10);
      expect(store.search('dept-3').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0203 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_20400
     * @tc.name      testScenarioGrid0204
     * @tc.desc      Verify 11 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0204 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n11-c1', '13800001', 'dept-4', false);
      store.add('s4n11-c2', '13800002', 'dept-4', false);
      store.add('s4n11-c3', '13800003', 'dept-4', false);
      store.add('s4n11-c4', '13800004', 'dept-4', true);
      store.add('s4n11-c5', '13800005', 'dept-4', false);
      store.add('s4n11-c6', '13800006', 'dept-4', false);
      store.add('s4n11-c7', '13800007', 'dept-4', false);
      store.add('s4n11-c8', '13800008', 'dept-4', true);
      store.add('s4n11-c9', '13800009', 'dept-4', false);
      store.add('s4n11-c10', '138000010', 'dept-4', false);
      store.add('s4n11-c11', '138000011', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(10);
      expect(store.search('dept-4').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0204 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_20500
     * @tc.name      testScenarioGrid0205
     * @tc.desc      Verify 11 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0205 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n11-c1', '13800001', 'dept-5', false);
      store.add('s5n11-c2', '13800002', 'dept-5', false);
      store.add('s5n11-c3', '13800003', 'dept-5', true);
      store.add('s5n11-c4', '13800004', 'dept-5', false);
      store.add('s5n11-c5', '13800005', 'dept-5', false);
      store.add('s5n11-c6', '13800006', 'dept-5', false);
      store.add('s5n11-c7', '13800007', 'dept-5', true);
      store.add('s5n11-c8', '13800008', 'dept-5', false);
      store.add('s5n11-c9', '13800009', 'dept-5', false);
      store.add('s5n11-c10', '138000010', 'dept-5', false);
      store.add('s5n11-c11', '138000011', 'dept-5', true);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(10);
      expect(store.search('dept-5').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0205 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_20600
     * @tc.name      testScenarioGrid0206
     * @tc.desc      Verify 11 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0206 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n11-c1', '13800001', 'dept-6', false);
      store.add('s6n11-c2', '13800002', 'dept-6', true);
      store.add('s6n11-c3', '13800003', 'dept-6', false);
      store.add('s6n11-c4', '13800004', 'dept-6', false);
      store.add('s6n11-c5', '13800005', 'dept-6', false);
      store.add('s6n11-c6', '13800006', 'dept-6', true);
      store.add('s6n11-c7', '13800007', 'dept-6', false);
      store.add('s6n11-c8', '13800008', 'dept-6', false);
      store.add('s6n11-c9', '13800009', 'dept-6', false);
      store.add('s6n11-c10', '138000010', 'dept-6', true);
      store.add('s6n11-c11', '138000011', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(10);
      expect(store.search('dept-6').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0206 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_20700
     * @tc.name      testScenarioGrid0207
     * @tc.desc      Verify 11 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0207 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n11-c1', '13800001', 'dept-7', true);
      store.add('s7n11-c2', '13800002', 'dept-7', false);
      store.add('s7n11-c3', '13800003', 'dept-7', false);
      store.add('s7n11-c4', '13800004', 'dept-7', false);
      store.add('s7n11-c5', '13800005', 'dept-7', true);
      store.add('s7n11-c6', '13800006', 'dept-7', false);
      store.add('s7n11-c7', '13800007', 'dept-7', false);
      store.add('s7n11-c8', '13800008', 'dept-7', false);
      store.add('s7n11-c9', '13800009', 'dept-7', true);
      store.add('s7n11-c10', '138000010', 'dept-7', false);
      store.add('s7n11-c11', '138000011', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(11)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(10);
      expect(store.search('dept-7').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0207 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_20800
     * @tc.name      testScenarioGrid0208
     * @tc.desc      Verify 11 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0208 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n11-c1', '13800001', 'dept-8', false);
      store.add('s8n11-c2', '13800002', 'dept-8', false);
      store.add('s8n11-c3', '13800003', 'dept-8', false);
      store.add('s8n11-c4', '13800004', 'dept-8', true);
      store.add('s8n11-c5', '13800005', 'dept-8', false);
      store.add('s8n11-c6', '13800006', 'dept-8', false);
      store.add('s8n11-c7', '13800007', 'dept-8', false);
      store.add('s8n11-c8', '13800008', 'dept-8', true);
      store.add('s8n11-c9', '13800009', 'dept-8', false);
      store.add('s8n11-c10', '138000010', 'dept-8', false);
      store.add('s8n11-c11', '138000011', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(10);
      expect(store.search('dept-8').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0208 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_20900
     * @tc.name      testScenarioGrid0209
     * @tc.desc      Verify 11 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0209 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n11-c1', '13800001', 'dept-9', false);
      store.add('s9n11-c2', '13800002', 'dept-9', false);
      store.add('s9n11-c3', '13800003', 'dept-9', true);
      store.add('s9n11-c4', '13800004', 'dept-9', false);
      store.add('s9n11-c5', '13800005', 'dept-9', false);
      store.add('s9n11-c6', '13800006', 'dept-9', false);
      store.add('s9n11-c7', '13800007', 'dept-9', true);
      store.add('s9n11-c8', '13800008', 'dept-9', false);
      store.add('s9n11-c9', '13800009', 'dept-9', false);
      store.add('s9n11-c10', '138000010', 'dept-9', false);
      store.add('s9n11-c11', '138000011', 'dept-9', true);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(10);
      expect(store.search('dept-9').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0209 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_21000
     * @tc.name      testScenarioGrid0210
     * @tc.desc      Verify 11 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0210 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n11-c1', '13800001', 'dept-10', false);
      store.add('s10n11-c2', '13800002', 'dept-10', true);
      store.add('s10n11-c3', '13800003', 'dept-10', false);
      store.add('s10n11-c4', '13800004', 'dept-10', false);
      store.add('s10n11-c5', '13800005', 'dept-10', false);
      store.add('s10n11-c6', '13800006', 'dept-10', true);
      store.add('s10n11-c7', '13800007', 'dept-10', false);
      store.add('s10n11-c8', '13800008', 'dept-10', false);
      store.add('s10n11-c9', '13800009', 'dept-10', false);
      store.add('s10n11-c10', '138000010', 'dept-10', true);
      store.add('s10n11-c11', '138000011', 'dept-10', false);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(10);
      expect(store.search('dept-10').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0210 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_21100
     * @tc.name      testScenarioGrid0211
     * @tc.desc      Verify 11 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0211 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n11-c1', '13800001', 'dept-11', true);
      store.add('s11n11-c2', '13800002', 'dept-11', false);
      store.add('s11n11-c3', '13800003', 'dept-11', false);
      store.add('s11n11-c4', '13800004', 'dept-11', false);
      store.add('s11n11-c5', '13800005', 'dept-11', true);
      store.add('s11n11-c6', '13800006', 'dept-11', false);
      store.add('s11n11-c7', '13800007', 'dept-11', false);
      store.add('s11n11-c8', '13800008', 'dept-11', false);
      store.add('s11n11-c9', '13800009', 'dept-11', true);
      store.add('s11n11-c10', '138000010', 'dept-11', false);
      store.add('s11n11-c11', '138000011', 'dept-11', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(10);
      expect(store.search('dept-11').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0211 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_21200
     * @tc.name      testScenarioGrid0212
     * @tc.desc      Verify 11 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0212 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n11-c1', '13800001', 'dept-12', false);
      store.add('s12n11-c2', '13800002', 'dept-12', false);
      store.add('s12n11-c3', '13800003', 'dept-12', false);
      store.add('s12n11-c4', '13800004', 'dept-12', true);
      store.add('s12n11-c5', '13800005', 'dept-12', false);
      store.add('s12n11-c6', '13800006', 'dept-12', false);
      store.add('s12n11-c7', '13800007', 'dept-12', false);
      store.add('s12n11-c8', '13800008', 'dept-12', true);
      store.add('s12n11-c9', '13800009', 'dept-12', false);
      store.add('s12n11-c10', '138000010', 'dept-12', false);
      store.add('s12n11-c11', '138000011', 'dept-12', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(false);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(10);
      expect(store.search('dept-12').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0212 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_21300
     * @tc.name      testScenarioGrid0213
     * @tc.desc      Verify 11 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0213 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n11-c1', '13800001', 'dept-13', false);
      store.add('s13n11-c2', '13800002', 'dept-13', false);
      store.add('s13n11-c3', '13800003', 'dept-13', true);
      store.add('s13n11-c4', '13800004', 'dept-13', false);
      store.add('s13n11-c5', '13800005', 'dept-13', false);
      store.add('s13n11-c6', '13800006', 'dept-13', false);
      store.add('s13n11-c7', '13800007', 'dept-13', true);
      store.add('s13n11-c8', '13800008', 'dept-13', false);
      store.add('s13n11-c9', '13800009', 'dept-13', false);
      store.add('s13n11-c10', '138000010', 'dept-13', false);
      store.add('s13n11-c11', '138000011', 'dept-13', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(false);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(10);
      expect(store.search('dept-13').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0213 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_21400
     * @tc.name      testScenarioGrid0214
     * @tc.desc      Verify 11 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0214 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n11-c1', '13800001', 'dept-14', false);
      store.add('s14n11-c2', '13800002', 'dept-14', true);
      store.add('s14n11-c3', '13800003', 'dept-14', false);
      store.add('s14n11-c4', '13800004', 'dept-14', false);
      store.add('s14n11-c5', '13800005', 'dept-14', false);
      store.add('s14n11-c6', '13800006', 'dept-14', true);
      store.add('s14n11-c7', '13800007', 'dept-14', false);
      store.add('s14n11-c8', '13800008', 'dept-14', false);
      store.add('s14n11-c9', '13800009', 'dept-14', false);
      store.add('s14n11-c10', '138000010', 'dept-14', true);
      store.add('s14n11-c11', '138000011', 'dept-14', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(false);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(10);
      expect(store.search('dept-14').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0214 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_21500
     * @tc.name      testScenarioGrid0215
     * @tc.desc      Verify 11 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0215 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n11-c1', '13800001', 'dept-15', true);
      store.add('s15n11-c2', '13800002', 'dept-15', false);
      store.add('s15n11-c3', '13800003', 'dept-15', false);
      store.add('s15n11-c4', '13800004', 'dept-15', false);
      store.add('s15n11-c5', '13800005', 'dept-15', true);
      store.add('s15n11-c6', '13800006', 'dept-15', false);
      store.add('s15n11-c7', '13800007', 'dept-15', false);
      store.add('s15n11-c8', '13800008', 'dept-15', false);
      store.add('s15n11-c9', '13800009', 'dept-15', true);
      store.add('s15n11-c10', '138000010', 'dept-15', false);
      store.add('s15n11-c11', '138000011', 'dept-15', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(10);
      expect(store.search('dept-15').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0215 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_21600
     * @tc.name      testScenarioGrid0216
     * @tc.desc      Verify 11 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0216 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n11-c1', '13800001', 'dept-16', false);
      store.add('s16n11-c2', '13800002', 'dept-16', false);
      store.add('s16n11-c3', '13800003', 'dept-16', false);
      store.add('s16n11-c4', '13800004', 'dept-16', true);
      store.add('s16n11-c5', '13800005', 'dept-16', false);
      store.add('s16n11-c6', '13800006', 'dept-16', false);
      store.add('s16n11-c7', '13800007', 'dept-16', false);
      store.add('s16n11-c8', '13800008', 'dept-16', true);
      store.add('s16n11-c9', '13800009', 'dept-16', false);
      store.add('s16n11-c10', '138000010', 'dept-16', false);
      store.add('s16n11-c11', '138000011', 'dept-16', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(10);
      expect(store.search('dept-16').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0216 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_21700
     * @tc.name      testScenarioGrid0217
     * @tc.desc      Verify 11 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0217 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n11-c1', '13800001', 'dept-17', false);
      store.add('s17n11-c2', '13800002', 'dept-17', false);
      store.add('s17n11-c3', '13800003', 'dept-17', true);
      store.add('s17n11-c4', '13800004', 'dept-17', false);
      store.add('s17n11-c5', '13800005', 'dept-17', false);
      store.add('s17n11-c6', '13800006', 'dept-17', false);
      store.add('s17n11-c7', '13800007', 'dept-17', true);
      store.add('s17n11-c8', '13800008', 'dept-17', false);
      store.add('s17n11-c9', '13800009', 'dept-17', false);
      store.add('s17n11-c10', '138000010', 'dept-17', false);
      store.add('s17n11-c11', '138000011', 'dept-17', true);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(10);
      expect(store.search('dept-17').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0217 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_21800
     * @tc.name      testScenarioGrid0218
     * @tc.desc      Verify 11 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0218 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n11-c1', '13800001', 'dept-18', false);
      store.add('s18n11-c2', '13800002', 'dept-18', true);
      store.add('s18n11-c3', '13800003', 'dept-18', false);
      store.add('s18n11-c4', '13800004', 'dept-18', false);
      store.add('s18n11-c5', '13800005', 'dept-18', false);
      store.add('s18n11-c6', '13800006', 'dept-18', true);
      store.add('s18n11-c7', '13800007', 'dept-18', false);
      store.add('s18n11-c8', '13800008', 'dept-18', false);
      store.add('s18n11-c9', '13800009', 'dept-18', false);
      store.add('s18n11-c10', '138000010', 'dept-18', true);
      store.add('s18n11-c11', '138000011', 'dept-18', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(11)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(10);
      expect(store.search('dept-18').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0218 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_21900
     * @tc.name      testScenarioGrid0219
     * @tc.desc      Verify 11 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0219 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n11-c1', '13800001', 'dept-19', true);
      store.add('s19n11-c2', '13800002', 'dept-19', false);
      store.add('s19n11-c3', '13800003', 'dept-19', false);
      store.add('s19n11-c4', '13800004', 'dept-19', false);
      store.add('s19n11-c5', '13800005', 'dept-19', true);
      store.add('s19n11-c6', '13800006', 'dept-19', false);
      store.add('s19n11-c7', '13800007', 'dept-19', false);
      store.add('s19n11-c8', '13800008', 'dept-19', false);
      store.add('s19n11-c9', '13800009', 'dept-19', true);
      store.add('s19n11-c10', '138000010', 'dept-19', false);
      store.add('s19n11-c11', '138000011', 'dept-19', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(10);
      expect(store.search('dept-19').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0219 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_22000
     * @tc.name      testScenarioGrid0220
     * @tc.desc      Verify 11 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0220 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n11-c1', '13800001', 'dept-20', false);
      store.add('s20n11-c2', '13800002', 'dept-20', false);
      store.add('s20n11-c3', '13800003', 'dept-20', false);
      store.add('s20n11-c4', '13800004', 'dept-20', true);
      store.add('s20n11-c5', '13800005', 'dept-20', false);
      store.add('s20n11-c6', '13800006', 'dept-20', false);
      store.add('s20n11-c7', '13800007', 'dept-20', false);
      store.add('s20n11-c8', '13800008', 'dept-20', true);
      store.add('s20n11-c9', '13800009', 'dept-20', false);
      store.add('s20n11-c10', '138000010', 'dept-20', false);
      store.add('s20n11-c11', '138000011', 'dept-20', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(10);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(10);
      expect(store.search('dept-20').length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0220 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_22100
     * @tc.name      testScenarioGrid0221
     * @tc.desc      Verify 12 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0221 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n12-c1', '13800001', 'dept-1', false);
      store.add('s1n12-c2', '13800002', 'dept-1', false);
      store.add('s1n12-c3', '13800003', 'dept-1', true);
      store.add('s1n12-c4', '13800004', 'dept-1', false);
      store.add('s1n12-c5', '13800005', 'dept-1', false);
      store.add('s1n12-c6', '13800006', 'dept-1', false);
      store.add('s1n12-c7', '13800007', 'dept-1', true);
      store.add('s1n12-c8', '13800008', 'dept-1', false);
      store.add('s1n12-c9', '13800009', 'dept-1', false);
      store.add('s1n12-c10', '138000010', 'dept-1', false);
      store.add('s1n12-c11', '138000011', 'dept-1', true);
      store.add('s1n12-c12', '138000012', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(11);
      expect(store.search('dept-1').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0221 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_22200
     * @tc.name      testScenarioGrid0222
     * @tc.desc      Verify 12 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0222 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n12-c1', '13800001', 'dept-2', false);
      store.add('s2n12-c2', '13800002', 'dept-2', true);
      store.add('s2n12-c3', '13800003', 'dept-2', false);
      store.add('s2n12-c4', '13800004', 'dept-2', false);
      store.add('s2n12-c5', '13800005', 'dept-2', false);
      store.add('s2n12-c6', '13800006', 'dept-2', true);
      store.add('s2n12-c7', '13800007', 'dept-2', false);
      store.add('s2n12-c8', '13800008', 'dept-2', false);
      store.add('s2n12-c9', '13800009', 'dept-2', false);
      store.add('s2n12-c10', '138000010', 'dept-2', true);
      store.add('s2n12-c11', '138000011', 'dept-2', false);
      store.add('s2n12-c12', '138000012', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(11);
      expect(store.search('dept-2').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0222 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_22300
     * @tc.name      testScenarioGrid0223
     * @tc.desc      Verify 12 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0223 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n12-c1', '13800001', 'dept-3', true);
      store.add('s3n12-c2', '13800002', 'dept-3', false);
      store.add('s3n12-c3', '13800003', 'dept-3', false);
      store.add('s3n12-c4', '13800004', 'dept-3', false);
      store.add('s3n12-c5', '13800005', 'dept-3', true);
      store.add('s3n12-c6', '13800006', 'dept-3', false);
      store.add('s3n12-c7', '13800007', 'dept-3', false);
      store.add('s3n12-c8', '13800008', 'dept-3', false);
      store.add('s3n12-c9', '13800009', 'dept-3', true);
      store.add('s3n12-c10', '138000010', 'dept-3', false);
      store.add('s3n12-c11', '138000011', 'dept-3', false);
      store.add('s3n12-c12', '138000012', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(11);
      expect(store.search('dept-3').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0223 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_22400
     * @tc.name      testScenarioGrid0224
     * @tc.desc      Verify 12 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0224 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n12-c1', '13800001', 'dept-4', false);
      store.add('s4n12-c2', '13800002', 'dept-4', false);
      store.add('s4n12-c3', '13800003', 'dept-4', false);
      store.add('s4n12-c4', '13800004', 'dept-4', true);
      store.add('s4n12-c5', '13800005', 'dept-4', false);
      store.add('s4n12-c6', '13800006', 'dept-4', false);
      store.add('s4n12-c7', '13800007', 'dept-4', false);
      store.add('s4n12-c8', '13800008', 'dept-4', true);
      store.add('s4n12-c9', '13800009', 'dept-4', false);
      store.add('s4n12-c10', '138000010', 'dept-4', false);
      store.add('s4n12-c11', '138000011', 'dept-4', false);
      store.add('s4n12-c12', '138000012', 'dept-4', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(11);
      expect(store.search('dept-4').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0224 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_22500
     * @tc.name      testScenarioGrid0225
     * @tc.desc      Verify 12 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0225 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n12-c1', '13800001', 'dept-5', false);
      store.add('s5n12-c2', '13800002', 'dept-5', false);
      store.add('s5n12-c3', '13800003', 'dept-5', true);
      store.add('s5n12-c4', '13800004', 'dept-5', false);
      store.add('s5n12-c5', '13800005', 'dept-5', false);
      store.add('s5n12-c6', '13800006', 'dept-5', false);
      store.add('s5n12-c7', '13800007', 'dept-5', true);
      store.add('s5n12-c8', '13800008', 'dept-5', false);
      store.add('s5n12-c9', '13800009', 'dept-5', false);
      store.add('s5n12-c10', '138000010', 'dept-5', false);
      store.add('s5n12-c11', '138000011', 'dept-5', true);
      store.add('s5n12-c12', '138000012', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(11);
      expect(store.search('dept-5').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0225 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_22600
     * @tc.name      testScenarioGrid0226
     * @tc.desc      Verify 12 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0226 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n12-c1', '13800001', 'dept-6', false);
      store.add('s6n12-c2', '13800002', 'dept-6', true);
      store.add('s6n12-c3', '13800003', 'dept-6', false);
      store.add('s6n12-c4', '13800004', 'dept-6', false);
      store.add('s6n12-c5', '13800005', 'dept-6', false);
      store.add('s6n12-c6', '13800006', 'dept-6', true);
      store.add('s6n12-c7', '13800007', 'dept-6', false);
      store.add('s6n12-c8', '13800008', 'dept-6', false);
      store.add('s6n12-c9', '13800009', 'dept-6', false);
      store.add('s6n12-c10', '138000010', 'dept-6', true);
      store.add('s6n12-c11', '138000011', 'dept-6', false);
      store.add('s6n12-c12', '138000012', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(null);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(11);
      expect(store.search('dept-6').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0226 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_22700
     * @tc.name      testScenarioGrid0227
     * @tc.desc      Verify 12 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0227 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n12-c1', '13800001', 'dept-7', true);
      store.add('s7n12-c2', '13800002', 'dept-7', false);
      store.add('s7n12-c3', '13800003', 'dept-7', false);
      store.add('s7n12-c4', '13800004', 'dept-7', false);
      store.add('s7n12-c5', '13800005', 'dept-7', true);
      store.add('s7n12-c6', '13800006', 'dept-7', false);
      store.add('s7n12-c7', '13800007', 'dept-7', false);
      store.add('s7n12-c8', '13800008', 'dept-7', false);
      store.add('s7n12-c9', '13800009', 'dept-7', true);
      store.add('s7n12-c10', '138000010', 'dept-7', false);
      store.add('s7n12-c11', '138000011', 'dept-7', false);
      store.add('s7n12-c12', '138000012', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(11);
      expect(store.search('dept-7').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0227 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_22800
     * @tc.name      testScenarioGrid0228
     * @tc.desc      Verify 12 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0228 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n12-c1', '13800001', 'dept-8', false);
      store.add('s8n12-c2', '13800002', 'dept-8', false);
      store.add('s8n12-c3', '13800003', 'dept-8', false);
      store.add('s8n12-c4', '13800004', 'dept-8', true);
      store.add('s8n12-c5', '13800005', 'dept-8', false);
      store.add('s8n12-c6', '13800006', 'dept-8', false);
      store.add('s8n12-c7', '13800007', 'dept-8', false);
      store.add('s8n12-c8', '13800008', 'dept-8', true);
      store.add('s8n12-c9', '13800009', 'dept-8', false);
      store.add('s8n12-c10', '138000010', 'dept-8', false);
      store.add('s8n12-c11', '138000011', 'dept-8', false);
      store.add('s8n12-c12', '138000012', 'dept-8', true);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(11);
      expect(store.search('dept-8').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0228 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_22900
     * @tc.name      testScenarioGrid0229
     * @tc.desc      Verify 12 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0229 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n12-c1', '13800001', 'dept-9', false);
      store.add('s9n12-c2', '13800002', 'dept-9', false);
      store.add('s9n12-c3', '13800003', 'dept-9', true);
      store.add('s9n12-c4', '13800004', 'dept-9', false);
      store.add('s9n12-c5', '13800005', 'dept-9', false);
      store.add('s9n12-c6', '13800006', 'dept-9', false);
      store.add('s9n12-c7', '13800007', 'dept-9', true);
      store.add('s9n12-c8', '13800008', 'dept-9', false);
      store.add('s9n12-c9', '13800009', 'dept-9', false);
      store.add('s9n12-c10', '138000010', 'dept-9', false);
      store.add('s9n12-c11', '138000011', 'dept-9', true);
      store.add('s9n12-c12', '138000012', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(11);
      expect(store.search('dept-9').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0229 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_23000
     * @tc.name      testScenarioGrid0230
     * @tc.desc      Verify 12 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0230 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n12-c1', '13800001', 'dept-10', false);
      store.add('s10n12-c2', '13800002', 'dept-10', true);
      store.add('s10n12-c3', '13800003', 'dept-10', false);
      store.add('s10n12-c4', '13800004', 'dept-10', false);
      store.add('s10n12-c5', '13800005', 'dept-10', false);
      store.add('s10n12-c6', '13800006', 'dept-10', true);
      store.add('s10n12-c7', '13800007', 'dept-10', false);
      store.add('s10n12-c8', '13800008', 'dept-10', false);
      store.add('s10n12-c9', '13800009', 'dept-10', false);
      store.add('s10n12-c10', '138000010', 'dept-10', true);
      store.add('s10n12-c11', '138000011', 'dept-10', false);
      store.add('s10n12-c12', '138000012', 'dept-10', false);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(11);
      expect(store.search('dept-10').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0230 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_23100
     * @tc.name      testScenarioGrid0231
     * @tc.desc      Verify 12 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0231 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n12-c1', '13800001', 'dept-11', true);
      store.add('s11n12-c2', '13800002', 'dept-11', false);
      store.add('s11n12-c3', '13800003', 'dept-11', false);
      store.add('s11n12-c4', '13800004', 'dept-11', false);
      store.add('s11n12-c5', '13800005', 'dept-11', true);
      store.add('s11n12-c6', '13800006', 'dept-11', false);
      store.add('s11n12-c7', '13800007', 'dept-11', false);
      store.add('s11n12-c8', '13800008', 'dept-11', false);
      store.add('s11n12-c9', '13800009', 'dept-11', true);
      store.add('s11n12-c10', '138000010', 'dept-11', false);
      store.add('s11n12-c11', '138000011', 'dept-11', false);
      store.add('s11n12-c12', '138000012', 'dept-11', false);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(11);
      expect(store.search('dept-11').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0231 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_23200
     * @tc.name      testScenarioGrid0232
     * @tc.desc      Verify 12 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0232 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n12-c1', '13800001', 'dept-12', false);
      store.add('s12n12-c2', '13800002', 'dept-12', false);
      store.add('s12n12-c3', '13800003', 'dept-12', false);
      store.add('s12n12-c4', '13800004', 'dept-12', true);
      store.add('s12n12-c5', '13800005', 'dept-12', false);
      store.add('s12n12-c6', '13800006', 'dept-12', false);
      store.add('s12n12-c7', '13800007', 'dept-12', false);
      store.add('s12n12-c8', '13800008', 'dept-12', true);
      store.add('s12n12-c9', '13800009', 'dept-12', false);
      store.add('s12n12-c10', '138000010', 'dept-12', false);
      store.add('s12n12-c11', '138000011', 'dept-12', false);
      store.add('s12n12-c12', '138000012', 'dept-12', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(11);
      expect(store.search('dept-12').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0232 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_23300
     * @tc.name      testScenarioGrid0233
     * @tc.desc      Verify 12 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0233 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n12-c1', '13800001', 'dept-13', false);
      store.add('s13n12-c2', '13800002', 'dept-13', false);
      store.add('s13n12-c3', '13800003', 'dept-13', true);
      store.add('s13n12-c4', '13800004', 'dept-13', false);
      store.add('s13n12-c5', '13800005', 'dept-13', false);
      store.add('s13n12-c6', '13800006', 'dept-13', false);
      store.add('s13n12-c7', '13800007', 'dept-13', true);
      store.add('s13n12-c8', '13800008', 'dept-13', false);
      store.add('s13n12-c9', '13800009', 'dept-13', false);
      store.add('s13n12-c10', '138000010', 'dept-13', false);
      store.add('s13n12-c11', '138000011', 'dept-13', true);
      store.add('s13n12-c12', '138000012', 'dept-13', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(11);
      expect(store.search('dept-13').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0233 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_23400
     * @tc.name      testScenarioGrid0234
     * @tc.desc      Verify 12 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0234 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n12-c1', '13800001', 'dept-14', false);
      store.add('s14n12-c2', '13800002', 'dept-14', true);
      store.add('s14n12-c3', '13800003', 'dept-14', false);
      store.add('s14n12-c4', '13800004', 'dept-14', false);
      store.add('s14n12-c5', '13800005', 'dept-14', false);
      store.add('s14n12-c6', '13800006', 'dept-14', true);
      store.add('s14n12-c7', '13800007', 'dept-14', false);
      store.add('s14n12-c8', '13800008', 'dept-14', false);
      store.add('s14n12-c9', '13800009', 'dept-14', false);
      store.add('s14n12-c10', '138000010', 'dept-14', true);
      store.add('s14n12-c11', '138000011', 'dept-14', false);
      store.add('s14n12-c12', '138000012', 'dept-14', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(11);
      expect(store.search('dept-14').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0234 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_23500
     * @tc.name      testScenarioGrid0235
     * @tc.desc      Verify 12 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0235 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n12-c1', '13800001', 'dept-15', true);
      store.add('s15n12-c2', '13800002', 'dept-15', false);
      store.add('s15n12-c3', '13800003', 'dept-15', false);
      store.add('s15n12-c4', '13800004', 'dept-15', false);
      store.add('s15n12-c5', '13800005', 'dept-15', true);
      store.add('s15n12-c6', '13800006', 'dept-15', false);
      store.add('s15n12-c7', '13800007', 'dept-15', false);
      store.add('s15n12-c8', '13800008', 'dept-15', false);
      store.add('s15n12-c9', '13800009', 'dept-15', true);
      store.add('s15n12-c10', '138000010', 'dept-15', false);
      store.add('s15n12-c11', '138000011', 'dept-15', false);
      store.add('s15n12-c12', '138000012', 'dept-15', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(11);
      expect(store.search('dept-15').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0235 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_23600
     * @tc.name      testScenarioGrid0236
     * @tc.desc      Verify 12 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0236 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n12-c1', '13800001', 'dept-16', false);
      store.add('s16n12-c2', '13800002', 'dept-16', false);
      store.add('s16n12-c3', '13800003', 'dept-16', false);
      store.add('s16n12-c4', '13800004', 'dept-16', true);
      store.add('s16n12-c5', '13800005', 'dept-16', false);
      store.add('s16n12-c6', '13800006', 'dept-16', false);
      store.add('s16n12-c7', '13800007', 'dept-16', false);
      store.add('s16n12-c8', '13800008', 'dept-16', true);
      store.add('s16n12-c9', '13800009', 'dept-16', false);
      store.add('s16n12-c10', '138000010', 'dept-16', false);
      store.add('s16n12-c11', '138000011', 'dept-16', false);
      store.add('s16n12-c12', '138000012', 'dept-16', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(11);
      expect(store.search('dept-16').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0236 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_23700
     * @tc.name      testScenarioGrid0237
     * @tc.desc      Verify 12 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0237 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n12-c1', '13800001', 'dept-17', false);
      store.add('s17n12-c2', '13800002', 'dept-17', false);
      store.add('s17n12-c3', '13800003', 'dept-17', true);
      store.add('s17n12-c4', '13800004', 'dept-17', false);
      store.add('s17n12-c5', '13800005', 'dept-17', false);
      store.add('s17n12-c6', '13800006', 'dept-17', false);
      store.add('s17n12-c7', '13800007', 'dept-17', true);
      store.add('s17n12-c8', '13800008', 'dept-17', false);
      store.add('s17n12-c9', '13800009', 'dept-17', false);
      store.add('s17n12-c10', '138000010', 'dept-17', false);
      store.add('s17n12-c11', '138000011', 'dept-17', true);
      store.add('s17n12-c12', '138000012', 'dept-17', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(11);
      expect(store.search('dept-17').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0237 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_23800
     * @tc.name      testScenarioGrid0238
     * @tc.desc      Verify 12 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0238 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n12-c1', '13800001', 'dept-18', false);
      store.add('s18n12-c2', '13800002', 'dept-18', true);
      store.add('s18n12-c3', '13800003', 'dept-18', false);
      store.add('s18n12-c4', '13800004', 'dept-18', false);
      store.add('s18n12-c5', '13800005', 'dept-18', false);
      store.add('s18n12-c6', '13800006', 'dept-18', true);
      store.add('s18n12-c7', '13800007', 'dept-18', false);
      store.add('s18n12-c8', '13800008', 'dept-18', false);
      store.add('s18n12-c9', '13800009', 'dept-18', false);
      store.add('s18n12-c10', '138000010', 'dept-18', true);
      store.add('s18n12-c11', '138000011', 'dept-18', false);
      store.add('s18n12-c12', '138000012', 'dept-18', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(null);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(11);
      expect(store.search('dept-18').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0238 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_23900
     * @tc.name      testScenarioGrid0239
     * @tc.desc      Verify 12 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0239 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n12-c1', '13800001', 'dept-19', true);
      store.add('s19n12-c2', '13800002', 'dept-19', false);
      store.add('s19n12-c3', '13800003', 'dept-19', false);
      store.add('s19n12-c4', '13800004', 'dept-19', false);
      store.add('s19n12-c5', '13800005', 'dept-19', true);
      store.add('s19n12-c6', '13800006', 'dept-19', false);
      store.add('s19n12-c7', '13800007', 'dept-19', false);
      store.add('s19n12-c8', '13800008', 'dept-19', false);
      store.add('s19n12-c9', '13800009', 'dept-19', true);
      store.add('s19n12-c10', '138000010', 'dept-19', false);
      store.add('s19n12-c11', '138000011', 'dept-19', false);
      store.add('s19n12-c12', '138000012', 'dept-19', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(11);
      expect(store.search('dept-19').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0239 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP6_24000
     * @tc.name      testScenarioGrid0240
     * @tc.desc      Verify 12 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0240 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n12-c1', '13800001', 'dept-20', false);
      store.add('s20n12-c2', '13800002', 'dept-20', false);
      store.add('s20n12-c3', '13800003', 'dept-20', false);
      store.add('s20n12-c4', '13800004', 'dept-20', true);
      store.add('s20n12-c5', '13800005', 'dept-20', false);
      store.add('s20n12-c6', '13800006', 'dept-20', false);
      store.add('s20n12-c7', '13800007', 'dept-20', false);
      store.add('s20n12-c8', '13800008', 'dept-20', true);
      store.add('s20n12-c9', '13800009', 'dept-20', false);
      store.add('s20n12-c10', '138000010', 'dept-20', false);
      store.add('s20n12-c11', '138000011', 'dept-20', false);
      store.add('s20n12-c12', '138000012', 'dept-20', true);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(11);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(11);
      expect(store.search('dept-20').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0240 end');
    })

  })
}
