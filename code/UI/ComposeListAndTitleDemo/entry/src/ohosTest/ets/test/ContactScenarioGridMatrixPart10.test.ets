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

export default function ContactScenarioGridMatrixPart10Test(): void {
  describe('ContactScenarioGridMatrixPart10', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_36100
     * @tc.name      testScenarioGrid0361
     * @tc.desc      Verify 19 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0361 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n19-c1', '13800001', 'dept-1', false);
      store.add('s1n19-c2', '13800002', 'dept-1', false);
      store.add('s1n19-c3', '13800003', 'dept-1', true);
      store.add('s1n19-c4', '13800004', 'dept-1', false);
      store.add('s1n19-c5', '13800005', 'dept-1', false);
      store.add('s1n19-c6', '13800006', 'dept-1', false);
      store.add('s1n19-c7', '13800007', 'dept-1', true);
      store.add('s1n19-c8', '13800008', 'dept-1', false);
      store.add('s1n19-c9', '13800009', 'dept-1', false);
      store.add('s1n19-c10', '138000010', 'dept-1', false);
      store.add('s1n19-c11', '138000011', 'dept-1', true);
      store.add('s1n19-c12', '138000012', 'dept-1', false);
      store.add('s1n19-c13', '138000013', 'dept-1', false);
      store.add('s1n19-c14', '138000014', 'dept-1', false);
      store.add('s1n19-c15', '138000015', 'dept-1', true);
      store.add('s1n19-c16', '138000016', 'dept-1', false);
      store.add('s1n19-c17', '138000017', 'dept-1', false);
      store.add('s1n19-c18', '138000018', 'dept-1', false);
      store.add('s1n19-c19', '138000019', 'dept-1', true);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(18);
      expect(store.search('dept-1').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0361 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_36200
     * @tc.name      testScenarioGrid0362
     * @tc.desc      Verify 19 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0362 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n19-c1', '13800001', 'dept-2', false);
      store.add('s2n19-c2', '13800002', 'dept-2', true);
      store.add('s2n19-c3', '13800003', 'dept-2', false);
      store.add('s2n19-c4', '13800004', 'dept-2', false);
      store.add('s2n19-c5', '13800005', 'dept-2', false);
      store.add('s2n19-c6', '13800006', 'dept-2', true);
      store.add('s2n19-c7', '13800007', 'dept-2', false);
      store.add('s2n19-c8', '13800008', 'dept-2', false);
      store.add('s2n19-c9', '13800009', 'dept-2', false);
      store.add('s2n19-c10', '138000010', 'dept-2', true);
      store.add('s2n19-c11', '138000011', 'dept-2', false);
      store.add('s2n19-c12', '138000012', 'dept-2', false);
      store.add('s2n19-c13', '138000013', 'dept-2', false);
      store.add('s2n19-c14', '138000014', 'dept-2', true);
      store.add('s2n19-c15', '138000015', 'dept-2', false);
      store.add('s2n19-c16', '138000016', 'dept-2', false);
      store.add('s2n19-c17', '138000017', 'dept-2', false);
      store.add('s2n19-c18', '138000018', 'dept-2', true);
      store.add('s2n19-c19', '138000019', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(18);
      expect(store.search('dept-2').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0362 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_36300
     * @tc.name      testScenarioGrid0363
     * @tc.desc      Verify 19 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0363 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n19-c1', '13800001', 'dept-3', true);
      store.add('s3n19-c2', '13800002', 'dept-3', false);
      store.add('s3n19-c3', '13800003', 'dept-3', false);
      store.add('s3n19-c4', '13800004', 'dept-3', false);
      store.add('s3n19-c5', '13800005', 'dept-3', true);
      store.add('s3n19-c6', '13800006', 'dept-3', false);
      store.add('s3n19-c7', '13800007', 'dept-3', false);
      store.add('s3n19-c8', '13800008', 'dept-3', false);
      store.add('s3n19-c9', '13800009', 'dept-3', true);
      store.add('s3n19-c10', '138000010', 'dept-3', false);
      store.add('s3n19-c11', '138000011', 'dept-3', false);
      store.add('s3n19-c12', '138000012', 'dept-3', false);
      store.add('s3n19-c13', '138000013', 'dept-3', true);
      store.add('s3n19-c14', '138000014', 'dept-3', false);
      store.add('s3n19-c15', '138000015', 'dept-3', false);
      store.add('s3n19-c16', '138000016', 'dept-3', false);
      store.add('s3n19-c17', '138000017', 'dept-3', true);
      store.add('s3n19-c18', '138000018', 'dept-3', false);
      store.add('s3n19-c19', '138000019', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(18);
      expect(store.search('dept-3').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0363 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_36400
     * @tc.name      testScenarioGrid0364
     * @tc.desc      Verify 19 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0364 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n19-c1', '13800001', 'dept-4', false);
      store.add('s4n19-c2', '13800002', 'dept-4', false);
      store.add('s4n19-c3', '13800003', 'dept-4', false);
      store.add('s4n19-c4', '13800004', 'dept-4', true);
      store.add('s4n19-c5', '13800005', 'dept-4', false);
      store.add('s4n19-c6', '13800006', 'dept-4', false);
      store.add('s4n19-c7', '13800007', 'dept-4', false);
      store.add('s4n19-c8', '13800008', 'dept-4', true);
      store.add('s4n19-c9', '13800009', 'dept-4', false);
      store.add('s4n19-c10', '138000010', 'dept-4', false);
      store.add('s4n19-c11', '138000011', 'dept-4', false);
      store.add('s4n19-c12', '138000012', 'dept-4', true);
      store.add('s4n19-c13', '138000013', 'dept-4', false);
      store.add('s4n19-c14', '138000014', 'dept-4', false);
      store.add('s4n19-c15', '138000015', 'dept-4', false);
      store.add('s4n19-c16', '138000016', 'dept-4', true);
      store.add('s4n19-c17', '138000017', 'dept-4', false);
      store.add('s4n19-c18', '138000018', 'dept-4', false);
      store.add('s4n19-c19', '138000019', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(18);
      expect(store.search('dept-4').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0364 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_36500
     * @tc.name      testScenarioGrid0365
     * @tc.desc      Verify 19 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0365 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n19-c1', '13800001', 'dept-5', false);
      store.add('s5n19-c2', '13800002', 'dept-5', false);
      store.add('s5n19-c3', '13800003', 'dept-5', true);
      store.add('s5n19-c4', '13800004', 'dept-5', false);
      store.add('s5n19-c5', '13800005', 'dept-5', false);
      store.add('s5n19-c6', '13800006', 'dept-5', false);
      store.add('s5n19-c7', '13800007', 'dept-5', true);
      store.add('s5n19-c8', '13800008', 'dept-5', false);
      store.add('s5n19-c9', '13800009', 'dept-5', false);
      store.add('s5n19-c10', '138000010', 'dept-5', false);
      store.add('s5n19-c11', '138000011', 'dept-5', true);
      store.add('s5n19-c12', '138000012', 'dept-5', false);
      store.add('s5n19-c13', '138000013', 'dept-5', false);
      store.add('s5n19-c14', '138000014', 'dept-5', false);
      store.add('s5n19-c15', '138000015', 'dept-5', true);
      store.add('s5n19-c16', '138000016', 'dept-5', false);
      store.add('s5n19-c17', '138000017', 'dept-5', false);
      store.add('s5n19-c18', '138000018', 'dept-5', false);
      store.add('s5n19-c19', '138000019', 'dept-5', true);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(18);
      expect(store.search('dept-5').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0365 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_36600
     * @tc.name      testScenarioGrid0366
     * @tc.desc      Verify 19 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0366 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n19-c1', '13800001', 'dept-6', false);
      store.add('s6n19-c2', '13800002', 'dept-6', true);
      store.add('s6n19-c3', '13800003', 'dept-6', false);
      store.add('s6n19-c4', '13800004', 'dept-6', false);
      store.add('s6n19-c5', '13800005', 'dept-6', false);
      store.add('s6n19-c6', '13800006', 'dept-6', true);
      store.add('s6n19-c7', '13800007', 'dept-6', false);
      store.add('s6n19-c8', '13800008', 'dept-6', false);
      store.add('s6n19-c9', '13800009', 'dept-6', false);
      store.add('s6n19-c10', '138000010', 'dept-6', true);
      store.add('s6n19-c11', '138000011', 'dept-6', false);
      store.add('s6n19-c12', '138000012', 'dept-6', false);
      store.add('s6n19-c13', '138000013', 'dept-6', false);
      store.add('s6n19-c14', '138000014', 'dept-6', true);
      store.add('s6n19-c15', '138000015', 'dept-6', false);
      store.add('s6n19-c16', '138000016', 'dept-6', false);
      store.add('s6n19-c17', '138000017', 'dept-6', false);
      store.add('s6n19-c18', '138000018', 'dept-6', true);
      store.add('s6n19-c19', '138000019', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(19)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(18);
      expect(store.search('dept-6').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0366 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_36700
     * @tc.name      testScenarioGrid0367
     * @tc.desc      Verify 19 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0367 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n19-c1', '13800001', 'dept-7', true);
      store.add('s7n19-c2', '13800002', 'dept-7', false);
      store.add('s7n19-c3', '13800003', 'dept-7', false);
      store.add('s7n19-c4', '13800004', 'dept-7', false);
      store.add('s7n19-c5', '13800005', 'dept-7', true);
      store.add('s7n19-c6', '13800006', 'dept-7', false);
      store.add('s7n19-c7', '13800007', 'dept-7', false);
      store.add('s7n19-c8', '13800008', 'dept-7', false);
      store.add('s7n19-c9', '13800009', 'dept-7', true);
      store.add('s7n19-c10', '138000010', 'dept-7', false);
      store.add('s7n19-c11', '138000011', 'dept-7', false);
      store.add('s7n19-c12', '138000012', 'dept-7', false);
      store.add('s7n19-c13', '138000013', 'dept-7', true);
      store.add('s7n19-c14', '138000014', 'dept-7', false);
      store.add('s7n19-c15', '138000015', 'dept-7', false);
      store.add('s7n19-c16', '138000016', 'dept-7', false);
      store.add('s7n19-c17', '138000017', 'dept-7', true);
      store.add('s7n19-c18', '138000018', 'dept-7', false);
      store.add('s7n19-c19', '138000019', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(18);
      expect(store.search('dept-7').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0367 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_36800
     * @tc.name      testScenarioGrid0368
     * @tc.desc      Verify 19 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0368 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n19-c1', '13800001', 'dept-8', false);
      store.add('s8n19-c2', '13800002', 'dept-8', false);
      store.add('s8n19-c3', '13800003', 'dept-8', false);
      store.add('s8n19-c4', '13800004', 'dept-8', true);
      store.add('s8n19-c5', '13800005', 'dept-8', false);
      store.add('s8n19-c6', '13800006', 'dept-8', false);
      store.add('s8n19-c7', '13800007', 'dept-8', false);
      store.add('s8n19-c8', '13800008', 'dept-8', true);
      store.add('s8n19-c9', '13800009', 'dept-8', false);
      store.add('s8n19-c10', '138000010', 'dept-8', false);
      store.add('s8n19-c11', '138000011', 'dept-8', false);
      store.add('s8n19-c12', '138000012', 'dept-8', true);
      store.add('s8n19-c13', '138000013', 'dept-8', false);
      store.add('s8n19-c14', '138000014', 'dept-8', false);
      store.add('s8n19-c15', '138000015', 'dept-8', false);
      store.add('s8n19-c16', '138000016', 'dept-8', true);
      store.add('s8n19-c17', '138000017', 'dept-8', false);
      store.add('s8n19-c18', '138000018', 'dept-8', false);
      store.add('s8n19-c19', '138000019', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(18);
      expect(store.search('dept-8').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0368 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_36900
     * @tc.name      testScenarioGrid0369
     * @tc.desc      Verify 19 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0369 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n19-c1', '13800001', 'dept-9', false);
      store.add('s9n19-c2', '13800002', 'dept-9', false);
      store.add('s9n19-c3', '13800003', 'dept-9', true);
      store.add('s9n19-c4', '13800004', 'dept-9', false);
      store.add('s9n19-c5', '13800005', 'dept-9', false);
      store.add('s9n19-c6', '13800006', 'dept-9', false);
      store.add('s9n19-c7', '13800007', 'dept-9', true);
      store.add('s9n19-c8', '13800008', 'dept-9', false);
      store.add('s9n19-c9', '13800009', 'dept-9', false);
      store.add('s9n19-c10', '138000010', 'dept-9', false);
      store.add('s9n19-c11', '138000011', 'dept-9', true);
      store.add('s9n19-c12', '138000012', 'dept-9', false);
      store.add('s9n19-c13', '138000013', 'dept-9', false);
      store.add('s9n19-c14', '138000014', 'dept-9', false);
      store.add('s9n19-c15', '138000015', 'dept-9', true);
      store.add('s9n19-c16', '138000016', 'dept-9', false);
      store.add('s9n19-c17', '138000017', 'dept-9', false);
      store.add('s9n19-c18', '138000018', 'dept-9', false);
      store.add('s9n19-c19', '138000019', 'dept-9', true);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(18);
      expect(store.search('dept-9').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0369 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_37000
     * @tc.name      testScenarioGrid0370
     * @tc.desc      Verify 19 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0370 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n19-c1', '13800001', 'dept-10', false);
      store.add('s10n19-c2', '13800002', 'dept-10', true);
      store.add('s10n19-c3', '13800003', 'dept-10', false);
      store.add('s10n19-c4', '13800004', 'dept-10', false);
      store.add('s10n19-c5', '13800005', 'dept-10', false);
      store.add('s10n19-c6', '13800006', 'dept-10', true);
      store.add('s10n19-c7', '13800007', 'dept-10', false);
      store.add('s10n19-c8', '13800008', 'dept-10', false);
      store.add('s10n19-c9', '13800009', 'dept-10', false);
      store.add('s10n19-c10', '138000010', 'dept-10', true);
      store.add('s10n19-c11', '138000011', 'dept-10', false);
      store.add('s10n19-c12', '138000012', 'dept-10', false);
      store.add('s10n19-c13', '138000013', 'dept-10', false);
      store.add('s10n19-c14', '138000014', 'dept-10', true);
      store.add('s10n19-c15', '138000015', 'dept-10', false);
      store.add('s10n19-c16', '138000016', 'dept-10', false);
      store.add('s10n19-c17', '138000017', 'dept-10', false);
      store.add('s10n19-c18', '138000018', 'dept-10', true);
      store.add('s10n19-c19', '138000019', 'dept-10', false);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(12)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(18);
      expect(store.search('dept-10').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0370 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_37100
     * @tc.name      testScenarioGrid0371
     * @tc.desc      Verify 19 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0371 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n19-c1', '13800001', 'dept-11', true);
      store.add('s11n19-c2', '13800002', 'dept-11', false);
      store.add('s11n19-c3', '13800003', 'dept-11', false);
      store.add('s11n19-c4', '13800004', 'dept-11', false);
      store.add('s11n19-c5', '13800005', 'dept-11', true);
      store.add('s11n19-c6', '13800006', 'dept-11', false);
      store.add('s11n19-c7', '13800007', 'dept-11', false);
      store.add('s11n19-c8', '13800008', 'dept-11', false);
      store.add('s11n19-c9', '13800009', 'dept-11', true);
      store.add('s11n19-c10', '138000010', 'dept-11', false);
      store.add('s11n19-c11', '138000011', 'dept-11', false);
      store.add('s11n19-c12', '138000012', 'dept-11', false);
      store.add('s11n19-c13', '138000013', 'dept-11', true);
      store.add('s11n19-c14', '138000014', 'dept-11', false);
      store.add('s11n19-c15', '138000015', 'dept-11', false);
      store.add('s11n19-c16', '138000016', 'dept-11', false);
      store.add('s11n19-c17', '138000017', 'dept-11', true);
      store.add('s11n19-c18', '138000018', 'dept-11', false);
      store.add('s11n19-c19', '138000019', 'dept-11', false);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(15)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(18);
      expect(store.search('dept-11').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0371 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_37200
     * @tc.name      testScenarioGrid0372
     * @tc.desc      Verify 19 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0372 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n19-c1', '13800001', 'dept-12', false);
      store.add('s12n19-c2', '13800002', 'dept-12', false);
      store.add('s12n19-c3', '13800003', 'dept-12', false);
      store.add('s12n19-c4', '13800004', 'dept-12', true);
      store.add('s12n19-c5', '13800005', 'dept-12', false);
      store.add('s12n19-c6', '13800006', 'dept-12', false);
      store.add('s12n19-c7', '13800007', 'dept-12', false);
      store.add('s12n19-c8', '13800008', 'dept-12', true);
      store.add('s12n19-c9', '13800009', 'dept-12', false);
      store.add('s12n19-c10', '138000010', 'dept-12', false);
      store.add('s12n19-c11', '138000011', 'dept-12', false);
      store.add('s12n19-c12', '138000012', 'dept-12', true);
      store.add('s12n19-c13', '138000013', 'dept-12', false);
      store.add('s12n19-c14', '138000014', 'dept-12', false);
      store.add('s12n19-c15', '138000015', 'dept-12', false);
      store.add('s12n19-c16', '138000016', 'dept-12', true);
      store.add('s12n19-c17', '138000017', 'dept-12', false);
      store.add('s12n19-c18', '138000018', 'dept-12', false);
      store.add('s12n19-c19', '138000019', 'dept-12', false);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(18)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(18);
      expect(store.search('dept-12').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0372 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_37300
     * @tc.name      testScenarioGrid0373
     * @tc.desc      Verify 19 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0373 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n19-c1', '13800001', 'dept-13', false);
      store.add('s13n19-c2', '13800002', 'dept-13', false);
      store.add('s13n19-c3', '13800003', 'dept-13', true);
      store.add('s13n19-c4', '13800004', 'dept-13', false);
      store.add('s13n19-c5', '13800005', 'dept-13', false);
      store.add('s13n19-c6', '13800006', 'dept-13', false);
      store.add('s13n19-c7', '13800007', 'dept-13', true);
      store.add('s13n19-c8', '13800008', 'dept-13', false);
      store.add('s13n19-c9', '13800009', 'dept-13', false);
      store.add('s13n19-c10', '138000010', 'dept-13', false);
      store.add('s13n19-c11', '138000011', 'dept-13', true);
      store.add('s13n19-c12', '138000012', 'dept-13', false);
      store.add('s13n19-c13', '138000013', 'dept-13', false);
      store.add('s13n19-c14', '138000014', 'dept-13', false);
      store.add('s13n19-c15', '138000015', 'dept-13', true);
      store.add('s13n19-c16', '138000016', 'dept-13', false);
      store.add('s13n19-c17', '138000017', 'dept-13', false);
      store.add('s13n19-c18', '138000018', 'dept-13', false);
      store.add('s13n19-c19', '138000019', 'dept-13', true);
      expect(store.remove(14)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(14) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(18);
      expect(store.search('dept-13').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0373 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_37400
     * @tc.name      testScenarioGrid0374
     * @tc.desc      Verify 19 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0374 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n19-c1', '13800001', 'dept-14', false);
      store.add('s14n19-c2', '13800002', 'dept-14', true);
      store.add('s14n19-c3', '13800003', 'dept-14', false);
      store.add('s14n19-c4', '13800004', 'dept-14', false);
      store.add('s14n19-c5', '13800005', 'dept-14', false);
      store.add('s14n19-c6', '13800006', 'dept-14', true);
      store.add('s14n19-c7', '13800007', 'dept-14', false);
      store.add('s14n19-c8', '13800008', 'dept-14', false);
      store.add('s14n19-c9', '13800009', 'dept-14', false);
      store.add('s14n19-c10', '138000010', 'dept-14', true);
      store.add('s14n19-c11', '138000011', 'dept-14', false);
      store.add('s14n19-c12', '138000012', 'dept-14', false);
      store.add('s14n19-c13', '138000013', 'dept-14', false);
      store.add('s14n19-c14', '138000014', 'dept-14', true);
      store.add('s14n19-c15', '138000015', 'dept-14', false);
      store.add('s14n19-c16', '138000016', 'dept-14', false);
      store.add('s14n19-c17', '138000017', 'dept-14', false);
      store.add('s14n19-c18', '138000018', 'dept-14', true);
      store.add('s14n19-c19', '138000019', 'dept-14', false);
      expect(store.remove(15)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(15) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(18);
      expect(store.search('dept-14').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0374 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_37500
     * @tc.name      testScenarioGrid0375
     * @tc.desc      Verify 19 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0375 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n19-c1', '13800001', 'dept-15', true);
      store.add('s15n19-c2', '13800002', 'dept-15', false);
      store.add('s15n19-c3', '13800003', 'dept-15', false);
      store.add('s15n19-c4', '13800004', 'dept-15', false);
      store.add('s15n19-c5', '13800005', 'dept-15', true);
      store.add('s15n19-c6', '13800006', 'dept-15', false);
      store.add('s15n19-c7', '13800007', 'dept-15', false);
      store.add('s15n19-c8', '13800008', 'dept-15', false);
      store.add('s15n19-c9', '13800009', 'dept-15', true);
      store.add('s15n19-c10', '138000010', 'dept-15', false);
      store.add('s15n19-c11', '138000011', 'dept-15', false);
      store.add('s15n19-c12', '138000012', 'dept-15', false);
      store.add('s15n19-c13', '138000013', 'dept-15', true);
      store.add('s15n19-c14', '138000014', 'dept-15', false);
      store.add('s15n19-c15', '138000015', 'dept-15', false);
      store.add('s15n19-c16', '138000016', 'dept-15', false);
      store.add('s15n19-c17', '138000017', 'dept-15', true);
      store.add('s15n19-c18', '138000018', 'dept-15', false);
      store.add('s15n19-c19', '138000019', 'dept-15', false);
      expect(store.remove(16)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(16) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(18);
      expect(store.search('dept-15').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0375 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_37600
     * @tc.name      testScenarioGrid0376
     * @tc.desc      Verify 19 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0376 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n19-c1', '13800001', 'dept-16', false);
      store.add('s16n19-c2', '13800002', 'dept-16', false);
      store.add('s16n19-c3', '13800003', 'dept-16', false);
      store.add('s16n19-c4', '13800004', 'dept-16', true);
      store.add('s16n19-c5', '13800005', 'dept-16', false);
      store.add('s16n19-c6', '13800006', 'dept-16', false);
      store.add('s16n19-c7', '13800007', 'dept-16', false);
      store.add('s16n19-c8', '13800008', 'dept-16', true);
      store.add('s16n19-c9', '13800009', 'dept-16', false);
      store.add('s16n19-c10', '138000010', 'dept-16', false);
      store.add('s16n19-c11', '138000011', 'dept-16', false);
      store.add('s16n19-c12', '138000012', 'dept-16', true);
      store.add('s16n19-c13', '138000013', 'dept-16', false);
      store.add('s16n19-c14', '138000014', 'dept-16', false);
      store.add('s16n19-c15', '138000015', 'dept-16', false);
      store.add('s16n19-c16', '138000016', 'dept-16', true);
      store.add('s16n19-c17', '138000017', 'dept-16', false);
      store.add('s16n19-c18', '138000018', 'dept-16', false);
      store.add('s16n19-c19', '138000019', 'dept-16', false);
      expect(store.remove(17)).assertEqual(true);
      expect(store.toggleOnline(11)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(17) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(18);
      expect(store.search('dept-16').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0376 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_37700
     * @tc.name      testScenarioGrid0377
     * @tc.desc      Verify 19 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0377 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n19-c1', '13800001', 'dept-17', false);
      store.add('s17n19-c2', '13800002', 'dept-17', false);
      store.add('s17n19-c3', '13800003', 'dept-17', true);
      store.add('s17n19-c4', '13800004', 'dept-17', false);
      store.add('s17n19-c5', '13800005', 'dept-17', false);
      store.add('s17n19-c6', '13800006', 'dept-17', false);
      store.add('s17n19-c7', '13800007', 'dept-17', true);
      store.add('s17n19-c8', '13800008', 'dept-17', false);
      store.add('s17n19-c9', '13800009', 'dept-17', false);
      store.add('s17n19-c10', '138000010', 'dept-17', false);
      store.add('s17n19-c11', '138000011', 'dept-17', true);
      store.add('s17n19-c12', '138000012', 'dept-17', false);
      store.add('s17n19-c13', '138000013', 'dept-17', false);
      store.add('s17n19-c14', '138000014', 'dept-17', false);
      store.add('s17n19-c15', '138000015', 'dept-17', true);
      store.add('s17n19-c16', '138000016', 'dept-17', false);
      store.add('s17n19-c17', '138000017', 'dept-17', false);
      store.add('s17n19-c18', '138000018', 'dept-17', false);
      store.add('s17n19-c19', '138000019', 'dept-17', true);
      expect(store.remove(18)).assertEqual(true);
      expect(store.toggleOnline(14)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(18) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(18);
      expect(store.search('dept-17').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0377 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_37800
     * @tc.name      testScenarioGrid0378
     * @tc.desc      Verify 19 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0378 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n19-c1', '13800001', 'dept-18', false);
      store.add('s18n19-c2', '13800002', 'dept-18', true);
      store.add('s18n19-c3', '13800003', 'dept-18', false);
      store.add('s18n19-c4', '13800004', 'dept-18', false);
      store.add('s18n19-c5', '13800005', 'dept-18', false);
      store.add('s18n19-c6', '13800006', 'dept-18', true);
      store.add('s18n19-c7', '13800007', 'dept-18', false);
      store.add('s18n19-c8', '13800008', 'dept-18', false);
      store.add('s18n19-c9', '13800009', 'dept-18', false);
      store.add('s18n19-c10', '138000010', 'dept-18', true);
      store.add('s18n19-c11', '138000011', 'dept-18', false);
      store.add('s18n19-c12', '138000012', 'dept-18', false);
      store.add('s18n19-c13', '138000013', 'dept-18', false);
      store.add('s18n19-c14', '138000014', 'dept-18', true);
      store.add('s18n19-c15', '138000015', 'dept-18', false);
      store.add('s18n19-c16', '138000016', 'dept-18', false);
      store.add('s18n19-c17', '138000017', 'dept-18', false);
      store.add('s18n19-c18', '138000018', 'dept-18', true);
      store.add('s18n19-c19', '138000019', 'dept-18', false);
      expect(store.remove(19)).assertEqual(true);
      expect(store.toggleOnline(17)).assertEqual(true);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(19) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(18);
      expect(store.search('dept-18').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0378 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_37900
     * @tc.name      testScenarioGrid0379
     * @tc.desc      Verify 19 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0379 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n19-c1', '13800001', 'dept-19', true);
      store.add('s19n19-c2', '13800002', 'dept-19', false);
      store.add('s19n19-c3', '13800003', 'dept-19', false);
      store.add('s19n19-c4', '13800004', 'dept-19', false);
      store.add('s19n19-c5', '13800005', 'dept-19', true);
      store.add('s19n19-c6', '13800006', 'dept-19', false);
      store.add('s19n19-c7', '13800007', 'dept-19', false);
      store.add('s19n19-c8', '13800008', 'dept-19', false);
      store.add('s19n19-c9', '13800009', 'dept-19', true);
      store.add('s19n19-c10', '138000010', 'dept-19', false);
      store.add('s19n19-c11', '138000011', 'dept-19', false);
      store.add('s19n19-c12', '138000012', 'dept-19', false);
      store.add('s19n19-c13', '138000013', 'dept-19', true);
      store.add('s19n19-c14', '138000014', 'dept-19', false);
      store.add('s19n19-c15', '138000015', 'dept-19', false);
      store.add('s19n19-c16', '138000016', 'dept-19', false);
      store.add('s19n19-c17', '138000017', 'dept-19', true);
      store.add('s19n19-c18', '138000018', 'dept-19', false);
      store.add('s19n19-c19', '138000019', 'dept-19', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(18);
      expect(store.search('dept-19').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0379 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_38000
     * @tc.name      testScenarioGrid0380
     * @tc.desc      Verify 19 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0380 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n19-c1', '13800001', 'dept-20', false);
      store.add('s20n19-c2', '13800002', 'dept-20', false);
      store.add('s20n19-c3', '13800003', 'dept-20', false);
      store.add('s20n19-c4', '13800004', 'dept-20', true);
      store.add('s20n19-c5', '13800005', 'dept-20', false);
      store.add('s20n19-c6', '13800006', 'dept-20', false);
      store.add('s20n19-c7', '13800007', 'dept-20', false);
      store.add('s20n19-c8', '13800008', 'dept-20', true);
      store.add('s20n19-c9', '13800009', 'dept-20', false);
      store.add('s20n19-c10', '138000010', 'dept-20', false);
      store.add('s20n19-c11', '138000011', 'dept-20', false);
      store.add('s20n19-c12', '138000012', 'dept-20', true);
      store.add('s20n19-c13', '138000013', 'dept-20', false);
      store.add('s20n19-c14', '138000014', 'dept-20', false);
      store.add('s20n19-c15', '138000015', 'dept-20', false);
      store.add('s20n19-c16', '138000016', 'dept-20', true);
      store.add('s20n19-c17', '138000017', 'dept-20', false);
      store.add('s20n19-c18', '138000018', 'dept-20', false);
      store.add('s20n19-c19', '138000019', 'dept-20', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(false);
      expect(store.count()).assertEqual(18);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(18);
      expect(store.search('dept-20').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0380 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_38100
     * @tc.name      testScenarioGrid0381
     * @tc.desc      Verify 20 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0381 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n20-c1', '13800001', 'dept-1', false);
      store.add('s1n20-c2', '13800002', 'dept-1', false);
      store.add('s1n20-c3', '13800003', 'dept-1', true);
      store.add('s1n20-c4', '13800004', 'dept-1', false);
      store.add('s1n20-c5', '13800005', 'dept-1', false);
      store.add('s1n20-c6', '13800006', 'dept-1', false);
      store.add('s1n20-c7', '13800007', 'dept-1', true);
      store.add('s1n20-c8', '13800008', 'dept-1', false);
      store.add('s1n20-c9', '13800009', 'dept-1', false);
      store.add('s1n20-c10', '138000010', 'dept-1', false);
      store.add('s1n20-c11', '138000011', 'dept-1', true);
      store.add('s1n20-c12', '138000012', 'dept-1', false);
      store.add('s1n20-c13', '138000013', 'dept-1', false);
      store.add('s1n20-c14', '138000014', 'dept-1', false);
      store.add('s1n20-c15', '138000015', 'dept-1', true);
      store.add('s1n20-c16', '138000016', 'dept-1', false);
      store.add('s1n20-c17', '138000017', 'dept-1', false);
      store.add('s1n20-c18', '138000018', 'dept-1', false);
      store.add('s1n20-c19', '138000019', 'dept-1', true);
      store.add('s1n20-c20', '138000020', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(19);
      expect(store.search('dept-1').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0381 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_38200
     * @tc.name      testScenarioGrid0382
     * @tc.desc      Verify 20 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0382 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n20-c1', '13800001', 'dept-2', false);
      store.add('s2n20-c2', '13800002', 'dept-2', true);
      store.add('s2n20-c3', '13800003', 'dept-2', false);
      store.add('s2n20-c4', '13800004', 'dept-2', false);
      store.add('s2n20-c5', '13800005', 'dept-2', false);
      store.add('s2n20-c6', '13800006', 'dept-2', true);
      store.add('s2n20-c7', '13800007', 'dept-2', false);
      store.add('s2n20-c8', '13800008', 'dept-2', false);
      store.add('s2n20-c9', '13800009', 'dept-2', false);
      store.add('s2n20-c10', '138000010', 'dept-2', true);
      store.add('s2n20-c11', '138000011', 'dept-2', false);
      store.add('s2n20-c12', '138000012', 'dept-2', false);
      store.add('s2n20-c13', '138000013', 'dept-2', false);
      store.add('s2n20-c14', '138000014', 'dept-2', true);
      store.add('s2n20-c15', '138000015', 'dept-2', false);
      store.add('s2n20-c16', '138000016', 'dept-2', false);
      store.add('s2n20-c17', '138000017', 'dept-2', false);
      store.add('s2n20-c18', '138000018', 'dept-2', true);
      store.add('s2n20-c19', '138000019', 'dept-2', false);
      store.add('s2n20-c20', '138000020', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(19);
      expect(store.search('dept-2').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0382 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_38300
     * @tc.name      testScenarioGrid0383
     * @tc.desc      Verify 20 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0383 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n20-c1', '13800001', 'dept-3', true);
      store.add('s3n20-c2', '13800002', 'dept-3', false);
      store.add('s3n20-c3', '13800003', 'dept-3', false);
      store.add('s3n20-c4', '13800004', 'dept-3', false);
      store.add('s3n20-c5', '13800005', 'dept-3', true);
      store.add('s3n20-c6', '13800006', 'dept-3', false);
      store.add('s3n20-c7', '13800007', 'dept-3', false);
      store.add('s3n20-c8', '13800008', 'dept-3', false);
      store.add('s3n20-c9', '13800009', 'dept-3', true);
      store.add('s3n20-c10', '138000010', 'dept-3', false);
      store.add('s3n20-c11', '138000011', 'dept-3', false);
      store.add('s3n20-c12', '138000012', 'dept-3', false);
      store.add('s3n20-c13', '138000013', 'dept-3', true);
      store.add('s3n20-c14', '138000014', 'dept-3', false);
      store.add('s3n20-c15', '138000015', 'dept-3', false);
      store.add('s3n20-c16', '138000016', 'dept-3', false);
      store.add('s3n20-c17', '138000017', 'dept-3', true);
      store.add('s3n20-c18', '138000018', 'dept-3', false);
      store.add('s3n20-c19', '138000019', 'dept-3', false);
      store.add('s3n20-c20', '138000020', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(19);
      expect(store.search('dept-3').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0383 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_38400
     * @tc.name      testScenarioGrid0384
     * @tc.desc      Verify 20 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0384 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n20-c1', '13800001', 'dept-4', false);
      store.add('s4n20-c2', '13800002', 'dept-4', false);
      store.add('s4n20-c3', '13800003', 'dept-4', false);
      store.add('s4n20-c4', '13800004', 'dept-4', true);
      store.add('s4n20-c5', '13800005', 'dept-4', false);
      store.add('s4n20-c6', '13800006', 'dept-4', false);
      store.add('s4n20-c7', '13800007', 'dept-4', false);
      store.add('s4n20-c8', '13800008', 'dept-4', true);
      store.add('s4n20-c9', '13800009', 'dept-4', false);
      store.add('s4n20-c10', '138000010', 'dept-4', false);
      store.add('s4n20-c11', '138000011', 'dept-4', false);
      store.add('s4n20-c12', '138000012', 'dept-4', true);
      store.add('s4n20-c13', '138000013', 'dept-4', false);
      store.add('s4n20-c14', '138000014', 'dept-4', false);
      store.add('s4n20-c15', '138000015', 'dept-4', false);
      store.add('s4n20-c16', '138000016', 'dept-4', true);
      store.add('s4n20-c17', '138000017', 'dept-4', false);
      store.add('s4n20-c18', '138000018', 'dept-4', false);
      store.add('s4n20-c19', '138000019', 'dept-4', false);
      store.add('s4n20-c20', '138000020', 'dept-4', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(19);
      expect(store.search('dept-4').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0384 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_38500
     * @tc.name      testScenarioGrid0385
     * @tc.desc      Verify 20 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0385 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n20-c1', '13800001', 'dept-5', false);
      store.add('s5n20-c2', '13800002', 'dept-5', false);
      store.add('s5n20-c3', '13800003', 'dept-5', true);
      store.add('s5n20-c4', '13800004', 'dept-5', false);
      store.add('s5n20-c5', '13800005', 'dept-5', false);
      store.add('s5n20-c6', '13800006', 'dept-5', false);
      store.add('s5n20-c7', '13800007', 'dept-5', true);
      store.add('s5n20-c8', '13800008', 'dept-5', false);
      store.add('s5n20-c9', '13800009', 'dept-5', false);
      store.add('s5n20-c10', '138000010', 'dept-5', false);
      store.add('s5n20-c11', '138000011', 'dept-5', true);
      store.add('s5n20-c12', '138000012', 'dept-5', false);
      store.add('s5n20-c13', '138000013', 'dept-5', false);
      store.add('s5n20-c14', '138000014', 'dept-5', false);
      store.add('s5n20-c15', '138000015', 'dept-5', true);
      store.add('s5n20-c16', '138000016', 'dept-5', false);
      store.add('s5n20-c17', '138000017', 'dept-5', false);
      store.add('s5n20-c18', '138000018', 'dept-5', false);
      store.add('s5n20-c19', '138000019', 'dept-5', true);
      store.add('s5n20-c20', '138000020', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(19);
      expect(store.search('dept-5').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0385 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_38600
     * @tc.name      testScenarioGrid0386
     * @tc.desc      Verify 20 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0386 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n20-c1', '13800001', 'dept-6', false);
      store.add('s6n20-c2', '13800002', 'dept-6', true);
      store.add('s6n20-c3', '13800003', 'dept-6', false);
      store.add('s6n20-c4', '13800004', 'dept-6', false);
      store.add('s6n20-c5', '13800005', 'dept-6', false);
      store.add('s6n20-c6', '13800006', 'dept-6', true);
      store.add('s6n20-c7', '13800007', 'dept-6', false);
      store.add('s6n20-c8', '13800008', 'dept-6', false);
      store.add('s6n20-c9', '13800009', 'dept-6', false);
      store.add('s6n20-c10', '138000010', 'dept-6', true);
      store.add('s6n20-c11', '138000011', 'dept-6', false);
      store.add('s6n20-c12', '138000012', 'dept-6', false);
      store.add('s6n20-c13', '138000013', 'dept-6', false);
      store.add('s6n20-c14', '138000014', 'dept-6', true);
      store.add('s6n20-c15', '138000015', 'dept-6', false);
      store.add('s6n20-c16', '138000016', 'dept-6', false);
      store.add('s6n20-c17', '138000017', 'dept-6', false);
      store.add('s6n20-c18', '138000018', 'dept-6', true);
      store.add('s6n20-c19', '138000019', 'dept-6', false);
      store.add('s6n20-c20', '138000020', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(19)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(19);
      expect(store.search('dept-6').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0386 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_38700
     * @tc.name      testScenarioGrid0387
     * @tc.desc      Verify 20 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0387 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n20-c1', '13800001', 'dept-7', true);
      store.add('s7n20-c2', '13800002', 'dept-7', false);
      store.add('s7n20-c3', '13800003', 'dept-7', false);
      store.add('s7n20-c4', '13800004', 'dept-7', false);
      store.add('s7n20-c5', '13800005', 'dept-7', true);
      store.add('s7n20-c6', '13800006', 'dept-7', false);
      store.add('s7n20-c7', '13800007', 'dept-7', false);
      store.add('s7n20-c8', '13800008', 'dept-7', false);
      store.add('s7n20-c9', '13800009', 'dept-7', true);
      store.add('s7n20-c10', '138000010', 'dept-7', false);
      store.add('s7n20-c11', '138000011', 'dept-7', false);
      store.add('s7n20-c12', '138000012', 'dept-7', false);
      store.add('s7n20-c13', '138000013', 'dept-7', true);
      store.add('s7n20-c14', '138000014', 'dept-7', false);
      store.add('s7n20-c15', '138000015', 'dept-7', false);
      store.add('s7n20-c16', '138000016', 'dept-7', false);
      store.add('s7n20-c17', '138000017', 'dept-7', true);
      store.add('s7n20-c18', '138000018', 'dept-7', false);
      store.add('s7n20-c19', '138000019', 'dept-7', false);
      store.add('s7n20-c20', '138000020', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(19);
      expect(store.search('dept-7').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0387 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_38800
     * @tc.name      testScenarioGrid0388
     * @tc.desc      Verify 20 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0388 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n20-c1', '13800001', 'dept-8', false);
      store.add('s8n20-c2', '13800002', 'dept-8', false);
      store.add('s8n20-c3', '13800003', 'dept-8', false);
      store.add('s8n20-c4', '13800004', 'dept-8', true);
      store.add('s8n20-c5', '13800005', 'dept-8', false);
      store.add('s8n20-c6', '13800006', 'dept-8', false);
      store.add('s8n20-c7', '13800007', 'dept-8', false);
      store.add('s8n20-c8', '13800008', 'dept-8', true);
      store.add('s8n20-c9', '13800009', 'dept-8', false);
      store.add('s8n20-c10', '138000010', 'dept-8', false);
      store.add('s8n20-c11', '138000011', 'dept-8', false);
      store.add('s8n20-c12', '138000012', 'dept-8', true);
      store.add('s8n20-c13', '138000013', 'dept-8', false);
      store.add('s8n20-c14', '138000014', 'dept-8', false);
      store.add('s8n20-c15', '138000015', 'dept-8', false);
      store.add('s8n20-c16', '138000016', 'dept-8', true);
      store.add('s8n20-c17', '138000017', 'dept-8', false);
      store.add('s8n20-c18', '138000018', 'dept-8', false);
      store.add('s8n20-c19', '138000019', 'dept-8', false);
      store.add('s8n20-c20', '138000020', 'dept-8', true);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(19);
      expect(store.search('dept-8').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0388 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_38900
     * @tc.name      testScenarioGrid0389
     * @tc.desc      Verify 20 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0389 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n20-c1', '13800001', 'dept-9', false);
      store.add('s9n20-c2', '13800002', 'dept-9', false);
      store.add('s9n20-c3', '13800003', 'dept-9', true);
      store.add('s9n20-c4', '13800004', 'dept-9', false);
      store.add('s9n20-c5', '13800005', 'dept-9', false);
      store.add('s9n20-c6', '13800006', 'dept-9', false);
      store.add('s9n20-c7', '13800007', 'dept-9', true);
      store.add('s9n20-c8', '13800008', 'dept-9', false);
      store.add('s9n20-c9', '13800009', 'dept-9', false);
      store.add('s9n20-c10', '138000010', 'dept-9', false);
      store.add('s9n20-c11', '138000011', 'dept-9', true);
      store.add('s9n20-c12', '138000012', 'dept-9', false);
      store.add('s9n20-c13', '138000013', 'dept-9', false);
      store.add('s9n20-c14', '138000014', 'dept-9', false);
      store.add('s9n20-c15', '138000015', 'dept-9', true);
      store.add('s9n20-c16', '138000016', 'dept-9', false);
      store.add('s9n20-c17', '138000017', 'dept-9', false);
      store.add('s9n20-c18', '138000018', 'dept-9', false);
      store.add('s9n20-c19', '138000019', 'dept-9', true);
      store.add('s9n20-c20', '138000020', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(19);
      expect(store.search('dept-9').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0389 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_39000
     * @tc.name      testScenarioGrid0390
     * @tc.desc      Verify 20 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0390 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n20-c1', '13800001', 'dept-10', false);
      store.add('s10n20-c2', '13800002', 'dept-10', true);
      store.add('s10n20-c3', '13800003', 'dept-10', false);
      store.add('s10n20-c4', '13800004', 'dept-10', false);
      store.add('s10n20-c5', '13800005', 'dept-10', false);
      store.add('s10n20-c6', '13800006', 'dept-10', true);
      store.add('s10n20-c7', '13800007', 'dept-10', false);
      store.add('s10n20-c8', '13800008', 'dept-10', false);
      store.add('s10n20-c9', '13800009', 'dept-10', false);
      store.add('s10n20-c10', '138000010', 'dept-10', true);
      store.add('s10n20-c11', '138000011', 'dept-10', false);
      store.add('s10n20-c12', '138000012', 'dept-10', false);
      store.add('s10n20-c13', '138000013', 'dept-10', false);
      store.add('s10n20-c14', '138000014', 'dept-10', true);
      store.add('s10n20-c15', '138000015', 'dept-10', false);
      store.add('s10n20-c16', '138000016', 'dept-10', false);
      store.add('s10n20-c17', '138000017', 'dept-10', false);
      store.add('s10n20-c18', '138000018', 'dept-10', true);
      store.add('s10n20-c19', '138000019', 'dept-10', false);
      store.add('s10n20-c20', '138000020', 'dept-10', false);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(11)).assertEqual(null);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(19);
      expect(store.search('dept-10').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0390 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_39100
     * @tc.name      testScenarioGrid0391
     * @tc.desc      Verify 20 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0391 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n20-c1', '13800001', 'dept-11', true);
      store.add('s11n20-c2', '13800002', 'dept-11', false);
      store.add('s11n20-c3', '13800003', 'dept-11', false);
      store.add('s11n20-c4', '13800004', 'dept-11', false);
      store.add('s11n20-c5', '13800005', 'dept-11', true);
      store.add('s11n20-c6', '13800006', 'dept-11', false);
      store.add('s11n20-c7', '13800007', 'dept-11', false);
      store.add('s11n20-c8', '13800008', 'dept-11', false);
      store.add('s11n20-c9', '13800009', 'dept-11', true);
      store.add('s11n20-c10', '138000010', 'dept-11', false);
      store.add('s11n20-c11', '138000011', 'dept-11', false);
      store.add('s11n20-c12', '138000012', 'dept-11', false);
      store.add('s11n20-c13', '138000013', 'dept-11', true);
      store.add('s11n20-c14', '138000014', 'dept-11', false);
      store.add('s11n20-c15', '138000015', 'dept-11', false);
      store.add('s11n20-c16', '138000016', 'dept-11', false);
      store.add('s11n20-c17', '138000017', 'dept-11', true);
      store.add('s11n20-c18', '138000018', 'dept-11', false);
      store.add('s11n20-c19', '138000019', 'dept-11', false);
      store.add('s11n20-c20', '138000020', 'dept-11', false);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(14)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(19);
      expect(store.search('dept-11').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0391 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_39200
     * @tc.name      testScenarioGrid0392
     * @tc.desc      Verify 20 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0392 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n20-c1', '13800001', 'dept-12', false);
      store.add('s12n20-c2', '13800002', 'dept-12', false);
      store.add('s12n20-c3', '13800003', 'dept-12', false);
      store.add('s12n20-c4', '13800004', 'dept-12', true);
      store.add('s12n20-c5', '13800005', 'dept-12', false);
      store.add('s12n20-c6', '13800006', 'dept-12', false);
      store.add('s12n20-c7', '13800007', 'dept-12', false);
      store.add('s12n20-c8', '13800008', 'dept-12', true);
      store.add('s12n20-c9', '13800009', 'dept-12', false);
      store.add('s12n20-c10', '138000010', 'dept-12', false);
      store.add('s12n20-c11', '138000011', 'dept-12', false);
      store.add('s12n20-c12', '138000012', 'dept-12', true);
      store.add('s12n20-c13', '138000013', 'dept-12', false);
      store.add('s12n20-c14', '138000014', 'dept-12', false);
      store.add('s12n20-c15', '138000015', 'dept-12', false);
      store.add('s12n20-c16', '138000016', 'dept-12', true);
      store.add('s12n20-c17', '138000017', 'dept-12', false);
      store.add('s12n20-c18', '138000018', 'dept-12', false);
      store.add('s12n20-c19', '138000019', 'dept-12', false);
      store.add('s12n20-c20', '138000020', 'dept-12', true);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(17)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(19);
      expect(store.search('dept-12').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0392 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_39300
     * @tc.name      testScenarioGrid0393
     * @tc.desc      Verify 20 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0393 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n20-c1', '13800001', 'dept-13', false);
      store.add('s13n20-c2', '13800002', 'dept-13', false);
      store.add('s13n20-c3', '13800003', 'dept-13', true);
      store.add('s13n20-c4', '13800004', 'dept-13', false);
      store.add('s13n20-c5', '13800005', 'dept-13', false);
      store.add('s13n20-c6', '13800006', 'dept-13', false);
      store.add('s13n20-c7', '13800007', 'dept-13', true);
      store.add('s13n20-c8', '13800008', 'dept-13', false);
      store.add('s13n20-c9', '13800009', 'dept-13', false);
      store.add('s13n20-c10', '138000010', 'dept-13', false);
      store.add('s13n20-c11', '138000011', 'dept-13', true);
      store.add('s13n20-c12', '138000012', 'dept-13', false);
      store.add('s13n20-c13', '138000013', 'dept-13', false);
      store.add('s13n20-c14', '138000014', 'dept-13', false);
      store.add('s13n20-c15', '138000015', 'dept-13', true);
      store.add('s13n20-c16', '138000016', 'dept-13', false);
      store.add('s13n20-c17', '138000017', 'dept-13', false);
      store.add('s13n20-c18', '138000018', 'dept-13', false);
      store.add('s13n20-c19', '138000019', 'dept-13', true);
      store.add('s13n20-c20', '138000020', 'dept-13', false);
      expect(store.remove(14)).assertEqual(true);
      expect(store.toggleOnline(20)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(14) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(19);
      expect(store.search('dept-13').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0393 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_39400
     * @tc.name      testScenarioGrid0394
     * @tc.desc      Verify 20 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0394 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n20-c1', '13800001', 'dept-14', false);
      store.add('s14n20-c2', '13800002', 'dept-14', true);
      store.add('s14n20-c3', '13800003', 'dept-14', false);
      store.add('s14n20-c4', '13800004', 'dept-14', false);
      store.add('s14n20-c5', '13800005', 'dept-14', false);
      store.add('s14n20-c6', '13800006', 'dept-14', true);
      store.add('s14n20-c7', '13800007', 'dept-14', false);
      store.add('s14n20-c8', '13800008', 'dept-14', false);
      store.add('s14n20-c9', '13800009', 'dept-14', false);
      store.add('s14n20-c10', '138000010', 'dept-14', true);
      store.add('s14n20-c11', '138000011', 'dept-14', false);
      store.add('s14n20-c12', '138000012', 'dept-14', false);
      store.add('s14n20-c13', '138000013', 'dept-14', false);
      store.add('s14n20-c14', '138000014', 'dept-14', true);
      store.add('s14n20-c15', '138000015', 'dept-14', false);
      store.add('s14n20-c16', '138000016', 'dept-14', false);
      store.add('s14n20-c17', '138000017', 'dept-14', false);
      store.add('s14n20-c18', '138000018', 'dept-14', true);
      store.add('s14n20-c19', '138000019', 'dept-14', false);
      store.add('s14n20-c20', '138000020', 'dept-14', false);
      expect(store.remove(15)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(15) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(19);
      expect(store.search('dept-14').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0394 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_39500
     * @tc.name      testScenarioGrid0395
     * @tc.desc      Verify 20 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0395 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n20-c1', '13800001', 'dept-15', true);
      store.add('s15n20-c2', '13800002', 'dept-15', false);
      store.add('s15n20-c3', '13800003', 'dept-15', false);
      store.add('s15n20-c4', '13800004', 'dept-15', false);
      store.add('s15n20-c5', '13800005', 'dept-15', true);
      store.add('s15n20-c6', '13800006', 'dept-15', false);
      store.add('s15n20-c7', '13800007', 'dept-15', false);
      store.add('s15n20-c8', '13800008', 'dept-15', false);
      store.add('s15n20-c9', '13800009', 'dept-15', true);
      store.add('s15n20-c10', '138000010', 'dept-15', false);
      store.add('s15n20-c11', '138000011', 'dept-15', false);
      store.add('s15n20-c12', '138000012', 'dept-15', false);
      store.add('s15n20-c13', '138000013', 'dept-15', true);
      store.add('s15n20-c14', '138000014', 'dept-15', false);
      store.add('s15n20-c15', '138000015', 'dept-15', false);
      store.add('s15n20-c16', '138000016', 'dept-15', false);
      store.add('s15n20-c17', '138000017', 'dept-15', true);
      store.add('s15n20-c18', '138000018', 'dept-15', false);
      store.add('s15n20-c19', '138000019', 'dept-15', false);
      store.add('s15n20-c20', '138000020', 'dept-15', false);
      expect(store.remove(16)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(16) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(19);
      expect(store.search('dept-15').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0395 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_39600
     * @tc.name      testScenarioGrid0396
     * @tc.desc      Verify 20 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0396 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n20-c1', '13800001', 'dept-16', false);
      store.add('s16n20-c2', '13800002', 'dept-16', false);
      store.add('s16n20-c3', '13800003', 'dept-16', false);
      store.add('s16n20-c4', '13800004', 'dept-16', true);
      store.add('s16n20-c5', '13800005', 'dept-16', false);
      store.add('s16n20-c6', '13800006', 'dept-16', false);
      store.add('s16n20-c7', '13800007', 'dept-16', false);
      store.add('s16n20-c8', '13800008', 'dept-16', true);
      store.add('s16n20-c9', '13800009', 'dept-16', false);
      store.add('s16n20-c10', '138000010', 'dept-16', false);
      store.add('s16n20-c11', '138000011', 'dept-16', false);
      store.add('s16n20-c12', '138000012', 'dept-16', true);
      store.add('s16n20-c13', '138000013', 'dept-16', false);
      store.add('s16n20-c14', '138000014', 'dept-16', false);
      store.add('s16n20-c15', '138000015', 'dept-16', false);
      store.add('s16n20-c16', '138000016', 'dept-16', true);
      store.add('s16n20-c17', '138000017', 'dept-16', false);
      store.add('s16n20-c18', '138000018', 'dept-16', false);
      store.add('s16n20-c19', '138000019', 'dept-16', false);
      store.add('s16n20-c20', '138000020', 'dept-16', true);
      expect(store.remove(17)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(17) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(19);
      expect(store.search('dept-16').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0396 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_39700
     * @tc.name      testScenarioGrid0397
     * @tc.desc      Verify 20 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0397 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n20-c1', '13800001', 'dept-17', false);
      store.add('s17n20-c2', '13800002', 'dept-17', false);
      store.add('s17n20-c3', '13800003', 'dept-17', true);
      store.add('s17n20-c4', '13800004', 'dept-17', false);
      store.add('s17n20-c5', '13800005', 'dept-17', false);
      store.add('s17n20-c6', '13800006', 'dept-17', false);
      store.add('s17n20-c7', '13800007', 'dept-17', true);
      store.add('s17n20-c8', '13800008', 'dept-17', false);
      store.add('s17n20-c9', '13800009', 'dept-17', false);
      store.add('s17n20-c10', '138000010', 'dept-17', false);
      store.add('s17n20-c11', '138000011', 'dept-17', true);
      store.add('s17n20-c12', '138000012', 'dept-17', false);
      store.add('s17n20-c13', '138000013', 'dept-17', false);
      store.add('s17n20-c14', '138000014', 'dept-17', false);
      store.add('s17n20-c15', '138000015', 'dept-17', true);
      store.add('s17n20-c16', '138000016', 'dept-17', false);
      store.add('s17n20-c17', '138000017', 'dept-17', false);
      store.add('s17n20-c18', '138000018', 'dept-17', false);
      store.add('s17n20-c19', '138000019', 'dept-17', true);
      store.add('s17n20-c20', '138000020', 'dept-17', false);
      expect(store.remove(18)).assertEqual(true);
      expect(store.toggleOnline(12)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(18) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(19);
      expect(store.search('dept-17').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0397 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_39800
     * @tc.name      testScenarioGrid0398
     * @tc.desc      Verify 20 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0398 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n20-c1', '13800001', 'dept-18', false);
      store.add('s18n20-c2', '13800002', 'dept-18', true);
      store.add('s18n20-c3', '13800003', 'dept-18', false);
      store.add('s18n20-c4', '13800004', 'dept-18', false);
      store.add('s18n20-c5', '13800005', 'dept-18', false);
      store.add('s18n20-c6', '13800006', 'dept-18', true);
      store.add('s18n20-c7', '13800007', 'dept-18', false);
      store.add('s18n20-c8', '13800008', 'dept-18', false);
      store.add('s18n20-c9', '13800009', 'dept-18', false);
      store.add('s18n20-c10', '138000010', 'dept-18', true);
      store.add('s18n20-c11', '138000011', 'dept-18', false);
      store.add('s18n20-c12', '138000012', 'dept-18', false);
      store.add('s18n20-c13', '138000013', 'dept-18', false);
      store.add('s18n20-c14', '138000014', 'dept-18', true);
      store.add('s18n20-c15', '138000015', 'dept-18', false);
      store.add('s18n20-c16', '138000016', 'dept-18', false);
      store.add('s18n20-c17', '138000017', 'dept-18', false);
      store.add('s18n20-c18', '138000018', 'dept-18', true);
      store.add('s18n20-c19', '138000019', 'dept-18', false);
      store.add('s18n20-c20', '138000020', 'dept-18', false);
      expect(store.remove(19)).assertEqual(true);
      expect(store.toggleOnline(15)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(19) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(19);
      expect(store.search('dept-18').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0398 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_39900
     * @tc.name      testScenarioGrid0399
     * @tc.desc      Verify 20 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0399 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n20-c1', '13800001', 'dept-19', true);
      store.add('s19n20-c2', '13800002', 'dept-19', false);
      store.add('s19n20-c3', '13800003', 'dept-19', false);
      store.add('s19n20-c4', '13800004', 'dept-19', false);
      store.add('s19n20-c5', '13800005', 'dept-19', true);
      store.add('s19n20-c6', '13800006', 'dept-19', false);
      store.add('s19n20-c7', '13800007', 'dept-19', false);
      store.add('s19n20-c8', '13800008', 'dept-19', false);
      store.add('s19n20-c9', '13800009', 'dept-19', true);
      store.add('s19n20-c10', '138000010', 'dept-19', false);
      store.add('s19n20-c11', '138000011', 'dept-19', false);
      store.add('s19n20-c12', '138000012', 'dept-19', false);
      store.add('s19n20-c13', '138000013', 'dept-19', true);
      store.add('s19n20-c14', '138000014', 'dept-19', false);
      store.add('s19n20-c15', '138000015', 'dept-19', false);
      store.add('s19n20-c16', '138000016', 'dept-19', false);
      store.add('s19n20-c17', '138000017', 'dept-19', true);
      store.add('s19n20-c18', '138000018', 'dept-19', false);
      store.add('s19n20-c19', '138000019', 'dept-19', false);
      store.add('s19n20-c20', '138000020', 'dept-19', false);
      expect(store.remove(20)).assertEqual(true);
      expect(store.toggleOnline(18)).assertEqual(true);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(20) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(19);
      expect(store.search('dept-19').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0399 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP10_40000
     * @tc.name      testScenarioGrid0400
     * @tc.desc      Verify 20 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0400 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n20-c1', '13800001', 'dept-20', false);
      store.add('s20n20-c2', '13800002', 'dept-20', false);
      store.add('s20n20-c3', '13800003', 'dept-20', false);
      store.add('s20n20-c4', '13800004', 'dept-20', true);
      store.add('s20n20-c5', '13800005', 'dept-20', false);
      store.add('s20n20-c6', '13800006', 'dept-20', false);
      store.add('s20n20-c7', '13800007', 'dept-20', false);
      store.add('s20n20-c8', '13800008', 'dept-20', true);
      store.add('s20n20-c9', '13800009', 'dept-20', false);
      store.add('s20n20-c10', '138000010', 'dept-20', false);
      store.add('s20n20-c11', '138000011', 'dept-20', false);
      store.add('s20n20-c12', '138000012', 'dept-20', true);
      store.add('s20n20-c13', '138000013', 'dept-20', false);
      store.add('s20n20-c14', '138000014', 'dept-20', false);
      store.add('s20n20-c15', '138000015', 'dept-20', false);
      store.add('s20n20-c16', '138000016', 'dept-20', true);
      store.add('s20n20-c17', '138000017', 'dept-20', false);
      store.add('s20n20-c18', '138000018', 'dept-20', false);
      store.add('s20n20-c19', '138000019', 'dept-20', false);
      store.add('s20n20-c20', '138000020', 'dept-20', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(19);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(19);
      expect(store.search('dept-20').length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0400 end');
    })

  })
}
