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

export default function ContactScenarioGridMatrixPart8Test(): void {
  describe('ContactScenarioGridMatrixPart8', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_28100
     * @tc.name      testScenarioGrid0281
     * @tc.desc      Verify 15 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0281 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n15-c1', '13800001', 'dept-1', false);
      store.add('s1n15-c2', '13800002', 'dept-1', false);
      store.add('s1n15-c3', '13800003', 'dept-1', true);
      store.add('s1n15-c4', '13800004', 'dept-1', false);
      store.add('s1n15-c5', '13800005', 'dept-1', false);
      store.add('s1n15-c6', '13800006', 'dept-1', false);
      store.add('s1n15-c7', '13800007', 'dept-1', true);
      store.add('s1n15-c8', '13800008', 'dept-1', false);
      store.add('s1n15-c9', '13800009', 'dept-1', false);
      store.add('s1n15-c10', '138000010', 'dept-1', false);
      store.add('s1n15-c11', '138000011', 'dept-1', true);
      store.add('s1n15-c12', '138000012', 'dept-1', false);
      store.add('s1n15-c13', '138000013', 'dept-1', false);
      store.add('s1n15-c14', '138000014', 'dept-1', false);
      store.add('s1n15-c15', '138000015', 'dept-1', true);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(14);
      expect(store.search('dept-1').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0281 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_28200
     * @tc.name      testScenarioGrid0282
     * @tc.desc      Verify 15 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0282 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n15-c1', '13800001', 'dept-2', false);
      store.add('s2n15-c2', '13800002', 'dept-2', true);
      store.add('s2n15-c3', '13800003', 'dept-2', false);
      store.add('s2n15-c4', '13800004', 'dept-2', false);
      store.add('s2n15-c5', '13800005', 'dept-2', false);
      store.add('s2n15-c6', '13800006', 'dept-2', true);
      store.add('s2n15-c7', '13800007', 'dept-2', false);
      store.add('s2n15-c8', '13800008', 'dept-2', false);
      store.add('s2n15-c9', '13800009', 'dept-2', false);
      store.add('s2n15-c10', '138000010', 'dept-2', true);
      store.add('s2n15-c11', '138000011', 'dept-2', false);
      store.add('s2n15-c12', '138000012', 'dept-2', false);
      store.add('s2n15-c13', '138000013', 'dept-2', false);
      store.add('s2n15-c14', '138000014', 'dept-2', true);
      store.add('s2n15-c15', '138000015', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(14);
      expect(store.search('dept-2').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0282 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_28300
     * @tc.name      testScenarioGrid0283
     * @tc.desc      Verify 15 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0283 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n15-c1', '13800001', 'dept-3', true);
      store.add('s3n15-c2', '13800002', 'dept-3', false);
      store.add('s3n15-c3', '13800003', 'dept-3', false);
      store.add('s3n15-c4', '13800004', 'dept-3', false);
      store.add('s3n15-c5', '13800005', 'dept-3', true);
      store.add('s3n15-c6', '13800006', 'dept-3', false);
      store.add('s3n15-c7', '13800007', 'dept-3', false);
      store.add('s3n15-c8', '13800008', 'dept-3', false);
      store.add('s3n15-c9', '13800009', 'dept-3', true);
      store.add('s3n15-c10', '138000010', 'dept-3', false);
      store.add('s3n15-c11', '138000011', 'dept-3', false);
      store.add('s3n15-c12', '138000012', 'dept-3', false);
      store.add('s3n15-c13', '138000013', 'dept-3', true);
      store.add('s3n15-c14', '138000014', 'dept-3', false);
      store.add('s3n15-c15', '138000015', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(14);
      expect(store.search('dept-3').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0283 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_28400
     * @tc.name      testScenarioGrid0284
     * @tc.desc      Verify 15 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0284 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n15-c1', '13800001', 'dept-4', false);
      store.add('s4n15-c2', '13800002', 'dept-4', false);
      store.add('s4n15-c3', '13800003', 'dept-4', false);
      store.add('s4n15-c4', '13800004', 'dept-4', true);
      store.add('s4n15-c5', '13800005', 'dept-4', false);
      store.add('s4n15-c6', '13800006', 'dept-4', false);
      store.add('s4n15-c7', '13800007', 'dept-4', false);
      store.add('s4n15-c8', '13800008', 'dept-4', true);
      store.add('s4n15-c9', '13800009', 'dept-4', false);
      store.add('s4n15-c10', '138000010', 'dept-4', false);
      store.add('s4n15-c11', '138000011', 'dept-4', false);
      store.add('s4n15-c12', '138000012', 'dept-4', true);
      store.add('s4n15-c13', '138000013', 'dept-4', false);
      store.add('s4n15-c14', '138000014', 'dept-4', false);
      store.add('s4n15-c15', '138000015', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(14);
      expect(store.search('dept-4').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0284 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_28500
     * @tc.name      testScenarioGrid0285
     * @tc.desc      Verify 15 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0285 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n15-c1', '13800001', 'dept-5', false);
      store.add('s5n15-c2', '13800002', 'dept-5', false);
      store.add('s5n15-c3', '13800003', 'dept-5', true);
      store.add('s5n15-c4', '13800004', 'dept-5', false);
      store.add('s5n15-c5', '13800005', 'dept-5', false);
      store.add('s5n15-c6', '13800006', 'dept-5', false);
      store.add('s5n15-c7', '13800007', 'dept-5', true);
      store.add('s5n15-c8', '13800008', 'dept-5', false);
      store.add('s5n15-c9', '13800009', 'dept-5', false);
      store.add('s5n15-c10', '138000010', 'dept-5', false);
      store.add('s5n15-c11', '138000011', 'dept-5', true);
      store.add('s5n15-c12', '138000012', 'dept-5', false);
      store.add('s5n15-c13', '138000013', 'dept-5', false);
      store.add('s5n15-c14', '138000014', 'dept-5', false);
      store.add('s5n15-c15', '138000015', 'dept-5', true);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(14);
      expect(store.search('dept-5').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0285 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_28600
     * @tc.name      testScenarioGrid0286
     * @tc.desc      Verify 15 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0286 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n15-c1', '13800001', 'dept-6', false);
      store.add('s6n15-c2', '13800002', 'dept-6', true);
      store.add('s6n15-c3', '13800003', 'dept-6', false);
      store.add('s6n15-c4', '13800004', 'dept-6', false);
      store.add('s6n15-c5', '13800005', 'dept-6', false);
      store.add('s6n15-c6', '13800006', 'dept-6', true);
      store.add('s6n15-c7', '13800007', 'dept-6', false);
      store.add('s6n15-c8', '13800008', 'dept-6', false);
      store.add('s6n15-c9', '13800009', 'dept-6', false);
      store.add('s6n15-c10', '138000010', 'dept-6', true);
      store.add('s6n15-c11', '138000011', 'dept-6', false);
      store.add('s6n15-c12', '138000012', 'dept-6', false);
      store.add('s6n15-c13', '138000013', 'dept-6', false);
      store.add('s6n15-c14', '138000014', 'dept-6', true);
      store.add('s6n15-c15', '138000015', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(14);
      expect(store.search('dept-6').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0286 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_28700
     * @tc.name      testScenarioGrid0287
     * @tc.desc      Verify 15 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0287 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n15-c1', '13800001', 'dept-7', true);
      store.add('s7n15-c2', '13800002', 'dept-7', false);
      store.add('s7n15-c3', '13800003', 'dept-7', false);
      store.add('s7n15-c4', '13800004', 'dept-7', false);
      store.add('s7n15-c5', '13800005', 'dept-7', true);
      store.add('s7n15-c6', '13800006', 'dept-7', false);
      store.add('s7n15-c7', '13800007', 'dept-7', false);
      store.add('s7n15-c8', '13800008', 'dept-7', false);
      store.add('s7n15-c9', '13800009', 'dept-7', true);
      store.add('s7n15-c10', '138000010', 'dept-7', false);
      store.add('s7n15-c11', '138000011', 'dept-7', false);
      store.add('s7n15-c12', '138000012', 'dept-7', false);
      store.add('s7n15-c13', '138000013', 'dept-7', true);
      store.add('s7n15-c14', '138000014', 'dept-7', false);
      store.add('s7n15-c15', '138000015', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(14);
      expect(store.search('dept-7').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0287 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_28800
     * @tc.name      testScenarioGrid0288
     * @tc.desc      Verify 15 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0288 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n15-c1', '13800001', 'dept-8', false);
      store.add('s8n15-c2', '13800002', 'dept-8', false);
      store.add('s8n15-c3', '13800003', 'dept-8', false);
      store.add('s8n15-c4', '13800004', 'dept-8', true);
      store.add('s8n15-c5', '13800005', 'dept-8', false);
      store.add('s8n15-c6', '13800006', 'dept-8', false);
      store.add('s8n15-c7', '13800007', 'dept-8', false);
      store.add('s8n15-c8', '13800008', 'dept-8', true);
      store.add('s8n15-c9', '13800009', 'dept-8', false);
      store.add('s8n15-c10', '138000010', 'dept-8', false);
      store.add('s8n15-c11', '138000011', 'dept-8', false);
      store.add('s8n15-c12', '138000012', 'dept-8', true);
      store.add('s8n15-c13', '138000013', 'dept-8', false);
      store.add('s8n15-c14', '138000014', 'dept-8', false);
      store.add('s8n15-c15', '138000015', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(14);
      expect(store.search('dept-8').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0288 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_28900
     * @tc.name      testScenarioGrid0289
     * @tc.desc      Verify 15 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0289 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n15-c1', '13800001', 'dept-9', false);
      store.add('s9n15-c2', '13800002', 'dept-9', false);
      store.add('s9n15-c3', '13800003', 'dept-9', true);
      store.add('s9n15-c4', '13800004', 'dept-9', false);
      store.add('s9n15-c5', '13800005', 'dept-9', false);
      store.add('s9n15-c6', '13800006', 'dept-9', false);
      store.add('s9n15-c7', '13800007', 'dept-9', true);
      store.add('s9n15-c8', '13800008', 'dept-9', false);
      store.add('s9n15-c9', '13800009', 'dept-9', false);
      store.add('s9n15-c10', '138000010', 'dept-9', false);
      store.add('s9n15-c11', '138000011', 'dept-9', true);
      store.add('s9n15-c12', '138000012', 'dept-9', false);
      store.add('s9n15-c13', '138000013', 'dept-9', false);
      store.add('s9n15-c14', '138000014', 'dept-9', false);
      store.add('s9n15-c15', '138000015', 'dept-9', true);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(14);
      expect(store.search('dept-9').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0289 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_29000
     * @tc.name      testScenarioGrid0290
     * @tc.desc      Verify 15 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0290 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n15-c1', '13800001', 'dept-10', false);
      store.add('s10n15-c2', '13800002', 'dept-10', true);
      store.add('s10n15-c3', '13800003', 'dept-10', false);
      store.add('s10n15-c4', '13800004', 'dept-10', false);
      store.add('s10n15-c5', '13800005', 'dept-10', false);
      store.add('s10n15-c6', '13800006', 'dept-10', true);
      store.add('s10n15-c7', '13800007', 'dept-10', false);
      store.add('s10n15-c8', '13800008', 'dept-10', false);
      store.add('s10n15-c9', '13800009', 'dept-10', false);
      store.add('s10n15-c10', '138000010', 'dept-10', true);
      store.add('s10n15-c11', '138000011', 'dept-10', false);
      store.add('s10n15-c12', '138000012', 'dept-10', false);
      store.add('s10n15-c13', '138000013', 'dept-10', false);
      store.add('s10n15-c14', '138000014', 'dept-10', true);
      store.add('s10n15-c15', '138000015', 'dept-10', false);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(14);
      expect(store.search('dept-10').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0290 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_29100
     * @tc.name      testScenarioGrid0291
     * @tc.desc      Verify 15 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0291 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n15-c1', '13800001', 'dept-11', true);
      store.add('s11n15-c2', '13800002', 'dept-11', false);
      store.add('s11n15-c3', '13800003', 'dept-11', false);
      store.add('s11n15-c4', '13800004', 'dept-11', false);
      store.add('s11n15-c5', '13800005', 'dept-11', true);
      store.add('s11n15-c6', '13800006', 'dept-11', false);
      store.add('s11n15-c7', '13800007', 'dept-11', false);
      store.add('s11n15-c8', '13800008', 'dept-11', false);
      store.add('s11n15-c9', '13800009', 'dept-11', true);
      store.add('s11n15-c10', '138000010', 'dept-11', false);
      store.add('s11n15-c11', '138000011', 'dept-11', false);
      store.add('s11n15-c12', '138000012', 'dept-11', false);
      store.add('s11n15-c13', '138000013', 'dept-11', true);
      store.add('s11n15-c14', '138000014', 'dept-11', false);
      store.add('s11n15-c15', '138000015', 'dept-11', false);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(14);
      expect(store.search('dept-11').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0291 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_29200
     * @tc.name      testScenarioGrid0292
     * @tc.desc      Verify 15 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0292 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n15-c1', '13800001', 'dept-12', false);
      store.add('s12n15-c2', '13800002', 'dept-12', false);
      store.add('s12n15-c3', '13800003', 'dept-12', false);
      store.add('s12n15-c4', '13800004', 'dept-12', true);
      store.add('s12n15-c5', '13800005', 'dept-12', false);
      store.add('s12n15-c6', '13800006', 'dept-12', false);
      store.add('s12n15-c7', '13800007', 'dept-12', false);
      store.add('s12n15-c8', '13800008', 'dept-12', true);
      store.add('s12n15-c9', '13800009', 'dept-12', false);
      store.add('s12n15-c10', '138000010', 'dept-12', false);
      store.add('s12n15-c11', '138000011', 'dept-12', false);
      store.add('s12n15-c12', '138000012', 'dept-12', true);
      store.add('s12n15-c13', '138000013', 'dept-12', false);
      store.add('s12n15-c14', '138000014', 'dept-12', false);
      store.add('s12n15-c15', '138000015', 'dept-12', false);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(14);
      expect(store.search('dept-12').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0292 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_29300
     * @tc.name      testScenarioGrid0293
     * @tc.desc      Verify 15 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0293 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n15-c1', '13800001', 'dept-13', false);
      store.add('s13n15-c2', '13800002', 'dept-13', false);
      store.add('s13n15-c3', '13800003', 'dept-13', true);
      store.add('s13n15-c4', '13800004', 'dept-13', false);
      store.add('s13n15-c5', '13800005', 'dept-13', false);
      store.add('s13n15-c6', '13800006', 'dept-13', false);
      store.add('s13n15-c7', '13800007', 'dept-13', true);
      store.add('s13n15-c8', '13800008', 'dept-13', false);
      store.add('s13n15-c9', '13800009', 'dept-13', false);
      store.add('s13n15-c10', '138000010', 'dept-13', false);
      store.add('s13n15-c11', '138000011', 'dept-13', true);
      store.add('s13n15-c12', '138000012', 'dept-13', false);
      store.add('s13n15-c13', '138000013', 'dept-13', false);
      store.add('s13n15-c14', '138000014', 'dept-13', false);
      store.add('s13n15-c15', '138000015', 'dept-13', true);
      expect(store.remove(14)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(14) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(14);
      expect(store.search('dept-13').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0293 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_29400
     * @tc.name      testScenarioGrid0294
     * @tc.desc      Verify 15 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0294 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n15-c1', '13800001', 'dept-14', false);
      store.add('s14n15-c2', '13800002', 'dept-14', true);
      store.add('s14n15-c3', '13800003', 'dept-14', false);
      store.add('s14n15-c4', '13800004', 'dept-14', false);
      store.add('s14n15-c5', '13800005', 'dept-14', false);
      store.add('s14n15-c6', '13800006', 'dept-14', true);
      store.add('s14n15-c7', '13800007', 'dept-14', false);
      store.add('s14n15-c8', '13800008', 'dept-14', false);
      store.add('s14n15-c9', '13800009', 'dept-14', false);
      store.add('s14n15-c10', '138000010', 'dept-14', true);
      store.add('s14n15-c11', '138000011', 'dept-14', false);
      store.add('s14n15-c12', '138000012', 'dept-14', false);
      store.add('s14n15-c13', '138000013', 'dept-14', false);
      store.add('s14n15-c14', '138000014', 'dept-14', true);
      store.add('s14n15-c15', '138000015', 'dept-14', false);
      expect(store.remove(15)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(15) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(14);
      expect(store.search('dept-14').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0294 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_29500
     * @tc.name      testScenarioGrid0295
     * @tc.desc      Verify 15 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0295 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n15-c1', '13800001', 'dept-15', true);
      store.add('s15n15-c2', '13800002', 'dept-15', false);
      store.add('s15n15-c3', '13800003', 'dept-15', false);
      store.add('s15n15-c4', '13800004', 'dept-15', false);
      store.add('s15n15-c5', '13800005', 'dept-15', true);
      store.add('s15n15-c6', '13800006', 'dept-15', false);
      store.add('s15n15-c7', '13800007', 'dept-15', false);
      store.add('s15n15-c8', '13800008', 'dept-15', false);
      store.add('s15n15-c9', '13800009', 'dept-15', true);
      store.add('s15n15-c10', '138000010', 'dept-15', false);
      store.add('s15n15-c11', '138000011', 'dept-15', false);
      store.add('s15n15-c12', '138000012', 'dept-15', false);
      store.add('s15n15-c13', '138000013', 'dept-15', true);
      store.add('s15n15-c14', '138000014', 'dept-15', false);
      store.add('s15n15-c15', '138000015', 'dept-15', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(14);
      expect(store.search('dept-15').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0295 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_29600
     * @tc.name      testScenarioGrid0296
     * @tc.desc      Verify 15 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0296 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n15-c1', '13800001', 'dept-16', false);
      store.add('s16n15-c2', '13800002', 'dept-16', false);
      store.add('s16n15-c3', '13800003', 'dept-16', false);
      store.add('s16n15-c4', '13800004', 'dept-16', true);
      store.add('s16n15-c5', '13800005', 'dept-16', false);
      store.add('s16n15-c6', '13800006', 'dept-16', false);
      store.add('s16n15-c7', '13800007', 'dept-16', false);
      store.add('s16n15-c8', '13800008', 'dept-16', true);
      store.add('s16n15-c9', '13800009', 'dept-16', false);
      store.add('s16n15-c10', '138000010', 'dept-16', false);
      store.add('s16n15-c11', '138000011', 'dept-16', false);
      store.add('s16n15-c12', '138000012', 'dept-16', true);
      store.add('s16n15-c13', '138000013', 'dept-16', false);
      store.add('s16n15-c14', '138000014', 'dept-16', false);
      store.add('s16n15-c15', '138000015', 'dept-16', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(false);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(14);
      expect(store.search('dept-16').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0296 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_29700
     * @tc.name      testScenarioGrid0297
     * @tc.desc      Verify 15 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0297 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n15-c1', '13800001', 'dept-17', false);
      store.add('s17n15-c2', '13800002', 'dept-17', false);
      store.add('s17n15-c3', '13800003', 'dept-17', true);
      store.add('s17n15-c4', '13800004', 'dept-17', false);
      store.add('s17n15-c5', '13800005', 'dept-17', false);
      store.add('s17n15-c6', '13800006', 'dept-17', false);
      store.add('s17n15-c7', '13800007', 'dept-17', true);
      store.add('s17n15-c8', '13800008', 'dept-17', false);
      store.add('s17n15-c9', '13800009', 'dept-17', false);
      store.add('s17n15-c10', '138000010', 'dept-17', false);
      store.add('s17n15-c11', '138000011', 'dept-17', true);
      store.add('s17n15-c12', '138000012', 'dept-17', false);
      store.add('s17n15-c13', '138000013', 'dept-17', false);
      store.add('s17n15-c14', '138000014', 'dept-17', false);
      store.add('s17n15-c15', '138000015', 'dept-17', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(false);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(14);
      expect(store.search('dept-17').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0297 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_29800
     * @tc.name      testScenarioGrid0298
     * @tc.desc      Verify 15 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0298 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n15-c1', '13800001', 'dept-18', false);
      store.add('s18n15-c2', '13800002', 'dept-18', true);
      store.add('s18n15-c3', '13800003', 'dept-18', false);
      store.add('s18n15-c4', '13800004', 'dept-18', false);
      store.add('s18n15-c5', '13800005', 'dept-18', false);
      store.add('s18n15-c6', '13800006', 'dept-18', true);
      store.add('s18n15-c7', '13800007', 'dept-18', false);
      store.add('s18n15-c8', '13800008', 'dept-18', false);
      store.add('s18n15-c9', '13800009', 'dept-18', false);
      store.add('s18n15-c10', '138000010', 'dept-18', true);
      store.add('s18n15-c11', '138000011', 'dept-18', false);
      store.add('s18n15-c12', '138000012', 'dept-18', false);
      store.add('s18n15-c13', '138000013', 'dept-18', false);
      store.add('s18n15-c14', '138000014', 'dept-18', true);
      store.add('s18n15-c15', '138000015', 'dept-18', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(false);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(14);
      expect(store.search('dept-18').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0298 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_29900
     * @tc.name      testScenarioGrid0299
     * @tc.desc      Verify 15 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0299 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n15-c1', '13800001', 'dept-19', true);
      store.add('s19n15-c2', '13800002', 'dept-19', false);
      store.add('s19n15-c3', '13800003', 'dept-19', false);
      store.add('s19n15-c4', '13800004', 'dept-19', false);
      store.add('s19n15-c5', '13800005', 'dept-19', true);
      store.add('s19n15-c6', '13800006', 'dept-19', false);
      store.add('s19n15-c7', '13800007', 'dept-19', false);
      store.add('s19n15-c8', '13800008', 'dept-19', false);
      store.add('s19n15-c9', '13800009', 'dept-19', true);
      store.add('s19n15-c10', '138000010', 'dept-19', false);
      store.add('s19n15-c11', '138000011', 'dept-19', false);
      store.add('s19n15-c12', '138000012', 'dept-19', false);
      store.add('s19n15-c13', '138000013', 'dept-19', true);
      store.add('s19n15-c14', '138000014', 'dept-19', false);
      store.add('s19n15-c15', '138000015', 'dept-19', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(false);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(14);
      expect(store.search('dept-19').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0299 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_30000
     * @tc.name      testScenarioGrid0300
     * @tc.desc      Verify 15 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0300 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n15-c1', '13800001', 'dept-20', false);
      store.add('s20n15-c2', '13800002', 'dept-20', false);
      store.add('s20n15-c3', '13800003', 'dept-20', false);
      store.add('s20n15-c4', '13800004', 'dept-20', true);
      store.add('s20n15-c5', '13800005', 'dept-20', false);
      store.add('s20n15-c6', '13800006', 'dept-20', false);
      store.add('s20n15-c7', '13800007', 'dept-20', false);
      store.add('s20n15-c8', '13800008', 'dept-20', true);
      store.add('s20n15-c9', '13800009', 'dept-20', false);
      store.add('s20n15-c10', '138000010', 'dept-20', false);
      store.add('s20n15-c11', '138000011', 'dept-20', false);
      store.add('s20n15-c12', '138000012', 'dept-20', true);
      store.add('s20n15-c13', '138000013', 'dept-20', false);
      store.add('s20n15-c14', '138000014', 'dept-20', false);
      store.add('s20n15-c15', '138000015', 'dept-20', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(14);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(14);
      expect(store.search('dept-20').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0300 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_30100
     * @tc.name      testScenarioGrid0301
     * @tc.desc      Verify 16 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0301 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n16-c1', '13800001', 'dept-1', false);
      store.add('s1n16-c2', '13800002', 'dept-1', false);
      store.add('s1n16-c3', '13800003', 'dept-1', true);
      store.add('s1n16-c4', '13800004', 'dept-1', false);
      store.add('s1n16-c5', '13800005', 'dept-1', false);
      store.add('s1n16-c6', '13800006', 'dept-1', false);
      store.add('s1n16-c7', '13800007', 'dept-1', true);
      store.add('s1n16-c8', '13800008', 'dept-1', false);
      store.add('s1n16-c9', '13800009', 'dept-1', false);
      store.add('s1n16-c10', '138000010', 'dept-1', false);
      store.add('s1n16-c11', '138000011', 'dept-1', true);
      store.add('s1n16-c12', '138000012', 'dept-1', false);
      store.add('s1n16-c13', '138000013', 'dept-1', false);
      store.add('s1n16-c14', '138000014', 'dept-1', false);
      store.add('s1n16-c15', '138000015', 'dept-1', true);
      store.add('s1n16-c16', '138000016', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(15);
      expect(store.search('dept-1').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0301 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_30200
     * @tc.name      testScenarioGrid0302
     * @tc.desc      Verify 16 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0302 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n16-c1', '13800001', 'dept-2', false);
      store.add('s2n16-c2', '13800002', 'dept-2', true);
      store.add('s2n16-c3', '13800003', 'dept-2', false);
      store.add('s2n16-c4', '13800004', 'dept-2', false);
      store.add('s2n16-c5', '13800005', 'dept-2', false);
      store.add('s2n16-c6', '13800006', 'dept-2', true);
      store.add('s2n16-c7', '13800007', 'dept-2', false);
      store.add('s2n16-c8', '13800008', 'dept-2', false);
      store.add('s2n16-c9', '13800009', 'dept-2', false);
      store.add('s2n16-c10', '138000010', 'dept-2', true);
      store.add('s2n16-c11', '138000011', 'dept-2', false);
      store.add('s2n16-c12', '138000012', 'dept-2', false);
      store.add('s2n16-c13', '138000013', 'dept-2', false);
      store.add('s2n16-c14', '138000014', 'dept-2', true);
      store.add('s2n16-c15', '138000015', 'dept-2', false);
      store.add('s2n16-c16', '138000016', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(15);
      expect(store.search('dept-2').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0302 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_30300
     * @tc.name      testScenarioGrid0303
     * @tc.desc      Verify 16 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0303 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n16-c1', '13800001', 'dept-3', true);
      store.add('s3n16-c2', '13800002', 'dept-3', false);
      store.add('s3n16-c3', '13800003', 'dept-3', false);
      store.add('s3n16-c4', '13800004', 'dept-3', false);
      store.add('s3n16-c5', '13800005', 'dept-3', true);
      store.add('s3n16-c6', '13800006', 'dept-3', false);
      store.add('s3n16-c7', '13800007', 'dept-3', false);
      store.add('s3n16-c8', '13800008', 'dept-3', false);
      store.add('s3n16-c9', '13800009', 'dept-3', true);
      store.add('s3n16-c10', '138000010', 'dept-3', false);
      store.add('s3n16-c11', '138000011', 'dept-3', false);
      store.add('s3n16-c12', '138000012', 'dept-3', false);
      store.add('s3n16-c13', '138000013', 'dept-3', true);
      store.add('s3n16-c14', '138000014', 'dept-3', false);
      store.add('s3n16-c15', '138000015', 'dept-3', false);
      store.add('s3n16-c16', '138000016', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(15);
      expect(store.search('dept-3').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0303 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_30400
     * @tc.name      testScenarioGrid0304
     * @tc.desc      Verify 16 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0304 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n16-c1', '13800001', 'dept-4', false);
      store.add('s4n16-c2', '13800002', 'dept-4', false);
      store.add('s4n16-c3', '13800003', 'dept-4', false);
      store.add('s4n16-c4', '13800004', 'dept-4', true);
      store.add('s4n16-c5', '13800005', 'dept-4', false);
      store.add('s4n16-c6', '13800006', 'dept-4', false);
      store.add('s4n16-c7', '13800007', 'dept-4', false);
      store.add('s4n16-c8', '13800008', 'dept-4', true);
      store.add('s4n16-c9', '13800009', 'dept-4', false);
      store.add('s4n16-c10', '138000010', 'dept-4', false);
      store.add('s4n16-c11', '138000011', 'dept-4', false);
      store.add('s4n16-c12', '138000012', 'dept-4', true);
      store.add('s4n16-c13', '138000013', 'dept-4', false);
      store.add('s4n16-c14', '138000014', 'dept-4', false);
      store.add('s4n16-c15', '138000015', 'dept-4', false);
      store.add('s4n16-c16', '138000016', 'dept-4', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(15);
      expect(store.search('dept-4').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0304 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_30500
     * @tc.name      testScenarioGrid0305
     * @tc.desc      Verify 16 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0305 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n16-c1', '13800001', 'dept-5', false);
      store.add('s5n16-c2', '13800002', 'dept-5', false);
      store.add('s5n16-c3', '13800003', 'dept-5', true);
      store.add('s5n16-c4', '13800004', 'dept-5', false);
      store.add('s5n16-c5', '13800005', 'dept-5', false);
      store.add('s5n16-c6', '13800006', 'dept-5', false);
      store.add('s5n16-c7', '13800007', 'dept-5', true);
      store.add('s5n16-c8', '13800008', 'dept-5', false);
      store.add('s5n16-c9', '13800009', 'dept-5', false);
      store.add('s5n16-c10', '138000010', 'dept-5', false);
      store.add('s5n16-c11', '138000011', 'dept-5', true);
      store.add('s5n16-c12', '138000012', 'dept-5', false);
      store.add('s5n16-c13', '138000013', 'dept-5', false);
      store.add('s5n16-c14', '138000014', 'dept-5', false);
      store.add('s5n16-c15', '138000015', 'dept-5', true);
      store.add('s5n16-c16', '138000016', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(15);
      expect(store.search('dept-5').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0305 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_30600
     * @tc.name      testScenarioGrid0306
     * @tc.desc      Verify 16 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0306 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n16-c1', '13800001', 'dept-6', false);
      store.add('s6n16-c2', '13800002', 'dept-6', true);
      store.add('s6n16-c3', '13800003', 'dept-6', false);
      store.add('s6n16-c4', '13800004', 'dept-6', false);
      store.add('s6n16-c5', '13800005', 'dept-6', false);
      store.add('s6n16-c6', '13800006', 'dept-6', true);
      store.add('s6n16-c7', '13800007', 'dept-6', false);
      store.add('s6n16-c8', '13800008', 'dept-6', false);
      store.add('s6n16-c9', '13800009', 'dept-6', false);
      store.add('s6n16-c10', '138000010', 'dept-6', true);
      store.add('s6n16-c11', '138000011', 'dept-6', false);
      store.add('s6n16-c12', '138000012', 'dept-6', false);
      store.add('s6n16-c13', '138000013', 'dept-6', false);
      store.add('s6n16-c14', '138000014', 'dept-6', true);
      store.add('s6n16-c15', '138000015', 'dept-6', false);
      store.add('s6n16-c16', '138000016', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(15);
      expect(store.search('dept-6').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0306 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_30700
     * @tc.name      testScenarioGrid0307
     * @tc.desc      Verify 16 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0307 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n16-c1', '13800001', 'dept-7', true);
      store.add('s7n16-c2', '13800002', 'dept-7', false);
      store.add('s7n16-c3', '13800003', 'dept-7', false);
      store.add('s7n16-c4', '13800004', 'dept-7', false);
      store.add('s7n16-c5', '13800005', 'dept-7', true);
      store.add('s7n16-c6', '13800006', 'dept-7', false);
      store.add('s7n16-c7', '13800007', 'dept-7', false);
      store.add('s7n16-c8', '13800008', 'dept-7', false);
      store.add('s7n16-c9', '13800009', 'dept-7', true);
      store.add('s7n16-c10', '138000010', 'dept-7', false);
      store.add('s7n16-c11', '138000011', 'dept-7', false);
      store.add('s7n16-c12', '138000012', 'dept-7', false);
      store.add('s7n16-c13', '138000013', 'dept-7', true);
      store.add('s7n16-c14', '138000014', 'dept-7', false);
      store.add('s7n16-c15', '138000015', 'dept-7', false);
      store.add('s7n16-c16', '138000016', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(15);
      expect(store.search('dept-7').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0307 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_30800
     * @tc.name      testScenarioGrid0308
     * @tc.desc      Verify 16 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0308 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n16-c1', '13800001', 'dept-8', false);
      store.add('s8n16-c2', '13800002', 'dept-8', false);
      store.add('s8n16-c3', '13800003', 'dept-8', false);
      store.add('s8n16-c4', '13800004', 'dept-8', true);
      store.add('s8n16-c5', '13800005', 'dept-8', false);
      store.add('s8n16-c6', '13800006', 'dept-8', false);
      store.add('s8n16-c7', '13800007', 'dept-8', false);
      store.add('s8n16-c8', '13800008', 'dept-8', true);
      store.add('s8n16-c9', '13800009', 'dept-8', false);
      store.add('s8n16-c10', '138000010', 'dept-8', false);
      store.add('s8n16-c11', '138000011', 'dept-8', false);
      store.add('s8n16-c12', '138000012', 'dept-8', true);
      store.add('s8n16-c13', '138000013', 'dept-8', false);
      store.add('s8n16-c14', '138000014', 'dept-8', false);
      store.add('s8n16-c15', '138000015', 'dept-8', false);
      store.add('s8n16-c16', '138000016', 'dept-8', true);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(null);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(15);
      expect(store.search('dept-8').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0308 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_30900
     * @tc.name      testScenarioGrid0309
     * @tc.desc      Verify 16 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0309 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n16-c1', '13800001', 'dept-9', false);
      store.add('s9n16-c2', '13800002', 'dept-9', false);
      store.add('s9n16-c3', '13800003', 'dept-9', true);
      store.add('s9n16-c4', '13800004', 'dept-9', false);
      store.add('s9n16-c5', '13800005', 'dept-9', false);
      store.add('s9n16-c6', '13800006', 'dept-9', false);
      store.add('s9n16-c7', '13800007', 'dept-9', true);
      store.add('s9n16-c8', '13800008', 'dept-9', false);
      store.add('s9n16-c9', '13800009', 'dept-9', false);
      store.add('s9n16-c10', '138000010', 'dept-9', false);
      store.add('s9n16-c11', '138000011', 'dept-9', true);
      store.add('s9n16-c12', '138000012', 'dept-9', false);
      store.add('s9n16-c13', '138000013', 'dept-9', false);
      store.add('s9n16-c14', '138000014', 'dept-9', false);
      store.add('s9n16-c15', '138000015', 'dept-9', true);
      store.add('s9n16-c16', '138000016', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(12)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(15);
      expect(store.search('dept-9').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0309 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_31000
     * @tc.name      testScenarioGrid0310
     * @tc.desc      Verify 16 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0310 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n16-c1', '13800001', 'dept-10', false);
      store.add('s10n16-c2', '13800002', 'dept-10', true);
      store.add('s10n16-c3', '13800003', 'dept-10', false);
      store.add('s10n16-c4', '13800004', 'dept-10', false);
      store.add('s10n16-c5', '13800005', 'dept-10', false);
      store.add('s10n16-c6', '13800006', 'dept-10', true);
      store.add('s10n16-c7', '13800007', 'dept-10', false);
      store.add('s10n16-c8', '13800008', 'dept-10', false);
      store.add('s10n16-c9', '13800009', 'dept-10', false);
      store.add('s10n16-c10', '138000010', 'dept-10', true);
      store.add('s10n16-c11', '138000011', 'dept-10', false);
      store.add('s10n16-c12', '138000012', 'dept-10', false);
      store.add('s10n16-c13', '138000013', 'dept-10', false);
      store.add('s10n16-c14', '138000014', 'dept-10', true);
      store.add('s10n16-c15', '138000015', 'dept-10', false);
      store.add('s10n16-c16', '138000016', 'dept-10', false);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(15)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(15);
      expect(store.search('dept-10').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0310 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_31100
     * @tc.name      testScenarioGrid0311
     * @tc.desc      Verify 16 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0311 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n16-c1', '13800001', 'dept-11', true);
      store.add('s11n16-c2', '13800002', 'dept-11', false);
      store.add('s11n16-c3', '13800003', 'dept-11', false);
      store.add('s11n16-c4', '13800004', 'dept-11', false);
      store.add('s11n16-c5', '13800005', 'dept-11', true);
      store.add('s11n16-c6', '13800006', 'dept-11', false);
      store.add('s11n16-c7', '13800007', 'dept-11', false);
      store.add('s11n16-c8', '13800008', 'dept-11', false);
      store.add('s11n16-c9', '13800009', 'dept-11', true);
      store.add('s11n16-c10', '138000010', 'dept-11', false);
      store.add('s11n16-c11', '138000011', 'dept-11', false);
      store.add('s11n16-c12', '138000012', 'dept-11', false);
      store.add('s11n16-c13', '138000013', 'dept-11', true);
      store.add('s11n16-c14', '138000014', 'dept-11', false);
      store.add('s11n16-c15', '138000015', 'dept-11', false);
      store.add('s11n16-c16', '138000016', 'dept-11', false);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(15);
      expect(store.search('dept-11').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0311 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_31200
     * @tc.name      testScenarioGrid0312
     * @tc.desc      Verify 16 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0312 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n16-c1', '13800001', 'dept-12', false);
      store.add('s12n16-c2', '13800002', 'dept-12', false);
      store.add('s12n16-c3', '13800003', 'dept-12', false);
      store.add('s12n16-c4', '13800004', 'dept-12', true);
      store.add('s12n16-c5', '13800005', 'dept-12', false);
      store.add('s12n16-c6', '13800006', 'dept-12', false);
      store.add('s12n16-c7', '13800007', 'dept-12', false);
      store.add('s12n16-c8', '13800008', 'dept-12', true);
      store.add('s12n16-c9', '13800009', 'dept-12', false);
      store.add('s12n16-c10', '138000010', 'dept-12', false);
      store.add('s12n16-c11', '138000011', 'dept-12', false);
      store.add('s12n16-c12', '138000012', 'dept-12', true);
      store.add('s12n16-c13', '138000013', 'dept-12', false);
      store.add('s12n16-c14', '138000014', 'dept-12', false);
      store.add('s12n16-c15', '138000015', 'dept-12', false);
      store.add('s12n16-c16', '138000016', 'dept-12', true);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(15);
      expect(store.search('dept-12').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0312 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_31300
     * @tc.name      testScenarioGrid0313
     * @tc.desc      Verify 16 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0313 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n16-c1', '13800001', 'dept-13', false);
      store.add('s13n16-c2', '13800002', 'dept-13', false);
      store.add('s13n16-c3', '13800003', 'dept-13', true);
      store.add('s13n16-c4', '13800004', 'dept-13', false);
      store.add('s13n16-c5', '13800005', 'dept-13', false);
      store.add('s13n16-c6', '13800006', 'dept-13', false);
      store.add('s13n16-c7', '13800007', 'dept-13', true);
      store.add('s13n16-c8', '13800008', 'dept-13', false);
      store.add('s13n16-c9', '13800009', 'dept-13', false);
      store.add('s13n16-c10', '138000010', 'dept-13', false);
      store.add('s13n16-c11', '138000011', 'dept-13', true);
      store.add('s13n16-c12', '138000012', 'dept-13', false);
      store.add('s13n16-c13', '138000013', 'dept-13', false);
      store.add('s13n16-c14', '138000014', 'dept-13', false);
      store.add('s13n16-c15', '138000015', 'dept-13', true);
      store.add('s13n16-c16', '138000016', 'dept-13', false);
      expect(store.remove(14)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(14) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(15);
      expect(store.search('dept-13').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0313 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_31400
     * @tc.name      testScenarioGrid0314
     * @tc.desc      Verify 16 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0314 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n16-c1', '13800001', 'dept-14', false);
      store.add('s14n16-c2', '13800002', 'dept-14', true);
      store.add('s14n16-c3', '13800003', 'dept-14', false);
      store.add('s14n16-c4', '13800004', 'dept-14', false);
      store.add('s14n16-c5', '13800005', 'dept-14', false);
      store.add('s14n16-c6', '13800006', 'dept-14', true);
      store.add('s14n16-c7', '13800007', 'dept-14', false);
      store.add('s14n16-c8', '13800008', 'dept-14', false);
      store.add('s14n16-c9', '13800009', 'dept-14', false);
      store.add('s14n16-c10', '138000010', 'dept-14', true);
      store.add('s14n16-c11', '138000011', 'dept-14', false);
      store.add('s14n16-c12', '138000012', 'dept-14', false);
      store.add('s14n16-c13', '138000013', 'dept-14', false);
      store.add('s14n16-c14', '138000014', 'dept-14', true);
      store.add('s14n16-c15', '138000015', 'dept-14', false);
      store.add('s14n16-c16', '138000016', 'dept-14', false);
      expect(store.remove(15)).assertEqual(true);
      expect(store.toggleOnline(11)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(15) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(15);
      expect(store.search('dept-14').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0314 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_31500
     * @tc.name      testScenarioGrid0315
     * @tc.desc      Verify 16 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0315 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n16-c1', '13800001', 'dept-15', true);
      store.add('s15n16-c2', '13800002', 'dept-15', false);
      store.add('s15n16-c3', '13800003', 'dept-15', false);
      store.add('s15n16-c4', '13800004', 'dept-15', false);
      store.add('s15n16-c5', '13800005', 'dept-15', true);
      store.add('s15n16-c6', '13800006', 'dept-15', false);
      store.add('s15n16-c7', '13800007', 'dept-15', false);
      store.add('s15n16-c8', '13800008', 'dept-15', false);
      store.add('s15n16-c9', '13800009', 'dept-15', true);
      store.add('s15n16-c10', '138000010', 'dept-15', false);
      store.add('s15n16-c11', '138000011', 'dept-15', false);
      store.add('s15n16-c12', '138000012', 'dept-15', false);
      store.add('s15n16-c13', '138000013', 'dept-15', true);
      store.add('s15n16-c14', '138000014', 'dept-15', false);
      store.add('s15n16-c15', '138000015', 'dept-15', false);
      store.add('s15n16-c16', '138000016', 'dept-15', false);
      expect(store.remove(16)).assertEqual(true);
      expect(store.toggleOnline(14)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(16) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(15);
      expect(store.search('dept-15').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0315 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_31600
     * @tc.name      testScenarioGrid0316
     * @tc.desc      Verify 16 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0316 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n16-c1', '13800001', 'dept-16', false);
      store.add('s16n16-c2', '13800002', 'dept-16', false);
      store.add('s16n16-c3', '13800003', 'dept-16', false);
      store.add('s16n16-c4', '13800004', 'dept-16', true);
      store.add('s16n16-c5', '13800005', 'dept-16', false);
      store.add('s16n16-c6', '13800006', 'dept-16', false);
      store.add('s16n16-c7', '13800007', 'dept-16', false);
      store.add('s16n16-c8', '13800008', 'dept-16', true);
      store.add('s16n16-c9', '13800009', 'dept-16', false);
      store.add('s16n16-c10', '138000010', 'dept-16', false);
      store.add('s16n16-c11', '138000011', 'dept-16', false);
      store.add('s16n16-c12', '138000012', 'dept-16', true);
      store.add('s16n16-c13', '138000013', 'dept-16', false);
      store.add('s16n16-c14', '138000014', 'dept-16', false);
      store.add('s16n16-c15', '138000015', 'dept-16', false);
      store.add('s16n16-c16', '138000016', 'dept-16', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(15);
      expect(store.search('dept-16').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0316 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_31700
     * @tc.name      testScenarioGrid0317
     * @tc.desc      Verify 16 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0317 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n16-c1', '13800001', 'dept-17', false);
      store.add('s17n16-c2', '13800002', 'dept-17', false);
      store.add('s17n16-c3', '13800003', 'dept-17', true);
      store.add('s17n16-c4', '13800004', 'dept-17', false);
      store.add('s17n16-c5', '13800005', 'dept-17', false);
      store.add('s17n16-c6', '13800006', 'dept-17', false);
      store.add('s17n16-c7', '13800007', 'dept-17', true);
      store.add('s17n16-c8', '13800008', 'dept-17', false);
      store.add('s17n16-c9', '13800009', 'dept-17', false);
      store.add('s17n16-c10', '138000010', 'dept-17', false);
      store.add('s17n16-c11', '138000011', 'dept-17', true);
      store.add('s17n16-c12', '138000012', 'dept-17', false);
      store.add('s17n16-c13', '138000013', 'dept-17', false);
      store.add('s17n16-c14', '138000014', 'dept-17', false);
      store.add('s17n16-c15', '138000015', 'dept-17', true);
      store.add('s17n16-c16', '138000016', 'dept-17', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(15);
      expect(store.search('dept-17').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0317 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_31800
     * @tc.name      testScenarioGrid0318
     * @tc.desc      Verify 16 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0318 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n16-c1', '13800001', 'dept-18', false);
      store.add('s18n16-c2', '13800002', 'dept-18', true);
      store.add('s18n16-c3', '13800003', 'dept-18', false);
      store.add('s18n16-c4', '13800004', 'dept-18', false);
      store.add('s18n16-c5', '13800005', 'dept-18', false);
      store.add('s18n16-c6', '13800006', 'dept-18', true);
      store.add('s18n16-c7', '13800007', 'dept-18', false);
      store.add('s18n16-c8', '13800008', 'dept-18', false);
      store.add('s18n16-c9', '13800009', 'dept-18', false);
      store.add('s18n16-c10', '138000010', 'dept-18', true);
      store.add('s18n16-c11', '138000011', 'dept-18', false);
      store.add('s18n16-c12', '138000012', 'dept-18', false);
      store.add('s18n16-c13', '138000013', 'dept-18', false);
      store.add('s18n16-c14', '138000014', 'dept-18', true);
      store.add('s18n16-c15', '138000015', 'dept-18', false);
      store.add('s18n16-c16', '138000016', 'dept-18', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(15);
      expect(store.search('dept-18').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0318 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_31900
     * @tc.name      testScenarioGrid0319
     * @tc.desc      Verify 16 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0319 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n16-c1', '13800001', 'dept-19', true);
      store.add('s19n16-c2', '13800002', 'dept-19', false);
      store.add('s19n16-c3', '13800003', 'dept-19', false);
      store.add('s19n16-c4', '13800004', 'dept-19', false);
      store.add('s19n16-c5', '13800005', 'dept-19', true);
      store.add('s19n16-c6', '13800006', 'dept-19', false);
      store.add('s19n16-c7', '13800007', 'dept-19', false);
      store.add('s19n16-c8', '13800008', 'dept-19', false);
      store.add('s19n16-c9', '13800009', 'dept-19', true);
      store.add('s19n16-c10', '138000010', 'dept-19', false);
      store.add('s19n16-c11', '138000011', 'dept-19', false);
      store.add('s19n16-c12', '138000012', 'dept-19', false);
      store.add('s19n16-c13', '138000013', 'dept-19', true);
      store.add('s19n16-c14', '138000014', 'dept-19', false);
      store.add('s19n16-c15', '138000015', 'dept-19', false);
      store.add('s19n16-c16', '138000016', 'dept-19', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(15);
      expect(store.search('dept-19').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0319 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP8_32000
     * @tc.name      testScenarioGrid0320
     * @tc.desc      Verify 16 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0320 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n16-c1', '13800001', 'dept-20', false);
      store.add('s20n16-c2', '13800002', 'dept-20', false);
      store.add('s20n16-c3', '13800003', 'dept-20', false);
      store.add('s20n16-c4', '13800004', 'dept-20', true);
      store.add('s20n16-c5', '13800005', 'dept-20', false);
      store.add('s20n16-c6', '13800006', 'dept-20', false);
      store.add('s20n16-c7', '13800007', 'dept-20', false);
      store.add('s20n16-c8', '13800008', 'dept-20', true);
      store.add('s20n16-c9', '13800009', 'dept-20', false);
      store.add('s20n16-c10', '138000010', 'dept-20', false);
      store.add('s20n16-c11', '138000011', 'dept-20', false);
      store.add('s20n16-c12', '138000012', 'dept-20', true);
      store.add('s20n16-c13', '138000013', 'dept-20', false);
      store.add('s20n16-c14', '138000014', 'dept-20', false);
      store.add('s20n16-c15', '138000015', 'dept-20', false);
      store.add('s20n16-c16', '138000016', 'dept-20', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(15);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(15);
      expect(store.search('dept-20').length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0320 end');
    })

  })
}
