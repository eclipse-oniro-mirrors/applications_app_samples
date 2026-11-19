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

export default function ContactScenarioGridMatrixPart7Test(): void {
  describe('ContactScenarioGridMatrixPart7', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_24100
     * @tc.name      testScenarioGrid0241
     * @tc.desc      Verify 13 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0241 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n13-c1', '13800001', 'dept-1', false);
      store.add('s1n13-c2', '13800002', 'dept-1', false);
      store.add('s1n13-c3', '13800003', 'dept-1', true);
      store.add('s1n13-c4', '13800004', 'dept-1', false);
      store.add('s1n13-c5', '13800005', 'dept-1', false);
      store.add('s1n13-c6', '13800006', 'dept-1', false);
      store.add('s1n13-c7', '13800007', 'dept-1', true);
      store.add('s1n13-c8', '13800008', 'dept-1', false);
      store.add('s1n13-c9', '13800009', 'dept-1', false);
      store.add('s1n13-c10', '138000010', 'dept-1', false);
      store.add('s1n13-c11', '138000011', 'dept-1', true);
      store.add('s1n13-c12', '138000012', 'dept-1', false);
      store.add('s1n13-c13', '138000013', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(12);
      expect(store.search('dept-1').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0241 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_24200
     * @tc.name      testScenarioGrid0242
     * @tc.desc      Verify 13 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0242 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n13-c1', '13800001', 'dept-2', false);
      store.add('s2n13-c2', '13800002', 'dept-2', true);
      store.add('s2n13-c3', '13800003', 'dept-2', false);
      store.add('s2n13-c4', '13800004', 'dept-2', false);
      store.add('s2n13-c5', '13800005', 'dept-2', false);
      store.add('s2n13-c6', '13800006', 'dept-2', true);
      store.add('s2n13-c7', '13800007', 'dept-2', false);
      store.add('s2n13-c8', '13800008', 'dept-2', false);
      store.add('s2n13-c9', '13800009', 'dept-2', false);
      store.add('s2n13-c10', '138000010', 'dept-2', true);
      store.add('s2n13-c11', '138000011', 'dept-2', false);
      store.add('s2n13-c12', '138000012', 'dept-2', false);
      store.add('s2n13-c13', '138000013', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(12);
      expect(store.search('dept-2').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0242 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_24300
     * @tc.name      testScenarioGrid0243
     * @tc.desc      Verify 13 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0243 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n13-c1', '13800001', 'dept-3', true);
      store.add('s3n13-c2', '13800002', 'dept-3', false);
      store.add('s3n13-c3', '13800003', 'dept-3', false);
      store.add('s3n13-c4', '13800004', 'dept-3', false);
      store.add('s3n13-c5', '13800005', 'dept-3', true);
      store.add('s3n13-c6', '13800006', 'dept-3', false);
      store.add('s3n13-c7', '13800007', 'dept-3', false);
      store.add('s3n13-c8', '13800008', 'dept-3', false);
      store.add('s3n13-c9', '13800009', 'dept-3', true);
      store.add('s3n13-c10', '138000010', 'dept-3', false);
      store.add('s3n13-c11', '138000011', 'dept-3', false);
      store.add('s3n13-c12', '138000012', 'dept-3', false);
      store.add('s3n13-c13', '138000013', 'dept-3', true);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(12);
      expect(store.search('dept-3').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0243 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_24400
     * @tc.name      testScenarioGrid0244
     * @tc.desc      Verify 13 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0244 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n13-c1', '13800001', 'dept-4', false);
      store.add('s4n13-c2', '13800002', 'dept-4', false);
      store.add('s4n13-c3', '13800003', 'dept-4', false);
      store.add('s4n13-c4', '13800004', 'dept-4', true);
      store.add('s4n13-c5', '13800005', 'dept-4', false);
      store.add('s4n13-c6', '13800006', 'dept-4', false);
      store.add('s4n13-c7', '13800007', 'dept-4', false);
      store.add('s4n13-c8', '13800008', 'dept-4', true);
      store.add('s4n13-c9', '13800009', 'dept-4', false);
      store.add('s4n13-c10', '138000010', 'dept-4', false);
      store.add('s4n13-c11', '138000011', 'dept-4', false);
      store.add('s4n13-c12', '138000012', 'dept-4', true);
      store.add('s4n13-c13', '138000013', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(12);
      expect(store.search('dept-4').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0244 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_24500
     * @tc.name      testScenarioGrid0245
     * @tc.desc      Verify 13 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0245 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n13-c1', '13800001', 'dept-5', false);
      store.add('s5n13-c2', '13800002', 'dept-5', false);
      store.add('s5n13-c3', '13800003', 'dept-5', true);
      store.add('s5n13-c4', '13800004', 'dept-5', false);
      store.add('s5n13-c5', '13800005', 'dept-5', false);
      store.add('s5n13-c6', '13800006', 'dept-5', false);
      store.add('s5n13-c7', '13800007', 'dept-5', true);
      store.add('s5n13-c8', '13800008', 'dept-5', false);
      store.add('s5n13-c9', '13800009', 'dept-5', false);
      store.add('s5n13-c10', '138000010', 'dept-5', false);
      store.add('s5n13-c11', '138000011', 'dept-5', true);
      store.add('s5n13-c12', '138000012', 'dept-5', false);
      store.add('s5n13-c13', '138000013', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(false);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(12);
      expect(store.search('dept-5').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0245 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_24600
     * @tc.name      testScenarioGrid0246
     * @tc.desc      Verify 13 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0246 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n13-c1', '13800001', 'dept-6', false);
      store.add('s6n13-c2', '13800002', 'dept-6', true);
      store.add('s6n13-c3', '13800003', 'dept-6', false);
      store.add('s6n13-c4', '13800004', 'dept-6', false);
      store.add('s6n13-c5', '13800005', 'dept-6', false);
      store.add('s6n13-c6', '13800006', 'dept-6', true);
      store.add('s6n13-c7', '13800007', 'dept-6', false);
      store.add('s6n13-c8', '13800008', 'dept-6', false);
      store.add('s6n13-c9', '13800009', 'dept-6', false);
      store.add('s6n13-c10', '138000010', 'dept-6', true);
      store.add('s6n13-c11', '138000011', 'dept-6', false);
      store.add('s6n13-c12', '138000012', 'dept-6', false);
      store.add('s6n13-c13', '138000013', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(false);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(12);
      expect(store.search('dept-6').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0246 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_24700
     * @tc.name      testScenarioGrid0247
     * @tc.desc      Verify 13 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0247 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n13-c1', '13800001', 'dept-7', true);
      store.add('s7n13-c2', '13800002', 'dept-7', false);
      store.add('s7n13-c3', '13800003', 'dept-7', false);
      store.add('s7n13-c4', '13800004', 'dept-7', false);
      store.add('s7n13-c5', '13800005', 'dept-7', true);
      store.add('s7n13-c6', '13800006', 'dept-7', false);
      store.add('s7n13-c7', '13800007', 'dept-7', false);
      store.add('s7n13-c8', '13800008', 'dept-7', false);
      store.add('s7n13-c9', '13800009', 'dept-7', true);
      store.add('s7n13-c10', '138000010', 'dept-7', false);
      store.add('s7n13-c11', '138000011', 'dept-7', false);
      store.add('s7n13-c12', '138000012', 'dept-7', false);
      store.add('s7n13-c13', '138000013', 'dept-7', true);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(false);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(12);
      expect(store.search('dept-7').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0247 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_24800
     * @tc.name      testScenarioGrid0248
     * @tc.desc      Verify 13 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0248 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n13-c1', '13800001', 'dept-8', false);
      store.add('s8n13-c2', '13800002', 'dept-8', false);
      store.add('s8n13-c3', '13800003', 'dept-8', false);
      store.add('s8n13-c4', '13800004', 'dept-8', true);
      store.add('s8n13-c5', '13800005', 'dept-8', false);
      store.add('s8n13-c6', '13800006', 'dept-8', false);
      store.add('s8n13-c7', '13800007', 'dept-8', false);
      store.add('s8n13-c8', '13800008', 'dept-8', true);
      store.add('s8n13-c9', '13800009', 'dept-8', false);
      store.add('s8n13-c10', '138000010', 'dept-8', false);
      store.add('s8n13-c11', '138000011', 'dept-8', false);
      store.add('s8n13-c12', '138000012', 'dept-8', true);
      store.add('s8n13-c13', '138000013', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(12)).assertEqual(false);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(12);
      expect(store.search('dept-8').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0248 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_24900
     * @tc.name      testScenarioGrid0249
     * @tc.desc      Verify 13 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0249 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n13-c1', '13800001', 'dept-9', false);
      store.add('s9n13-c2', '13800002', 'dept-9', false);
      store.add('s9n13-c3', '13800003', 'dept-9', true);
      store.add('s9n13-c4', '13800004', 'dept-9', false);
      store.add('s9n13-c5', '13800005', 'dept-9', false);
      store.add('s9n13-c6', '13800006', 'dept-9', false);
      store.add('s9n13-c7', '13800007', 'dept-9', true);
      store.add('s9n13-c8', '13800008', 'dept-9', false);
      store.add('s9n13-c9', '13800009', 'dept-9', false);
      store.add('s9n13-c10', '138000010', 'dept-9', false);
      store.add('s9n13-c11', '138000011', 'dept-9', true);
      store.add('s9n13-c12', '138000012', 'dept-9', false);
      store.add('s9n13-c13', '138000013', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(12);
      expect(store.search('dept-9').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0249 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_25000
     * @tc.name      testScenarioGrid0250
     * @tc.desc      Verify 13 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0250 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n13-c1', '13800001', 'dept-10', false);
      store.add('s10n13-c2', '13800002', 'dept-10', true);
      store.add('s10n13-c3', '13800003', 'dept-10', false);
      store.add('s10n13-c4', '13800004', 'dept-10', false);
      store.add('s10n13-c5', '13800005', 'dept-10', false);
      store.add('s10n13-c6', '13800006', 'dept-10', true);
      store.add('s10n13-c7', '13800007', 'dept-10', false);
      store.add('s10n13-c8', '13800008', 'dept-10', false);
      store.add('s10n13-c9', '13800009', 'dept-10', false);
      store.add('s10n13-c10', '138000010', 'dept-10', true);
      store.add('s10n13-c11', '138000011', 'dept-10', false);
      store.add('s10n13-c12', '138000012', 'dept-10', false);
      store.add('s10n13-c13', '138000013', 'dept-10', false);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(12);
      expect(store.search('dept-10').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0250 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_25100
     * @tc.name      testScenarioGrid0251
     * @tc.desc      Verify 13 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0251 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n13-c1', '13800001', 'dept-11', true);
      store.add('s11n13-c2', '13800002', 'dept-11', false);
      store.add('s11n13-c3', '13800003', 'dept-11', false);
      store.add('s11n13-c4', '13800004', 'dept-11', false);
      store.add('s11n13-c5', '13800005', 'dept-11', true);
      store.add('s11n13-c6', '13800006', 'dept-11', false);
      store.add('s11n13-c7', '13800007', 'dept-11', false);
      store.add('s11n13-c8', '13800008', 'dept-11', false);
      store.add('s11n13-c9', '13800009', 'dept-11', true);
      store.add('s11n13-c10', '138000010', 'dept-11', false);
      store.add('s11n13-c11', '138000011', 'dept-11', false);
      store.add('s11n13-c12', '138000012', 'dept-11', false);
      store.add('s11n13-c13', '138000013', 'dept-11', true);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(12);
      expect(store.search('dept-11').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0251 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_25200
     * @tc.name      testScenarioGrid0252
     * @tc.desc      Verify 13 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0252 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n13-c1', '13800001', 'dept-12', false);
      store.add('s12n13-c2', '13800002', 'dept-12', false);
      store.add('s12n13-c3', '13800003', 'dept-12', false);
      store.add('s12n13-c4', '13800004', 'dept-12', true);
      store.add('s12n13-c5', '13800005', 'dept-12', false);
      store.add('s12n13-c6', '13800006', 'dept-12', false);
      store.add('s12n13-c7', '13800007', 'dept-12', false);
      store.add('s12n13-c8', '13800008', 'dept-12', true);
      store.add('s12n13-c9', '13800009', 'dept-12', false);
      store.add('s12n13-c10', '138000010', 'dept-12', false);
      store.add('s12n13-c11', '138000011', 'dept-12', false);
      store.add('s12n13-c12', '138000012', 'dept-12', true);
      store.add('s12n13-c13', '138000013', 'dept-12', false);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(11)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(12);
      expect(store.search('dept-12').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0252 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_25300
     * @tc.name      testScenarioGrid0253
     * @tc.desc      Verify 13 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0253 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n13-c1', '13800001', 'dept-13', false);
      store.add('s13n13-c2', '13800002', 'dept-13', false);
      store.add('s13n13-c3', '13800003', 'dept-13', true);
      store.add('s13n13-c4', '13800004', 'dept-13', false);
      store.add('s13n13-c5', '13800005', 'dept-13', false);
      store.add('s13n13-c6', '13800006', 'dept-13', false);
      store.add('s13n13-c7', '13800007', 'dept-13', true);
      store.add('s13n13-c8', '13800008', 'dept-13', false);
      store.add('s13n13-c9', '13800009', 'dept-13', false);
      store.add('s13n13-c10', '138000010', 'dept-13', false);
      store.add('s13n13-c11', '138000011', 'dept-13', true);
      store.add('s13n13-c12', '138000012', 'dept-13', false);
      store.add('s13n13-c13', '138000013', 'dept-13', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(12);
      expect(store.search('dept-13').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0253 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_25400
     * @tc.name      testScenarioGrid0254
     * @tc.desc      Verify 13 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0254 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n13-c1', '13800001', 'dept-14', false);
      store.add('s14n13-c2', '13800002', 'dept-14', true);
      store.add('s14n13-c3', '13800003', 'dept-14', false);
      store.add('s14n13-c4', '13800004', 'dept-14', false);
      store.add('s14n13-c5', '13800005', 'dept-14', false);
      store.add('s14n13-c6', '13800006', 'dept-14', true);
      store.add('s14n13-c7', '13800007', 'dept-14', false);
      store.add('s14n13-c8', '13800008', 'dept-14', false);
      store.add('s14n13-c9', '13800009', 'dept-14', false);
      store.add('s14n13-c10', '138000010', 'dept-14', true);
      store.add('s14n13-c11', '138000011', 'dept-14', false);
      store.add('s14n13-c12', '138000012', 'dept-14', false);
      store.add('s14n13-c13', '138000013', 'dept-14', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(12);
      expect(store.search('dept-14').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0254 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_25500
     * @tc.name      testScenarioGrid0255
     * @tc.desc      Verify 13 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0255 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n13-c1', '13800001', 'dept-15', true);
      store.add('s15n13-c2', '13800002', 'dept-15', false);
      store.add('s15n13-c3', '13800003', 'dept-15', false);
      store.add('s15n13-c4', '13800004', 'dept-15', false);
      store.add('s15n13-c5', '13800005', 'dept-15', true);
      store.add('s15n13-c6', '13800006', 'dept-15', false);
      store.add('s15n13-c7', '13800007', 'dept-15', false);
      store.add('s15n13-c8', '13800008', 'dept-15', false);
      store.add('s15n13-c9', '13800009', 'dept-15', true);
      store.add('s15n13-c10', '138000010', 'dept-15', false);
      store.add('s15n13-c11', '138000011', 'dept-15', false);
      store.add('s15n13-c12', '138000012', 'dept-15', false);
      store.add('s15n13-c13', '138000013', 'dept-15', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(12);
      expect(store.search('dept-15').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0255 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_25600
     * @tc.name      testScenarioGrid0256
     * @tc.desc      Verify 13 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0256 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n13-c1', '13800001', 'dept-16', false);
      store.add('s16n13-c2', '13800002', 'dept-16', false);
      store.add('s16n13-c3', '13800003', 'dept-16', false);
      store.add('s16n13-c4', '13800004', 'dept-16', true);
      store.add('s16n13-c5', '13800005', 'dept-16', false);
      store.add('s16n13-c6', '13800006', 'dept-16', false);
      store.add('s16n13-c7', '13800007', 'dept-16', false);
      store.add('s16n13-c8', '13800008', 'dept-16', true);
      store.add('s16n13-c9', '13800009', 'dept-16', false);
      store.add('s16n13-c10', '138000010', 'dept-16', false);
      store.add('s16n13-c11', '138000011', 'dept-16', false);
      store.add('s16n13-c12', '138000012', 'dept-16', true);
      store.add('s16n13-c13', '138000013', 'dept-16', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(12);
      expect(store.search('dept-16').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0256 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_25700
     * @tc.name      testScenarioGrid0257
     * @tc.desc      Verify 13 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0257 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n13-c1', '13800001', 'dept-17', false);
      store.add('s17n13-c2', '13800002', 'dept-17', false);
      store.add('s17n13-c3', '13800003', 'dept-17', true);
      store.add('s17n13-c4', '13800004', 'dept-17', false);
      store.add('s17n13-c5', '13800005', 'dept-17', false);
      store.add('s17n13-c6', '13800006', 'dept-17', false);
      store.add('s17n13-c7', '13800007', 'dept-17', true);
      store.add('s17n13-c8', '13800008', 'dept-17', false);
      store.add('s17n13-c9', '13800009', 'dept-17', false);
      store.add('s17n13-c10', '138000010', 'dept-17', false);
      store.add('s17n13-c11', '138000011', 'dept-17', true);
      store.add('s17n13-c12', '138000012', 'dept-17', false);
      store.add('s17n13-c13', '138000013', 'dept-17', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(12);
      expect(store.search('dept-17').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0257 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_25800
     * @tc.name      testScenarioGrid0258
     * @tc.desc      Verify 13 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0258 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n13-c1', '13800001', 'dept-18', false);
      store.add('s18n13-c2', '13800002', 'dept-18', true);
      store.add('s18n13-c3', '13800003', 'dept-18', false);
      store.add('s18n13-c4', '13800004', 'dept-18', false);
      store.add('s18n13-c5', '13800005', 'dept-18', false);
      store.add('s18n13-c6', '13800006', 'dept-18', true);
      store.add('s18n13-c7', '13800007', 'dept-18', false);
      store.add('s18n13-c8', '13800008', 'dept-18', false);
      store.add('s18n13-c9', '13800009', 'dept-18', false);
      store.add('s18n13-c10', '138000010', 'dept-18', true);
      store.add('s18n13-c11', '138000011', 'dept-18', false);
      store.add('s18n13-c12', '138000012', 'dept-18', false);
      store.add('s18n13-c13', '138000013', 'dept-18', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(12);
      expect(store.search('dept-18').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0258 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_25900
     * @tc.name      testScenarioGrid0259
     * @tc.desc      Verify 13 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0259 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n13-c1', '13800001', 'dept-19', true);
      store.add('s19n13-c2', '13800002', 'dept-19', false);
      store.add('s19n13-c3', '13800003', 'dept-19', false);
      store.add('s19n13-c4', '13800004', 'dept-19', false);
      store.add('s19n13-c5', '13800005', 'dept-19', true);
      store.add('s19n13-c6', '13800006', 'dept-19', false);
      store.add('s19n13-c7', '13800007', 'dept-19', false);
      store.add('s19n13-c8', '13800008', 'dept-19', false);
      store.add('s19n13-c9', '13800009', 'dept-19', true);
      store.add('s19n13-c10', '138000010', 'dept-19', false);
      store.add('s19n13-c11', '138000011', 'dept-19', false);
      store.add('s19n13-c12', '138000012', 'dept-19', false);
      store.add('s19n13-c13', '138000013', 'dept-19', true);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(12);
      expect(store.search('dept-19').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0259 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_26000
     * @tc.name      testScenarioGrid0260
     * @tc.desc      Verify 13 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0260 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n13-c1', '13800001', 'dept-20', false);
      store.add('s20n13-c2', '13800002', 'dept-20', false);
      store.add('s20n13-c3', '13800003', 'dept-20', false);
      store.add('s20n13-c4', '13800004', 'dept-20', true);
      store.add('s20n13-c5', '13800005', 'dept-20', false);
      store.add('s20n13-c6', '13800006', 'dept-20', false);
      store.add('s20n13-c7', '13800007', 'dept-20', false);
      store.add('s20n13-c8', '13800008', 'dept-20', true);
      store.add('s20n13-c9', '13800009', 'dept-20', false);
      store.add('s20n13-c10', '138000010', 'dept-20', false);
      store.add('s20n13-c11', '138000011', 'dept-20', false);
      store.add('s20n13-c12', '138000012', 'dept-20', true);
      store.add('s20n13-c13', '138000013', 'dept-20', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(12);
      expect(store.search('dept-20').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0260 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_26100
     * @tc.name      testScenarioGrid0261
     * @tc.desc      Verify 14 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0261 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n14-c1', '13800001', 'dept-1', false);
      store.add('s1n14-c2', '13800002', 'dept-1', false);
      store.add('s1n14-c3', '13800003', 'dept-1', true);
      store.add('s1n14-c4', '13800004', 'dept-1', false);
      store.add('s1n14-c5', '13800005', 'dept-1', false);
      store.add('s1n14-c6', '13800006', 'dept-1', false);
      store.add('s1n14-c7', '13800007', 'dept-1', true);
      store.add('s1n14-c8', '13800008', 'dept-1', false);
      store.add('s1n14-c9', '13800009', 'dept-1', false);
      store.add('s1n14-c10', '138000010', 'dept-1', false);
      store.add('s1n14-c11', '138000011', 'dept-1', true);
      store.add('s1n14-c12', '138000012', 'dept-1', false);
      store.add('s1n14-c13', '138000013', 'dept-1', false);
      store.add('s1n14-c14', '138000014', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(13);
      expect(store.search('dept-1').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0261 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_26200
     * @tc.name      testScenarioGrid0262
     * @tc.desc      Verify 14 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0262 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n14-c1', '13800001', 'dept-2', false);
      store.add('s2n14-c2', '13800002', 'dept-2', true);
      store.add('s2n14-c3', '13800003', 'dept-2', false);
      store.add('s2n14-c4', '13800004', 'dept-2', false);
      store.add('s2n14-c5', '13800005', 'dept-2', false);
      store.add('s2n14-c6', '13800006', 'dept-2', true);
      store.add('s2n14-c7', '13800007', 'dept-2', false);
      store.add('s2n14-c8', '13800008', 'dept-2', false);
      store.add('s2n14-c9', '13800009', 'dept-2', false);
      store.add('s2n14-c10', '138000010', 'dept-2', true);
      store.add('s2n14-c11', '138000011', 'dept-2', false);
      store.add('s2n14-c12', '138000012', 'dept-2', false);
      store.add('s2n14-c13', '138000013', 'dept-2', false);
      store.add('s2n14-c14', '138000014', 'dept-2', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(13);
      expect(store.search('dept-2').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0262 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_26300
     * @tc.name      testScenarioGrid0263
     * @tc.desc      Verify 14 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0263 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n14-c1', '13800001', 'dept-3', true);
      store.add('s3n14-c2', '13800002', 'dept-3', false);
      store.add('s3n14-c3', '13800003', 'dept-3', false);
      store.add('s3n14-c4', '13800004', 'dept-3', false);
      store.add('s3n14-c5', '13800005', 'dept-3', true);
      store.add('s3n14-c6', '13800006', 'dept-3', false);
      store.add('s3n14-c7', '13800007', 'dept-3', false);
      store.add('s3n14-c8', '13800008', 'dept-3', false);
      store.add('s3n14-c9', '13800009', 'dept-3', true);
      store.add('s3n14-c10', '138000010', 'dept-3', false);
      store.add('s3n14-c11', '138000011', 'dept-3', false);
      store.add('s3n14-c12', '138000012', 'dept-3', false);
      store.add('s3n14-c13', '138000013', 'dept-3', true);
      store.add('s3n14-c14', '138000014', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(13);
      expect(store.search('dept-3').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0263 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_26400
     * @tc.name      testScenarioGrid0264
     * @tc.desc      Verify 14 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0264 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n14-c1', '13800001', 'dept-4', false);
      store.add('s4n14-c2', '13800002', 'dept-4', false);
      store.add('s4n14-c3', '13800003', 'dept-4', false);
      store.add('s4n14-c4', '13800004', 'dept-4', true);
      store.add('s4n14-c5', '13800005', 'dept-4', false);
      store.add('s4n14-c6', '13800006', 'dept-4', false);
      store.add('s4n14-c7', '13800007', 'dept-4', false);
      store.add('s4n14-c8', '13800008', 'dept-4', true);
      store.add('s4n14-c9', '13800009', 'dept-4', false);
      store.add('s4n14-c10', '138000010', 'dept-4', false);
      store.add('s4n14-c11', '138000011', 'dept-4', false);
      store.add('s4n14-c12', '138000012', 'dept-4', true);
      store.add('s4n14-c13', '138000013', 'dept-4', false);
      store.add('s4n14-c14', '138000014', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(13);
      expect(store.search('dept-4').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0264 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_26500
     * @tc.name      testScenarioGrid0265
     * @tc.desc      Verify 14 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0265 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n14-c1', '13800001', 'dept-5', false);
      store.add('s5n14-c2', '13800002', 'dept-5', false);
      store.add('s5n14-c3', '13800003', 'dept-5', true);
      store.add('s5n14-c4', '13800004', 'dept-5', false);
      store.add('s5n14-c5', '13800005', 'dept-5', false);
      store.add('s5n14-c6', '13800006', 'dept-5', false);
      store.add('s5n14-c7', '13800007', 'dept-5', true);
      store.add('s5n14-c8', '13800008', 'dept-5', false);
      store.add('s5n14-c9', '13800009', 'dept-5', false);
      store.add('s5n14-c10', '138000010', 'dept-5', false);
      store.add('s5n14-c11', '138000011', 'dept-5', true);
      store.add('s5n14-c12', '138000012', 'dept-5', false);
      store.add('s5n14-c13', '138000013', 'dept-5', false);
      store.add('s5n14-c14', '138000014', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(13);
      expect(store.search('dept-5').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0265 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_26600
     * @tc.name      testScenarioGrid0266
     * @tc.desc      Verify 14 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0266 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n14-c1', '13800001', 'dept-6', false);
      store.add('s6n14-c2', '13800002', 'dept-6', true);
      store.add('s6n14-c3', '13800003', 'dept-6', false);
      store.add('s6n14-c4', '13800004', 'dept-6', false);
      store.add('s6n14-c5', '13800005', 'dept-6', false);
      store.add('s6n14-c6', '13800006', 'dept-6', true);
      store.add('s6n14-c7', '13800007', 'dept-6', false);
      store.add('s6n14-c8', '13800008', 'dept-6', false);
      store.add('s6n14-c9', '13800009', 'dept-6', false);
      store.add('s6n14-c10', '138000010', 'dept-6', true);
      store.add('s6n14-c11', '138000011', 'dept-6', false);
      store.add('s6n14-c12', '138000012', 'dept-6', false);
      store.add('s6n14-c13', '138000013', 'dept-6', false);
      store.add('s6n14-c14', '138000014', 'dept-6', true);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(13);
      expect(store.search('dept-6').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0266 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_26700
     * @tc.name      testScenarioGrid0267
     * @tc.desc      Verify 14 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0267 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n14-c1', '13800001', 'dept-7', true);
      store.add('s7n14-c2', '13800002', 'dept-7', false);
      store.add('s7n14-c3', '13800003', 'dept-7', false);
      store.add('s7n14-c4', '13800004', 'dept-7', false);
      store.add('s7n14-c5', '13800005', 'dept-7', true);
      store.add('s7n14-c6', '13800006', 'dept-7', false);
      store.add('s7n14-c7', '13800007', 'dept-7', false);
      store.add('s7n14-c8', '13800008', 'dept-7', false);
      store.add('s7n14-c9', '13800009', 'dept-7', true);
      store.add('s7n14-c10', '138000010', 'dept-7', false);
      store.add('s7n14-c11', '138000011', 'dept-7', false);
      store.add('s7n14-c12', '138000012', 'dept-7', false);
      store.add('s7n14-c13', '138000013', 'dept-7', true);
      store.add('s7n14-c14', '138000014', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(null);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(13);
      expect(store.search('dept-7').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0267 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_26800
     * @tc.name      testScenarioGrid0268
     * @tc.desc      Verify 14 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0268 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n14-c1', '13800001', 'dept-8', false);
      store.add('s8n14-c2', '13800002', 'dept-8', false);
      store.add('s8n14-c3', '13800003', 'dept-8', false);
      store.add('s8n14-c4', '13800004', 'dept-8', true);
      store.add('s8n14-c5', '13800005', 'dept-8', false);
      store.add('s8n14-c6', '13800006', 'dept-8', false);
      store.add('s8n14-c7', '13800007', 'dept-8', false);
      store.add('s8n14-c8', '13800008', 'dept-8', true);
      store.add('s8n14-c9', '13800009', 'dept-8', false);
      store.add('s8n14-c10', '138000010', 'dept-8', false);
      store.add('s8n14-c11', '138000011', 'dept-8', false);
      store.add('s8n14-c12', '138000012', 'dept-8', true);
      store.add('s8n14-c13', '138000013', 'dept-8', false);
      store.add('s8n14-c14', '138000014', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(11)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(13);
      expect(store.search('dept-8').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0268 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_26900
     * @tc.name      testScenarioGrid0269
     * @tc.desc      Verify 14 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0269 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n14-c1', '13800001', 'dept-9', false);
      store.add('s9n14-c2', '13800002', 'dept-9', false);
      store.add('s9n14-c3', '13800003', 'dept-9', true);
      store.add('s9n14-c4', '13800004', 'dept-9', false);
      store.add('s9n14-c5', '13800005', 'dept-9', false);
      store.add('s9n14-c6', '13800006', 'dept-9', false);
      store.add('s9n14-c7', '13800007', 'dept-9', true);
      store.add('s9n14-c8', '13800008', 'dept-9', false);
      store.add('s9n14-c9', '13800009', 'dept-9', false);
      store.add('s9n14-c10', '138000010', 'dept-9', false);
      store.add('s9n14-c11', '138000011', 'dept-9', true);
      store.add('s9n14-c12', '138000012', 'dept-9', false);
      store.add('s9n14-c13', '138000013', 'dept-9', false);
      store.add('s9n14-c14', '138000014', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(14)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(13);
      expect(store.search('dept-9').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0269 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_27000
     * @tc.name      testScenarioGrid0270
     * @tc.desc      Verify 14 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0270 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n14-c1', '13800001', 'dept-10', false);
      store.add('s10n14-c2', '13800002', 'dept-10', true);
      store.add('s10n14-c3', '13800003', 'dept-10', false);
      store.add('s10n14-c4', '13800004', 'dept-10', false);
      store.add('s10n14-c5', '13800005', 'dept-10', false);
      store.add('s10n14-c6', '13800006', 'dept-10', true);
      store.add('s10n14-c7', '13800007', 'dept-10', false);
      store.add('s10n14-c8', '13800008', 'dept-10', false);
      store.add('s10n14-c9', '13800009', 'dept-10', false);
      store.add('s10n14-c10', '138000010', 'dept-10', true);
      store.add('s10n14-c11', '138000011', 'dept-10', false);
      store.add('s10n14-c12', '138000012', 'dept-10', false);
      store.add('s10n14-c13', '138000013', 'dept-10', false);
      store.add('s10n14-c14', '138000014', 'dept-10', true);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(13);
      expect(store.search('dept-10').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0270 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_27100
     * @tc.name      testScenarioGrid0271
     * @tc.desc      Verify 14 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0271 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n14-c1', '13800001', 'dept-11', true);
      store.add('s11n14-c2', '13800002', 'dept-11', false);
      store.add('s11n14-c3', '13800003', 'dept-11', false);
      store.add('s11n14-c4', '13800004', 'dept-11', false);
      store.add('s11n14-c5', '13800005', 'dept-11', true);
      store.add('s11n14-c6', '13800006', 'dept-11', false);
      store.add('s11n14-c7', '13800007', 'dept-11', false);
      store.add('s11n14-c8', '13800008', 'dept-11', false);
      store.add('s11n14-c9', '13800009', 'dept-11', true);
      store.add('s11n14-c10', '138000010', 'dept-11', false);
      store.add('s11n14-c11', '138000011', 'dept-11', false);
      store.add('s11n14-c12', '138000012', 'dept-11', false);
      store.add('s11n14-c13', '138000013', 'dept-11', true);
      store.add('s11n14-c14', '138000014', 'dept-11', false);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(13);
      expect(store.search('dept-11').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0271 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_27200
     * @tc.name      testScenarioGrid0272
     * @tc.desc      Verify 14 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0272 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n14-c1', '13800001', 'dept-12', false);
      store.add('s12n14-c2', '13800002', 'dept-12', false);
      store.add('s12n14-c3', '13800003', 'dept-12', false);
      store.add('s12n14-c4', '13800004', 'dept-12', true);
      store.add('s12n14-c5', '13800005', 'dept-12', false);
      store.add('s12n14-c6', '13800006', 'dept-12', false);
      store.add('s12n14-c7', '13800007', 'dept-12', false);
      store.add('s12n14-c8', '13800008', 'dept-12', true);
      store.add('s12n14-c9', '13800009', 'dept-12', false);
      store.add('s12n14-c10', '138000010', 'dept-12', false);
      store.add('s12n14-c11', '138000011', 'dept-12', false);
      store.add('s12n14-c12', '138000012', 'dept-12', true);
      store.add('s12n14-c13', '138000013', 'dept-12', false);
      store.add('s12n14-c14', '138000014', 'dept-12', false);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(13);
      expect(store.search('dept-12').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0272 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_27300
     * @tc.name      testScenarioGrid0273
     * @tc.desc      Verify 14 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0273 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n14-c1', '13800001', 'dept-13', false);
      store.add('s13n14-c2', '13800002', 'dept-13', false);
      store.add('s13n14-c3', '13800003', 'dept-13', true);
      store.add('s13n14-c4', '13800004', 'dept-13', false);
      store.add('s13n14-c5', '13800005', 'dept-13', false);
      store.add('s13n14-c6', '13800006', 'dept-13', false);
      store.add('s13n14-c7', '13800007', 'dept-13', true);
      store.add('s13n14-c8', '13800008', 'dept-13', false);
      store.add('s13n14-c9', '13800009', 'dept-13', false);
      store.add('s13n14-c10', '138000010', 'dept-13', false);
      store.add('s13n14-c11', '138000011', 'dept-13', true);
      store.add('s13n14-c12', '138000012', 'dept-13', false);
      store.add('s13n14-c13', '138000013', 'dept-13', false);
      store.add('s13n14-c14', '138000014', 'dept-13', false);
      expect(store.remove(14)).assertEqual(true);
      expect(store.toggleOnline(12)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(14) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(13);
      expect(store.search('dept-13').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0273 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_27400
     * @tc.name      testScenarioGrid0274
     * @tc.desc      Verify 14 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0274 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n14-c1', '13800001', 'dept-14', false);
      store.add('s14n14-c2', '13800002', 'dept-14', true);
      store.add('s14n14-c3', '13800003', 'dept-14', false);
      store.add('s14n14-c4', '13800004', 'dept-14', false);
      store.add('s14n14-c5', '13800005', 'dept-14', false);
      store.add('s14n14-c6', '13800006', 'dept-14', true);
      store.add('s14n14-c7', '13800007', 'dept-14', false);
      store.add('s14n14-c8', '13800008', 'dept-14', false);
      store.add('s14n14-c9', '13800009', 'dept-14', false);
      store.add('s14n14-c10', '138000010', 'dept-14', true);
      store.add('s14n14-c11', '138000011', 'dept-14', false);
      store.add('s14n14-c12', '138000012', 'dept-14', false);
      store.add('s14n14-c13', '138000013', 'dept-14', false);
      store.add('s14n14-c14', '138000014', 'dept-14', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(13);
      expect(store.search('dept-14').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0274 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_27500
     * @tc.name      testScenarioGrid0275
     * @tc.desc      Verify 14 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0275 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n14-c1', '13800001', 'dept-15', true);
      store.add('s15n14-c2', '13800002', 'dept-15', false);
      store.add('s15n14-c3', '13800003', 'dept-15', false);
      store.add('s15n14-c4', '13800004', 'dept-15', false);
      store.add('s15n14-c5', '13800005', 'dept-15', true);
      store.add('s15n14-c6', '13800006', 'dept-15', false);
      store.add('s15n14-c7', '13800007', 'dept-15', false);
      store.add('s15n14-c8', '13800008', 'dept-15', false);
      store.add('s15n14-c9', '13800009', 'dept-15', true);
      store.add('s15n14-c10', '138000010', 'dept-15', false);
      store.add('s15n14-c11', '138000011', 'dept-15', false);
      store.add('s15n14-c12', '138000012', 'dept-15', false);
      store.add('s15n14-c13', '138000013', 'dept-15', true);
      store.add('s15n14-c14', '138000014', 'dept-15', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(13);
      expect(store.search('dept-15').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0275 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_27600
     * @tc.name      testScenarioGrid0276
     * @tc.desc      Verify 14 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0276 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n14-c1', '13800001', 'dept-16', false);
      store.add('s16n14-c2', '13800002', 'dept-16', false);
      store.add('s16n14-c3', '13800003', 'dept-16', false);
      store.add('s16n14-c4', '13800004', 'dept-16', true);
      store.add('s16n14-c5', '13800005', 'dept-16', false);
      store.add('s16n14-c6', '13800006', 'dept-16', false);
      store.add('s16n14-c7', '13800007', 'dept-16', false);
      store.add('s16n14-c8', '13800008', 'dept-16', true);
      store.add('s16n14-c9', '13800009', 'dept-16', false);
      store.add('s16n14-c10', '138000010', 'dept-16', false);
      store.add('s16n14-c11', '138000011', 'dept-16', false);
      store.add('s16n14-c12', '138000012', 'dept-16', true);
      store.add('s16n14-c13', '138000013', 'dept-16', false);
      store.add('s16n14-c14', '138000014', 'dept-16', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(13);
      expect(store.search('dept-16').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0276 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_27700
     * @tc.name      testScenarioGrid0277
     * @tc.desc      Verify 14 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0277 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n14-c1', '13800001', 'dept-17', false);
      store.add('s17n14-c2', '13800002', 'dept-17', false);
      store.add('s17n14-c3', '13800003', 'dept-17', true);
      store.add('s17n14-c4', '13800004', 'dept-17', false);
      store.add('s17n14-c5', '13800005', 'dept-17', false);
      store.add('s17n14-c6', '13800006', 'dept-17', false);
      store.add('s17n14-c7', '13800007', 'dept-17', true);
      store.add('s17n14-c8', '13800008', 'dept-17', false);
      store.add('s17n14-c9', '13800009', 'dept-17', false);
      store.add('s17n14-c10', '138000010', 'dept-17', false);
      store.add('s17n14-c11', '138000011', 'dept-17', true);
      store.add('s17n14-c12', '138000012', 'dept-17', false);
      store.add('s17n14-c13', '138000013', 'dept-17', false);
      store.add('s17n14-c14', '138000014', 'dept-17', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(13);
      expect(store.search('dept-17').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0277 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_27800
     * @tc.name      testScenarioGrid0278
     * @tc.desc      Verify 14 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0278 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n14-c1', '13800001', 'dept-18', false);
      store.add('s18n14-c2', '13800002', 'dept-18', true);
      store.add('s18n14-c3', '13800003', 'dept-18', false);
      store.add('s18n14-c4', '13800004', 'dept-18', false);
      store.add('s18n14-c5', '13800005', 'dept-18', false);
      store.add('s18n14-c6', '13800006', 'dept-18', true);
      store.add('s18n14-c7', '13800007', 'dept-18', false);
      store.add('s18n14-c8', '13800008', 'dept-18', false);
      store.add('s18n14-c9', '13800009', 'dept-18', false);
      store.add('s18n14-c10', '138000010', 'dept-18', true);
      store.add('s18n14-c11', '138000011', 'dept-18', false);
      store.add('s18n14-c12', '138000012', 'dept-18', false);
      store.add('s18n14-c13', '138000013', 'dept-18', false);
      store.add('s18n14-c14', '138000014', 'dept-18', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(13);
      expect(store.search('dept-18').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0278 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_27900
     * @tc.name      testScenarioGrid0279
     * @tc.desc      Verify 14 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0279 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n14-c1', '13800001', 'dept-19', true);
      store.add('s19n14-c2', '13800002', 'dept-19', false);
      store.add('s19n14-c3', '13800003', 'dept-19', false);
      store.add('s19n14-c4', '13800004', 'dept-19', false);
      store.add('s19n14-c5', '13800005', 'dept-19', true);
      store.add('s19n14-c6', '13800006', 'dept-19', false);
      store.add('s19n14-c7', '13800007', 'dept-19', false);
      store.add('s19n14-c8', '13800008', 'dept-19', false);
      store.add('s19n14-c9', '13800009', 'dept-19', true);
      store.add('s19n14-c10', '138000010', 'dept-19', false);
      store.add('s19n14-c11', '138000011', 'dept-19', false);
      store.add('s19n14-c12', '138000012', 'dept-19', false);
      store.add('s19n14-c13', '138000013', 'dept-19', true);
      store.add('s19n14-c14', '138000014', 'dept-19', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(13);
      expect(store.search('dept-19').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0279 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP7_28000
     * @tc.name      testScenarioGrid0280
     * @tc.desc      Verify 14 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0280 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n14-c1', '13800001', 'dept-20', false);
      store.add('s20n14-c2', '13800002', 'dept-20', false);
      store.add('s20n14-c3', '13800003', 'dept-20', false);
      store.add('s20n14-c4', '13800004', 'dept-20', true);
      store.add('s20n14-c5', '13800005', 'dept-20', false);
      store.add('s20n14-c6', '13800006', 'dept-20', false);
      store.add('s20n14-c7', '13800007', 'dept-20', false);
      store.add('s20n14-c8', '13800008', 'dept-20', true);
      store.add('s20n14-c9', '13800009', 'dept-20', false);
      store.add('s20n14-c10', '138000010', 'dept-20', false);
      store.add('s20n14-c11', '138000011', 'dept-20', false);
      store.add('s20n14-c12', '138000012', 'dept-20', true);
      store.add('s20n14-c13', '138000013', 'dept-20', false);
      store.add('s20n14-c14', '138000014', 'dept-20', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(13);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(13);
      expect(store.search('dept-20').length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0280 end');
    })

  })
}
