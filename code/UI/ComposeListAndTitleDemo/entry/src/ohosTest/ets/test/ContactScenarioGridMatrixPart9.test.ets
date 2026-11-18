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

export default function ContactScenarioGridMatrixPart9Test(): void {
  describe('ContactScenarioGridMatrixPart9', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_32100
     * @tc.name      testScenarioGrid0321
     * @tc.desc      Verify 17 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0321 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n17-c1', '13800001', 'dept-1', false);
      store.add('s1n17-c2', '13800002', 'dept-1', false);
      store.add('s1n17-c3', '13800003', 'dept-1', true);
      store.add('s1n17-c4', '13800004', 'dept-1', false);
      store.add('s1n17-c5', '13800005', 'dept-1', false);
      store.add('s1n17-c6', '13800006', 'dept-1', false);
      store.add('s1n17-c7', '13800007', 'dept-1', true);
      store.add('s1n17-c8', '13800008', 'dept-1', false);
      store.add('s1n17-c9', '13800009', 'dept-1', false);
      store.add('s1n17-c10', '138000010', 'dept-1', false);
      store.add('s1n17-c11', '138000011', 'dept-1', true);
      store.add('s1n17-c12', '138000012', 'dept-1', false);
      store.add('s1n17-c13', '138000013', 'dept-1', false);
      store.add('s1n17-c14', '138000014', 'dept-1', false);
      store.add('s1n17-c15', '138000015', 'dept-1', true);
      store.add('s1n17-c16', '138000016', 'dept-1', false);
      store.add('s1n17-c17', '138000017', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(16);
      expect(store.search('dept-1').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0321 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_32200
     * @tc.name      testScenarioGrid0322
     * @tc.desc      Verify 17 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0322 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n17-c1', '13800001', 'dept-2', false);
      store.add('s2n17-c2', '13800002', 'dept-2', true);
      store.add('s2n17-c3', '13800003', 'dept-2', false);
      store.add('s2n17-c4', '13800004', 'dept-2', false);
      store.add('s2n17-c5', '13800005', 'dept-2', false);
      store.add('s2n17-c6', '13800006', 'dept-2', true);
      store.add('s2n17-c7', '13800007', 'dept-2', false);
      store.add('s2n17-c8', '13800008', 'dept-2', false);
      store.add('s2n17-c9', '13800009', 'dept-2', false);
      store.add('s2n17-c10', '138000010', 'dept-2', true);
      store.add('s2n17-c11', '138000011', 'dept-2', false);
      store.add('s2n17-c12', '138000012', 'dept-2', false);
      store.add('s2n17-c13', '138000013', 'dept-2', false);
      store.add('s2n17-c14', '138000014', 'dept-2', true);
      store.add('s2n17-c15', '138000015', 'dept-2', false);
      store.add('s2n17-c16', '138000016', 'dept-2', false);
      store.add('s2n17-c17', '138000017', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(16);
      expect(store.search('dept-2').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0322 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_32300
     * @tc.name      testScenarioGrid0323
     * @tc.desc      Verify 17 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0323 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n17-c1', '13800001', 'dept-3', true);
      store.add('s3n17-c2', '13800002', 'dept-3', false);
      store.add('s3n17-c3', '13800003', 'dept-3', false);
      store.add('s3n17-c4', '13800004', 'dept-3', false);
      store.add('s3n17-c5', '13800005', 'dept-3', true);
      store.add('s3n17-c6', '13800006', 'dept-3', false);
      store.add('s3n17-c7', '13800007', 'dept-3', false);
      store.add('s3n17-c8', '13800008', 'dept-3', false);
      store.add('s3n17-c9', '13800009', 'dept-3', true);
      store.add('s3n17-c10', '138000010', 'dept-3', false);
      store.add('s3n17-c11', '138000011', 'dept-3', false);
      store.add('s3n17-c12', '138000012', 'dept-3', false);
      store.add('s3n17-c13', '138000013', 'dept-3', true);
      store.add('s3n17-c14', '138000014', 'dept-3', false);
      store.add('s3n17-c15', '138000015', 'dept-3', false);
      store.add('s3n17-c16', '138000016', 'dept-3', false);
      store.add('s3n17-c17', '138000017', 'dept-3', true);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(16);
      expect(store.search('dept-3').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0323 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_32400
     * @tc.name      testScenarioGrid0324
     * @tc.desc      Verify 17 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0324 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n17-c1', '13800001', 'dept-4', false);
      store.add('s4n17-c2', '13800002', 'dept-4', false);
      store.add('s4n17-c3', '13800003', 'dept-4', false);
      store.add('s4n17-c4', '13800004', 'dept-4', true);
      store.add('s4n17-c5', '13800005', 'dept-4', false);
      store.add('s4n17-c6', '13800006', 'dept-4', false);
      store.add('s4n17-c7', '13800007', 'dept-4', false);
      store.add('s4n17-c8', '13800008', 'dept-4', true);
      store.add('s4n17-c9', '13800009', 'dept-4', false);
      store.add('s4n17-c10', '138000010', 'dept-4', false);
      store.add('s4n17-c11', '138000011', 'dept-4', false);
      store.add('s4n17-c12', '138000012', 'dept-4', true);
      store.add('s4n17-c13', '138000013', 'dept-4', false);
      store.add('s4n17-c14', '138000014', 'dept-4', false);
      store.add('s4n17-c15', '138000015', 'dept-4', false);
      store.add('s4n17-c16', '138000016', 'dept-4', true);
      store.add('s4n17-c17', '138000017', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(16);
      expect(store.search('dept-4').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0324 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_32500
     * @tc.name      testScenarioGrid0325
     * @tc.desc      Verify 17 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0325 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n17-c1', '13800001', 'dept-5', false);
      store.add('s5n17-c2', '13800002', 'dept-5', false);
      store.add('s5n17-c3', '13800003', 'dept-5', true);
      store.add('s5n17-c4', '13800004', 'dept-5', false);
      store.add('s5n17-c5', '13800005', 'dept-5', false);
      store.add('s5n17-c6', '13800006', 'dept-5', false);
      store.add('s5n17-c7', '13800007', 'dept-5', true);
      store.add('s5n17-c8', '13800008', 'dept-5', false);
      store.add('s5n17-c9', '13800009', 'dept-5', false);
      store.add('s5n17-c10', '138000010', 'dept-5', false);
      store.add('s5n17-c11', '138000011', 'dept-5', true);
      store.add('s5n17-c12', '138000012', 'dept-5', false);
      store.add('s5n17-c13', '138000013', 'dept-5', false);
      store.add('s5n17-c14', '138000014', 'dept-5', false);
      store.add('s5n17-c15', '138000015', 'dept-5', true);
      store.add('s5n17-c16', '138000016', 'dept-5', false);
      store.add('s5n17-c17', '138000017', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(16);
      expect(store.search('dept-5').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0325 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_32600
     * @tc.name      testScenarioGrid0326
     * @tc.desc      Verify 17 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0326 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n17-c1', '13800001', 'dept-6', false);
      store.add('s6n17-c2', '13800002', 'dept-6', true);
      store.add('s6n17-c3', '13800003', 'dept-6', false);
      store.add('s6n17-c4', '13800004', 'dept-6', false);
      store.add('s6n17-c5', '13800005', 'dept-6', false);
      store.add('s6n17-c6', '13800006', 'dept-6', true);
      store.add('s6n17-c7', '13800007', 'dept-6', false);
      store.add('s6n17-c8', '13800008', 'dept-6', false);
      store.add('s6n17-c9', '13800009', 'dept-6', false);
      store.add('s6n17-c10', '138000010', 'dept-6', true);
      store.add('s6n17-c11', '138000011', 'dept-6', false);
      store.add('s6n17-c12', '138000012', 'dept-6', false);
      store.add('s6n17-c13', '138000013', 'dept-6', false);
      store.add('s6n17-c14', '138000014', 'dept-6', true);
      store.add('s6n17-c15', '138000015', 'dept-6', false);
      store.add('s6n17-c16', '138000016', 'dept-6', false);
      store.add('s6n17-c17', '138000017', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(false);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(16);
      expect(store.search('dept-6').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0326 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_32700
     * @tc.name      testScenarioGrid0327
     * @tc.desc      Verify 17 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0327 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n17-c1', '13800001', 'dept-7', true);
      store.add('s7n17-c2', '13800002', 'dept-7', false);
      store.add('s7n17-c3', '13800003', 'dept-7', false);
      store.add('s7n17-c4', '13800004', 'dept-7', false);
      store.add('s7n17-c5', '13800005', 'dept-7', true);
      store.add('s7n17-c6', '13800006', 'dept-7', false);
      store.add('s7n17-c7', '13800007', 'dept-7', false);
      store.add('s7n17-c8', '13800008', 'dept-7', false);
      store.add('s7n17-c9', '13800009', 'dept-7', true);
      store.add('s7n17-c10', '138000010', 'dept-7', false);
      store.add('s7n17-c11', '138000011', 'dept-7', false);
      store.add('s7n17-c12', '138000012', 'dept-7', false);
      store.add('s7n17-c13', '138000013', 'dept-7', true);
      store.add('s7n17-c14', '138000014', 'dept-7', false);
      store.add('s7n17-c15', '138000015', 'dept-7', false);
      store.add('s7n17-c16', '138000016', 'dept-7', false);
      store.add('s7n17-c17', '138000017', 'dept-7', true);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(false);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(16);
      expect(store.search('dept-7').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0327 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_32800
     * @tc.name      testScenarioGrid0328
     * @tc.desc      Verify 17 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0328 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n17-c1', '13800001', 'dept-8', false);
      store.add('s8n17-c2', '13800002', 'dept-8', false);
      store.add('s8n17-c3', '13800003', 'dept-8', false);
      store.add('s8n17-c4', '13800004', 'dept-8', true);
      store.add('s8n17-c5', '13800005', 'dept-8', false);
      store.add('s8n17-c6', '13800006', 'dept-8', false);
      store.add('s8n17-c7', '13800007', 'dept-8', false);
      store.add('s8n17-c8', '13800008', 'dept-8', true);
      store.add('s8n17-c9', '13800009', 'dept-8', false);
      store.add('s8n17-c10', '138000010', 'dept-8', false);
      store.add('s8n17-c11', '138000011', 'dept-8', false);
      store.add('s8n17-c12', '138000012', 'dept-8', true);
      store.add('s8n17-c13', '138000013', 'dept-8', false);
      store.add('s8n17-c14', '138000014', 'dept-8', false);
      store.add('s8n17-c15', '138000015', 'dept-8', false);
      store.add('s8n17-c16', '138000016', 'dept-8', true);
      store.add('s8n17-c17', '138000017', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(false);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(16);
      expect(store.search('dept-8').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0328 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_32900
     * @tc.name      testScenarioGrid0329
     * @tc.desc      Verify 17 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0329 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n17-c1', '13800001', 'dept-9', false);
      store.add('s9n17-c2', '13800002', 'dept-9', false);
      store.add('s9n17-c3', '13800003', 'dept-9', true);
      store.add('s9n17-c4', '13800004', 'dept-9', false);
      store.add('s9n17-c5', '13800005', 'dept-9', false);
      store.add('s9n17-c6', '13800006', 'dept-9', false);
      store.add('s9n17-c7', '13800007', 'dept-9', true);
      store.add('s9n17-c8', '13800008', 'dept-9', false);
      store.add('s9n17-c9', '13800009', 'dept-9', false);
      store.add('s9n17-c10', '138000010', 'dept-9', false);
      store.add('s9n17-c11', '138000011', 'dept-9', true);
      store.add('s9n17-c12', '138000012', 'dept-9', false);
      store.add('s9n17-c13', '138000013', 'dept-9', false);
      store.add('s9n17-c14', '138000014', 'dept-9', false);
      store.add('s9n17-c15', '138000015', 'dept-9', true);
      store.add('s9n17-c16', '138000016', 'dept-9', false);
      store.add('s9n17-c17', '138000017', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(11)).assertEqual(false);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(16);
      expect(store.search('dept-9').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0329 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_33000
     * @tc.name      testScenarioGrid0330
     * @tc.desc      Verify 17 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0330 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n17-c1', '13800001', 'dept-10', false);
      store.add('s10n17-c2', '13800002', 'dept-10', true);
      store.add('s10n17-c3', '13800003', 'dept-10', false);
      store.add('s10n17-c4', '13800004', 'dept-10', false);
      store.add('s10n17-c5', '13800005', 'dept-10', false);
      store.add('s10n17-c6', '13800006', 'dept-10', true);
      store.add('s10n17-c7', '13800007', 'dept-10', false);
      store.add('s10n17-c8', '13800008', 'dept-10', false);
      store.add('s10n17-c9', '13800009', 'dept-10', false);
      store.add('s10n17-c10', '138000010', 'dept-10', true);
      store.add('s10n17-c11', '138000011', 'dept-10', false);
      store.add('s10n17-c12', '138000012', 'dept-10', false);
      store.add('s10n17-c13', '138000013', 'dept-10', false);
      store.add('s10n17-c14', '138000014', 'dept-10', true);
      store.add('s10n17-c15', '138000015', 'dept-10', false);
      store.add('s10n17-c16', '138000016', 'dept-10', false);
      store.add('s10n17-c17', '138000017', 'dept-10', false);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(14)).assertEqual(false);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(16);
      expect(store.search('dept-10').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0330 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_33100
     * @tc.name      testScenarioGrid0331
     * @tc.desc      Verify 17 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0331 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n17-c1', '13800001', 'dept-11', true);
      store.add('s11n17-c2', '13800002', 'dept-11', false);
      store.add('s11n17-c3', '13800003', 'dept-11', false);
      store.add('s11n17-c4', '13800004', 'dept-11', false);
      store.add('s11n17-c5', '13800005', 'dept-11', true);
      store.add('s11n17-c6', '13800006', 'dept-11', false);
      store.add('s11n17-c7', '13800007', 'dept-11', false);
      store.add('s11n17-c8', '13800008', 'dept-11', false);
      store.add('s11n17-c9', '13800009', 'dept-11', true);
      store.add('s11n17-c10', '138000010', 'dept-11', false);
      store.add('s11n17-c11', '138000011', 'dept-11', false);
      store.add('s11n17-c12', '138000012', 'dept-11', false);
      store.add('s11n17-c13', '138000013', 'dept-11', true);
      store.add('s11n17-c14', '138000014', 'dept-11', false);
      store.add('s11n17-c15', '138000015', 'dept-11', false);
      store.add('s11n17-c16', '138000016', 'dept-11', false);
      store.add('s11n17-c17', '138000017', 'dept-11', true);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(17)).assertEqual(false);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(16);
      expect(store.search('dept-11').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0331 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_33200
     * @tc.name      testScenarioGrid0332
     * @tc.desc      Verify 17 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0332 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n17-c1', '13800001', 'dept-12', false);
      store.add('s12n17-c2', '13800002', 'dept-12', false);
      store.add('s12n17-c3', '13800003', 'dept-12', false);
      store.add('s12n17-c4', '13800004', 'dept-12', true);
      store.add('s12n17-c5', '13800005', 'dept-12', false);
      store.add('s12n17-c6', '13800006', 'dept-12', false);
      store.add('s12n17-c7', '13800007', 'dept-12', false);
      store.add('s12n17-c8', '13800008', 'dept-12', true);
      store.add('s12n17-c9', '13800009', 'dept-12', false);
      store.add('s12n17-c10', '138000010', 'dept-12', false);
      store.add('s12n17-c11', '138000011', 'dept-12', false);
      store.add('s12n17-c12', '138000012', 'dept-12', true);
      store.add('s12n17-c13', '138000013', 'dept-12', false);
      store.add('s12n17-c14', '138000014', 'dept-12', false);
      store.add('s12n17-c15', '138000015', 'dept-12', false);
      store.add('s12n17-c16', '138000016', 'dept-12', true);
      store.add('s12n17-c17', '138000017', 'dept-12', false);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(16);
      expect(store.search('dept-12').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0332 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_33300
     * @tc.name      testScenarioGrid0333
     * @tc.desc      Verify 17 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0333 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n17-c1', '13800001', 'dept-13', false);
      store.add('s13n17-c2', '13800002', 'dept-13', false);
      store.add('s13n17-c3', '13800003', 'dept-13', true);
      store.add('s13n17-c4', '13800004', 'dept-13', false);
      store.add('s13n17-c5', '13800005', 'dept-13', false);
      store.add('s13n17-c6', '13800006', 'dept-13', false);
      store.add('s13n17-c7', '13800007', 'dept-13', true);
      store.add('s13n17-c8', '13800008', 'dept-13', false);
      store.add('s13n17-c9', '13800009', 'dept-13', false);
      store.add('s13n17-c10', '138000010', 'dept-13', false);
      store.add('s13n17-c11', '138000011', 'dept-13', true);
      store.add('s13n17-c12', '138000012', 'dept-13', false);
      store.add('s13n17-c13', '138000013', 'dept-13', false);
      store.add('s13n17-c14', '138000014', 'dept-13', false);
      store.add('s13n17-c15', '138000015', 'dept-13', true);
      store.add('s13n17-c16', '138000016', 'dept-13', false);
      store.add('s13n17-c17', '138000017', 'dept-13', false);
      expect(store.remove(14)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(14) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(16);
      expect(store.search('dept-13').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0333 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_33400
     * @tc.name      testScenarioGrid0334
     * @tc.desc      Verify 17 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0334 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n17-c1', '13800001', 'dept-14', false);
      store.add('s14n17-c2', '13800002', 'dept-14', true);
      store.add('s14n17-c3', '13800003', 'dept-14', false);
      store.add('s14n17-c4', '13800004', 'dept-14', false);
      store.add('s14n17-c5', '13800005', 'dept-14', false);
      store.add('s14n17-c6', '13800006', 'dept-14', true);
      store.add('s14n17-c7', '13800007', 'dept-14', false);
      store.add('s14n17-c8', '13800008', 'dept-14', false);
      store.add('s14n17-c9', '13800009', 'dept-14', false);
      store.add('s14n17-c10', '138000010', 'dept-14', true);
      store.add('s14n17-c11', '138000011', 'dept-14', false);
      store.add('s14n17-c12', '138000012', 'dept-14', false);
      store.add('s14n17-c13', '138000013', 'dept-14', false);
      store.add('s14n17-c14', '138000014', 'dept-14', true);
      store.add('s14n17-c15', '138000015', 'dept-14', false);
      store.add('s14n17-c16', '138000016', 'dept-14', false);
      store.add('s14n17-c17', '138000017', 'dept-14', false);
      expect(store.remove(15)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(15) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(16);
      expect(store.search('dept-14').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0334 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_33500
     * @tc.name      testScenarioGrid0335
     * @tc.desc      Verify 17 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0335 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n17-c1', '13800001', 'dept-15', true);
      store.add('s15n17-c2', '13800002', 'dept-15', false);
      store.add('s15n17-c3', '13800003', 'dept-15', false);
      store.add('s15n17-c4', '13800004', 'dept-15', false);
      store.add('s15n17-c5', '13800005', 'dept-15', true);
      store.add('s15n17-c6', '13800006', 'dept-15', false);
      store.add('s15n17-c7', '13800007', 'dept-15', false);
      store.add('s15n17-c8', '13800008', 'dept-15', false);
      store.add('s15n17-c9', '13800009', 'dept-15', true);
      store.add('s15n17-c10', '138000010', 'dept-15', false);
      store.add('s15n17-c11', '138000011', 'dept-15', false);
      store.add('s15n17-c12', '138000012', 'dept-15', false);
      store.add('s15n17-c13', '138000013', 'dept-15', true);
      store.add('s15n17-c14', '138000014', 'dept-15', false);
      store.add('s15n17-c15', '138000015', 'dept-15', false);
      store.add('s15n17-c16', '138000016', 'dept-15', false);
      store.add('s15n17-c17', '138000017', 'dept-15', true);
      expect(store.remove(16)).assertEqual(true);
      expect(store.toggleOnline(12)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(16) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(16);
      expect(store.search('dept-15').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0335 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_33600
     * @tc.name      testScenarioGrid0336
     * @tc.desc      Verify 17 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0336 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n17-c1', '13800001', 'dept-16', false);
      store.add('s16n17-c2', '13800002', 'dept-16', false);
      store.add('s16n17-c3', '13800003', 'dept-16', false);
      store.add('s16n17-c4', '13800004', 'dept-16', true);
      store.add('s16n17-c5', '13800005', 'dept-16', false);
      store.add('s16n17-c6', '13800006', 'dept-16', false);
      store.add('s16n17-c7', '13800007', 'dept-16', false);
      store.add('s16n17-c8', '13800008', 'dept-16', true);
      store.add('s16n17-c9', '13800009', 'dept-16', false);
      store.add('s16n17-c10', '138000010', 'dept-16', false);
      store.add('s16n17-c11', '138000011', 'dept-16', false);
      store.add('s16n17-c12', '138000012', 'dept-16', true);
      store.add('s16n17-c13', '138000013', 'dept-16', false);
      store.add('s16n17-c14', '138000014', 'dept-16', false);
      store.add('s16n17-c15', '138000015', 'dept-16', false);
      store.add('s16n17-c16', '138000016', 'dept-16', true);
      store.add('s16n17-c17', '138000017', 'dept-16', false);
      expect(store.remove(17)).assertEqual(true);
      expect(store.toggleOnline(15)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(17) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(16);
      expect(store.search('dept-16').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0336 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_33700
     * @tc.name      testScenarioGrid0337
     * @tc.desc      Verify 17 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0337 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n17-c1', '13800001', 'dept-17', false);
      store.add('s17n17-c2', '13800002', 'dept-17', false);
      store.add('s17n17-c3', '13800003', 'dept-17', true);
      store.add('s17n17-c4', '13800004', 'dept-17', false);
      store.add('s17n17-c5', '13800005', 'dept-17', false);
      store.add('s17n17-c6', '13800006', 'dept-17', false);
      store.add('s17n17-c7', '13800007', 'dept-17', true);
      store.add('s17n17-c8', '13800008', 'dept-17', false);
      store.add('s17n17-c9', '13800009', 'dept-17', false);
      store.add('s17n17-c10', '138000010', 'dept-17', false);
      store.add('s17n17-c11', '138000011', 'dept-17', true);
      store.add('s17n17-c12', '138000012', 'dept-17', false);
      store.add('s17n17-c13', '138000013', 'dept-17', false);
      store.add('s17n17-c14', '138000014', 'dept-17', false);
      store.add('s17n17-c15', '138000015', 'dept-17', true);
      store.add('s17n17-c16', '138000016', 'dept-17', false);
      store.add('s17n17-c17', '138000017', 'dept-17', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(16);
      expect(store.search('dept-17').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0337 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_33800
     * @tc.name      testScenarioGrid0338
     * @tc.desc      Verify 17 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0338 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n17-c1', '13800001', 'dept-18', false);
      store.add('s18n17-c2', '13800002', 'dept-18', true);
      store.add('s18n17-c3', '13800003', 'dept-18', false);
      store.add('s18n17-c4', '13800004', 'dept-18', false);
      store.add('s18n17-c5', '13800005', 'dept-18', false);
      store.add('s18n17-c6', '13800006', 'dept-18', true);
      store.add('s18n17-c7', '13800007', 'dept-18', false);
      store.add('s18n17-c8', '13800008', 'dept-18', false);
      store.add('s18n17-c9', '13800009', 'dept-18', false);
      store.add('s18n17-c10', '138000010', 'dept-18', true);
      store.add('s18n17-c11', '138000011', 'dept-18', false);
      store.add('s18n17-c12', '138000012', 'dept-18', false);
      store.add('s18n17-c13', '138000013', 'dept-18', false);
      store.add('s18n17-c14', '138000014', 'dept-18', true);
      store.add('s18n17-c15', '138000015', 'dept-18', false);
      store.add('s18n17-c16', '138000016', 'dept-18', false);
      store.add('s18n17-c17', '138000017', 'dept-18', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(16);
      expect(store.search('dept-18').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0338 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_33900
     * @tc.name      testScenarioGrid0339
     * @tc.desc      Verify 17 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0339 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n17-c1', '13800001', 'dept-19', true);
      store.add('s19n17-c2', '13800002', 'dept-19', false);
      store.add('s19n17-c3', '13800003', 'dept-19', false);
      store.add('s19n17-c4', '13800004', 'dept-19', false);
      store.add('s19n17-c5', '13800005', 'dept-19', true);
      store.add('s19n17-c6', '13800006', 'dept-19', false);
      store.add('s19n17-c7', '13800007', 'dept-19', false);
      store.add('s19n17-c8', '13800008', 'dept-19', false);
      store.add('s19n17-c9', '13800009', 'dept-19', true);
      store.add('s19n17-c10', '138000010', 'dept-19', false);
      store.add('s19n17-c11', '138000011', 'dept-19', false);
      store.add('s19n17-c12', '138000012', 'dept-19', false);
      store.add('s19n17-c13', '138000013', 'dept-19', true);
      store.add('s19n17-c14', '138000014', 'dept-19', false);
      store.add('s19n17-c15', '138000015', 'dept-19', false);
      store.add('s19n17-c16', '138000016', 'dept-19', false);
      store.add('s19n17-c17', '138000017', 'dept-19', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(16);
      expect(store.search('dept-19').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0339 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_34000
     * @tc.name      testScenarioGrid0340
     * @tc.desc      Verify 17 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0340 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n17-c1', '13800001', 'dept-20', false);
      store.add('s20n17-c2', '13800002', 'dept-20', false);
      store.add('s20n17-c3', '13800003', 'dept-20', false);
      store.add('s20n17-c4', '13800004', 'dept-20', true);
      store.add('s20n17-c5', '13800005', 'dept-20', false);
      store.add('s20n17-c6', '13800006', 'dept-20', false);
      store.add('s20n17-c7', '13800007', 'dept-20', false);
      store.add('s20n17-c8', '13800008', 'dept-20', true);
      store.add('s20n17-c9', '13800009', 'dept-20', false);
      store.add('s20n17-c10', '138000010', 'dept-20', false);
      store.add('s20n17-c11', '138000011', 'dept-20', false);
      store.add('s20n17-c12', '138000012', 'dept-20', true);
      store.add('s20n17-c13', '138000013', 'dept-20', false);
      store.add('s20n17-c14', '138000014', 'dept-20', false);
      store.add('s20n17-c15', '138000015', 'dept-20', false);
      store.add('s20n17-c16', '138000016', 'dept-20', true);
      store.add('s20n17-c17', '138000017', 'dept-20', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(16);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(16);
      expect(store.search('dept-20').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0340 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_34100
     * @tc.name      testScenarioGrid0341
     * @tc.desc      Verify 18 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0341 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n18-c1', '13800001', 'dept-1', false);
      store.add('s1n18-c2', '13800002', 'dept-1', false);
      store.add('s1n18-c3', '13800003', 'dept-1', true);
      store.add('s1n18-c4', '13800004', 'dept-1', false);
      store.add('s1n18-c5', '13800005', 'dept-1', false);
      store.add('s1n18-c6', '13800006', 'dept-1', false);
      store.add('s1n18-c7', '13800007', 'dept-1', true);
      store.add('s1n18-c8', '13800008', 'dept-1', false);
      store.add('s1n18-c9', '13800009', 'dept-1', false);
      store.add('s1n18-c10', '138000010', 'dept-1', false);
      store.add('s1n18-c11', '138000011', 'dept-1', true);
      store.add('s1n18-c12', '138000012', 'dept-1', false);
      store.add('s1n18-c13', '138000013', 'dept-1', false);
      store.add('s1n18-c14', '138000014', 'dept-1', false);
      store.add('s1n18-c15', '138000015', 'dept-1', true);
      store.add('s1n18-c16', '138000016', 'dept-1', false);
      store.add('s1n18-c17', '138000017', 'dept-1', false);
      store.add('s1n18-c18', '138000018', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(17);
      expect(store.search('dept-1').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0341 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_34200
     * @tc.name      testScenarioGrid0342
     * @tc.desc      Verify 18 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0342 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n18-c1', '13800001', 'dept-2', false);
      store.add('s2n18-c2', '13800002', 'dept-2', true);
      store.add('s2n18-c3', '13800003', 'dept-2', false);
      store.add('s2n18-c4', '13800004', 'dept-2', false);
      store.add('s2n18-c5', '13800005', 'dept-2', false);
      store.add('s2n18-c6', '13800006', 'dept-2', true);
      store.add('s2n18-c7', '13800007', 'dept-2', false);
      store.add('s2n18-c8', '13800008', 'dept-2', false);
      store.add('s2n18-c9', '13800009', 'dept-2', false);
      store.add('s2n18-c10', '138000010', 'dept-2', true);
      store.add('s2n18-c11', '138000011', 'dept-2', false);
      store.add('s2n18-c12', '138000012', 'dept-2', false);
      store.add('s2n18-c13', '138000013', 'dept-2', false);
      store.add('s2n18-c14', '138000014', 'dept-2', true);
      store.add('s2n18-c15', '138000015', 'dept-2', false);
      store.add('s2n18-c16', '138000016', 'dept-2', false);
      store.add('s2n18-c17', '138000017', 'dept-2', false);
      store.add('s2n18-c18', '138000018', 'dept-2', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(17);
      expect(store.search('dept-2').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0342 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_34300
     * @tc.name      testScenarioGrid0343
     * @tc.desc      Verify 18 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0343 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n18-c1', '13800001', 'dept-3', true);
      store.add('s3n18-c2', '13800002', 'dept-3', false);
      store.add('s3n18-c3', '13800003', 'dept-3', false);
      store.add('s3n18-c4', '13800004', 'dept-3', false);
      store.add('s3n18-c5', '13800005', 'dept-3', true);
      store.add('s3n18-c6', '13800006', 'dept-3', false);
      store.add('s3n18-c7', '13800007', 'dept-3', false);
      store.add('s3n18-c8', '13800008', 'dept-3', false);
      store.add('s3n18-c9', '13800009', 'dept-3', true);
      store.add('s3n18-c10', '138000010', 'dept-3', false);
      store.add('s3n18-c11', '138000011', 'dept-3', false);
      store.add('s3n18-c12', '138000012', 'dept-3', false);
      store.add('s3n18-c13', '138000013', 'dept-3', true);
      store.add('s3n18-c14', '138000014', 'dept-3', false);
      store.add('s3n18-c15', '138000015', 'dept-3', false);
      store.add('s3n18-c16', '138000016', 'dept-3', false);
      store.add('s3n18-c17', '138000017', 'dept-3', true);
      store.add('s3n18-c18', '138000018', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(17);
      expect(store.search('dept-3').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0343 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_34400
     * @tc.name      testScenarioGrid0344
     * @tc.desc      Verify 18 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0344 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n18-c1', '13800001', 'dept-4', false);
      store.add('s4n18-c2', '13800002', 'dept-4', false);
      store.add('s4n18-c3', '13800003', 'dept-4', false);
      store.add('s4n18-c4', '13800004', 'dept-4', true);
      store.add('s4n18-c5', '13800005', 'dept-4', false);
      store.add('s4n18-c6', '13800006', 'dept-4', false);
      store.add('s4n18-c7', '13800007', 'dept-4', false);
      store.add('s4n18-c8', '13800008', 'dept-4', true);
      store.add('s4n18-c9', '13800009', 'dept-4', false);
      store.add('s4n18-c10', '138000010', 'dept-4', false);
      store.add('s4n18-c11', '138000011', 'dept-4', false);
      store.add('s4n18-c12', '138000012', 'dept-4', true);
      store.add('s4n18-c13', '138000013', 'dept-4', false);
      store.add('s4n18-c14', '138000014', 'dept-4', false);
      store.add('s4n18-c15', '138000015', 'dept-4', false);
      store.add('s4n18-c16', '138000016', 'dept-4', true);
      store.add('s4n18-c17', '138000017', 'dept-4', false);
      store.add('s4n18-c18', '138000018', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(17);
      expect(store.search('dept-4').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0344 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_34500
     * @tc.name      testScenarioGrid0345
     * @tc.desc      Verify 18 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0345 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n18-c1', '13800001', 'dept-5', false);
      store.add('s5n18-c2', '13800002', 'dept-5', false);
      store.add('s5n18-c3', '13800003', 'dept-5', true);
      store.add('s5n18-c4', '13800004', 'dept-5', false);
      store.add('s5n18-c5', '13800005', 'dept-5', false);
      store.add('s5n18-c6', '13800006', 'dept-5', false);
      store.add('s5n18-c7', '13800007', 'dept-5', true);
      store.add('s5n18-c8', '13800008', 'dept-5', false);
      store.add('s5n18-c9', '13800009', 'dept-5', false);
      store.add('s5n18-c10', '138000010', 'dept-5', false);
      store.add('s5n18-c11', '138000011', 'dept-5', true);
      store.add('s5n18-c12', '138000012', 'dept-5', false);
      store.add('s5n18-c13', '138000013', 'dept-5', false);
      store.add('s5n18-c14', '138000014', 'dept-5', false);
      store.add('s5n18-c15', '138000015', 'dept-5', true);
      store.add('s5n18-c16', '138000016', 'dept-5', false);
      store.add('s5n18-c17', '138000017', 'dept-5', false);
      store.add('s5n18-c18', '138000018', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(17);
      expect(store.search('dept-5').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0345 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_34600
     * @tc.name      testScenarioGrid0346
     * @tc.desc      Verify 18 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0346 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n18-c1', '13800001', 'dept-6', false);
      store.add('s6n18-c2', '13800002', 'dept-6', true);
      store.add('s6n18-c3', '13800003', 'dept-6', false);
      store.add('s6n18-c4', '13800004', 'dept-6', false);
      store.add('s6n18-c5', '13800005', 'dept-6', false);
      store.add('s6n18-c6', '13800006', 'dept-6', true);
      store.add('s6n18-c7', '13800007', 'dept-6', false);
      store.add('s6n18-c8', '13800008', 'dept-6', false);
      store.add('s6n18-c9', '13800009', 'dept-6', false);
      store.add('s6n18-c10', '138000010', 'dept-6', true);
      store.add('s6n18-c11', '138000011', 'dept-6', false);
      store.add('s6n18-c12', '138000012', 'dept-6', false);
      store.add('s6n18-c13', '138000013', 'dept-6', false);
      store.add('s6n18-c14', '138000014', 'dept-6', true);
      store.add('s6n18-c15', '138000015', 'dept-6', false);
      store.add('s6n18-c16', '138000016', 'dept-6', false);
      store.add('s6n18-c17', '138000017', 'dept-6', false);
      store.add('s6n18-c18', '138000018', 'dept-6', true);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(17);
      expect(store.search('dept-6').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0346 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_34700
     * @tc.name      testScenarioGrid0347
     * @tc.desc      Verify 18 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0347 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n18-c1', '13800001', 'dept-7', true);
      store.add('s7n18-c2', '13800002', 'dept-7', false);
      store.add('s7n18-c3', '13800003', 'dept-7', false);
      store.add('s7n18-c4', '13800004', 'dept-7', false);
      store.add('s7n18-c5', '13800005', 'dept-7', true);
      store.add('s7n18-c6', '13800006', 'dept-7', false);
      store.add('s7n18-c7', '13800007', 'dept-7', false);
      store.add('s7n18-c8', '13800008', 'dept-7', false);
      store.add('s7n18-c9', '13800009', 'dept-7', true);
      store.add('s7n18-c10', '138000010', 'dept-7', false);
      store.add('s7n18-c11', '138000011', 'dept-7', false);
      store.add('s7n18-c12', '138000012', 'dept-7', false);
      store.add('s7n18-c13', '138000013', 'dept-7', true);
      store.add('s7n18-c14', '138000014', 'dept-7', false);
      store.add('s7n18-c15', '138000015', 'dept-7', false);
      store.add('s7n18-c16', '138000016', 'dept-7', false);
      store.add('s7n18-c17', '138000017', 'dept-7', true);
      store.add('s7n18-c18', '138000018', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(17);
      expect(store.search('dept-7').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0347 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_34800
     * @tc.name      testScenarioGrid0348
     * @tc.desc      Verify 18 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0348 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n18-c1', '13800001', 'dept-8', false);
      store.add('s8n18-c2', '13800002', 'dept-8', false);
      store.add('s8n18-c3', '13800003', 'dept-8', false);
      store.add('s8n18-c4', '13800004', 'dept-8', true);
      store.add('s8n18-c5', '13800005', 'dept-8', false);
      store.add('s8n18-c6', '13800006', 'dept-8', false);
      store.add('s8n18-c7', '13800007', 'dept-8', false);
      store.add('s8n18-c8', '13800008', 'dept-8', true);
      store.add('s8n18-c9', '13800009', 'dept-8', false);
      store.add('s8n18-c10', '138000010', 'dept-8', false);
      store.add('s8n18-c11', '138000011', 'dept-8', false);
      store.add('s8n18-c12', '138000012', 'dept-8', true);
      store.add('s8n18-c13', '138000013', 'dept-8', false);
      store.add('s8n18-c14', '138000014', 'dept-8', false);
      store.add('s8n18-c15', '138000015', 'dept-8', false);
      store.add('s8n18-c16', '138000016', 'dept-8', true);
      store.add('s8n18-c17', '138000017', 'dept-8', false);
      store.add('s8n18-c18', '138000018', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(17);
      expect(store.search('dept-8').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0348 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_34900
     * @tc.name      testScenarioGrid0349
     * @tc.desc      Verify 18 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0349 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n18-c1', '13800001', 'dept-9', false);
      store.add('s9n18-c2', '13800002', 'dept-9', false);
      store.add('s9n18-c3', '13800003', 'dept-9', true);
      store.add('s9n18-c4', '13800004', 'dept-9', false);
      store.add('s9n18-c5', '13800005', 'dept-9', false);
      store.add('s9n18-c6', '13800006', 'dept-9', false);
      store.add('s9n18-c7', '13800007', 'dept-9', true);
      store.add('s9n18-c8', '13800008', 'dept-9', false);
      store.add('s9n18-c9', '13800009', 'dept-9', false);
      store.add('s9n18-c10', '138000010', 'dept-9', false);
      store.add('s9n18-c11', '138000011', 'dept-9', true);
      store.add('s9n18-c12', '138000012', 'dept-9', false);
      store.add('s9n18-c13', '138000013', 'dept-9', false);
      store.add('s9n18-c14', '138000014', 'dept-9', false);
      store.add('s9n18-c15', '138000015', 'dept-9', true);
      store.add('s9n18-c16', '138000016', 'dept-9', false);
      store.add('s9n18-c17', '138000017', 'dept-9', false);
      store.add('s9n18-c18', '138000018', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(null);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(17);
      expect(store.search('dept-9').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0349 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_35000
     * @tc.name      testScenarioGrid0350
     * @tc.desc      Verify 18 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0350 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n18-c1', '13800001', 'dept-10', false);
      store.add('s10n18-c2', '13800002', 'dept-10', true);
      store.add('s10n18-c3', '13800003', 'dept-10', false);
      store.add('s10n18-c4', '13800004', 'dept-10', false);
      store.add('s10n18-c5', '13800005', 'dept-10', false);
      store.add('s10n18-c6', '13800006', 'dept-10', true);
      store.add('s10n18-c7', '13800007', 'dept-10', false);
      store.add('s10n18-c8', '13800008', 'dept-10', false);
      store.add('s10n18-c9', '13800009', 'dept-10', false);
      store.add('s10n18-c10', '138000010', 'dept-10', true);
      store.add('s10n18-c11', '138000011', 'dept-10', false);
      store.add('s10n18-c12', '138000012', 'dept-10', false);
      store.add('s10n18-c13', '138000013', 'dept-10', false);
      store.add('s10n18-c14', '138000014', 'dept-10', true);
      store.add('s10n18-c15', '138000015', 'dept-10', false);
      store.add('s10n18-c16', '138000016', 'dept-10', false);
      store.add('s10n18-c17', '138000017', 'dept-10', false);
      store.add('s10n18-c18', '138000018', 'dept-10', true);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(17);
      expect(store.search('dept-10').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0350 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_35100
     * @tc.name      testScenarioGrid0351
     * @tc.desc      Verify 18 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0351 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n18-c1', '13800001', 'dept-11', true);
      store.add('s11n18-c2', '13800002', 'dept-11', false);
      store.add('s11n18-c3', '13800003', 'dept-11', false);
      store.add('s11n18-c4', '13800004', 'dept-11', false);
      store.add('s11n18-c5', '13800005', 'dept-11', true);
      store.add('s11n18-c6', '13800006', 'dept-11', false);
      store.add('s11n18-c7', '13800007', 'dept-11', false);
      store.add('s11n18-c8', '13800008', 'dept-11', false);
      store.add('s11n18-c9', '13800009', 'dept-11', true);
      store.add('s11n18-c10', '138000010', 'dept-11', false);
      store.add('s11n18-c11', '138000011', 'dept-11', false);
      store.add('s11n18-c12', '138000012', 'dept-11', false);
      store.add('s11n18-c13', '138000013', 'dept-11', true);
      store.add('s11n18-c14', '138000014', 'dept-11', false);
      store.add('s11n18-c15', '138000015', 'dept-11', false);
      store.add('s11n18-c16', '138000016', 'dept-11', false);
      store.add('s11n18-c17', '138000017', 'dept-11', true);
      store.add('s11n18-c18', '138000018', 'dept-11', false);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(17);
      expect(store.search('dept-11').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0351 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_35200
     * @tc.name      testScenarioGrid0352
     * @tc.desc      Verify 18 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0352 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n18-c1', '13800001', 'dept-12', false);
      store.add('s12n18-c2', '13800002', 'dept-12', false);
      store.add('s12n18-c3', '13800003', 'dept-12', false);
      store.add('s12n18-c4', '13800004', 'dept-12', true);
      store.add('s12n18-c5', '13800005', 'dept-12', false);
      store.add('s12n18-c6', '13800006', 'dept-12', false);
      store.add('s12n18-c7', '13800007', 'dept-12', false);
      store.add('s12n18-c8', '13800008', 'dept-12', true);
      store.add('s12n18-c9', '13800009', 'dept-12', false);
      store.add('s12n18-c10', '138000010', 'dept-12', false);
      store.add('s12n18-c11', '138000011', 'dept-12', false);
      store.add('s12n18-c12', '138000012', 'dept-12', true);
      store.add('s12n18-c13', '138000013', 'dept-12', false);
      store.add('s12n18-c14', '138000014', 'dept-12', false);
      store.add('s12n18-c15', '138000015', 'dept-12', false);
      store.add('s12n18-c16', '138000016', 'dept-12', true);
      store.add('s12n18-c17', '138000017', 'dept-12', false);
      store.add('s12n18-c18', '138000018', 'dept-12', false);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(17);
      expect(store.search('dept-12').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0352 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_35300
     * @tc.name      testScenarioGrid0353
     * @tc.desc      Verify 18 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0353 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n18-c1', '13800001', 'dept-13', false);
      store.add('s13n18-c2', '13800002', 'dept-13', false);
      store.add('s13n18-c3', '13800003', 'dept-13', true);
      store.add('s13n18-c4', '13800004', 'dept-13', false);
      store.add('s13n18-c5', '13800005', 'dept-13', false);
      store.add('s13n18-c6', '13800006', 'dept-13', false);
      store.add('s13n18-c7', '13800007', 'dept-13', true);
      store.add('s13n18-c8', '13800008', 'dept-13', false);
      store.add('s13n18-c9', '13800009', 'dept-13', false);
      store.add('s13n18-c10', '138000010', 'dept-13', false);
      store.add('s13n18-c11', '138000011', 'dept-13', true);
      store.add('s13n18-c12', '138000012', 'dept-13', false);
      store.add('s13n18-c13', '138000013', 'dept-13', false);
      store.add('s13n18-c14', '138000014', 'dept-13', false);
      store.add('s13n18-c15', '138000015', 'dept-13', true);
      store.add('s13n18-c16', '138000016', 'dept-13', false);
      store.add('s13n18-c17', '138000017', 'dept-13', false);
      store.add('s13n18-c18', '138000018', 'dept-13', false);
      expect(store.remove(14)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(14) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(17);
      expect(store.search('dept-13').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0353 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_35400
     * @tc.name      testScenarioGrid0354
     * @tc.desc      Verify 18 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0354 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n18-c1', '13800001', 'dept-14', false);
      store.add('s14n18-c2', '13800002', 'dept-14', true);
      store.add('s14n18-c3', '13800003', 'dept-14', false);
      store.add('s14n18-c4', '13800004', 'dept-14', false);
      store.add('s14n18-c5', '13800005', 'dept-14', false);
      store.add('s14n18-c6', '13800006', 'dept-14', true);
      store.add('s14n18-c7', '13800007', 'dept-14', false);
      store.add('s14n18-c8', '13800008', 'dept-14', false);
      store.add('s14n18-c9', '13800009', 'dept-14', false);
      store.add('s14n18-c10', '138000010', 'dept-14', true);
      store.add('s14n18-c11', '138000011', 'dept-14', false);
      store.add('s14n18-c12', '138000012', 'dept-14', false);
      store.add('s14n18-c13', '138000013', 'dept-14', false);
      store.add('s14n18-c14', '138000014', 'dept-14', true);
      store.add('s14n18-c15', '138000015', 'dept-14', false);
      store.add('s14n18-c16', '138000016', 'dept-14', false);
      store.add('s14n18-c17', '138000017', 'dept-14', false);
      store.add('s14n18-c18', '138000018', 'dept-14', true);
      expect(store.remove(15)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(15) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(17);
      expect(store.search('dept-14').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0354 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_35500
     * @tc.name      testScenarioGrid0355
     * @tc.desc      Verify 18 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0355 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n18-c1', '13800001', 'dept-15', true);
      store.add('s15n18-c2', '13800002', 'dept-15', false);
      store.add('s15n18-c3', '13800003', 'dept-15', false);
      store.add('s15n18-c4', '13800004', 'dept-15', false);
      store.add('s15n18-c5', '13800005', 'dept-15', true);
      store.add('s15n18-c6', '13800006', 'dept-15', false);
      store.add('s15n18-c7', '13800007', 'dept-15', false);
      store.add('s15n18-c8', '13800008', 'dept-15', false);
      store.add('s15n18-c9', '13800009', 'dept-15', true);
      store.add('s15n18-c10', '138000010', 'dept-15', false);
      store.add('s15n18-c11', '138000011', 'dept-15', false);
      store.add('s15n18-c12', '138000012', 'dept-15', false);
      store.add('s15n18-c13', '138000013', 'dept-15', true);
      store.add('s15n18-c14', '138000014', 'dept-15', false);
      store.add('s15n18-c15', '138000015', 'dept-15', false);
      store.add('s15n18-c16', '138000016', 'dept-15', false);
      store.add('s15n18-c17', '138000017', 'dept-15', true);
      store.add('s15n18-c18', '138000018', 'dept-15', false);
      expect(store.remove(16)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(16) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(17);
      expect(store.search('dept-15').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0355 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_35600
     * @tc.name      testScenarioGrid0356
     * @tc.desc      Verify 18 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0356 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n18-c1', '13800001', 'dept-16', false);
      store.add('s16n18-c2', '13800002', 'dept-16', false);
      store.add('s16n18-c3', '13800003', 'dept-16', false);
      store.add('s16n18-c4', '13800004', 'dept-16', true);
      store.add('s16n18-c5', '13800005', 'dept-16', false);
      store.add('s16n18-c6', '13800006', 'dept-16', false);
      store.add('s16n18-c7', '13800007', 'dept-16', false);
      store.add('s16n18-c8', '13800008', 'dept-16', true);
      store.add('s16n18-c9', '13800009', 'dept-16', false);
      store.add('s16n18-c10', '138000010', 'dept-16', false);
      store.add('s16n18-c11', '138000011', 'dept-16', false);
      store.add('s16n18-c12', '138000012', 'dept-16', true);
      store.add('s16n18-c13', '138000013', 'dept-16', false);
      store.add('s16n18-c14', '138000014', 'dept-16', false);
      store.add('s16n18-c15', '138000015', 'dept-16', false);
      store.add('s16n18-c16', '138000016', 'dept-16', true);
      store.add('s16n18-c17', '138000017', 'dept-16', false);
      store.add('s16n18-c18', '138000018', 'dept-16', false);
      expect(store.remove(17)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(17) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(17);
      expect(store.search('dept-16').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0356 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_35700
     * @tc.name      testScenarioGrid0357
     * @tc.desc      Verify 18 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0357 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n18-c1', '13800001', 'dept-17', false);
      store.add('s17n18-c2', '13800002', 'dept-17', false);
      store.add('s17n18-c3', '13800003', 'dept-17', true);
      store.add('s17n18-c4', '13800004', 'dept-17', false);
      store.add('s17n18-c5', '13800005', 'dept-17', false);
      store.add('s17n18-c6', '13800006', 'dept-17', false);
      store.add('s17n18-c7', '13800007', 'dept-17', true);
      store.add('s17n18-c8', '13800008', 'dept-17', false);
      store.add('s17n18-c9', '13800009', 'dept-17', false);
      store.add('s17n18-c10', '138000010', 'dept-17', false);
      store.add('s17n18-c11', '138000011', 'dept-17', true);
      store.add('s17n18-c12', '138000012', 'dept-17', false);
      store.add('s17n18-c13', '138000013', 'dept-17', false);
      store.add('s17n18-c14', '138000014', 'dept-17', false);
      store.add('s17n18-c15', '138000015', 'dept-17', true);
      store.add('s17n18-c16', '138000016', 'dept-17', false);
      store.add('s17n18-c17', '138000017', 'dept-17', false);
      store.add('s17n18-c18', '138000018', 'dept-17', false);
      expect(store.remove(18)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(18) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(17);
      expect(store.search('dept-17').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0357 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_35800
     * @tc.name      testScenarioGrid0358
     * @tc.desc      Verify 18 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0358 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n18-c1', '13800001', 'dept-18', false);
      store.add('s18n18-c2', '13800002', 'dept-18', true);
      store.add('s18n18-c3', '13800003', 'dept-18', false);
      store.add('s18n18-c4', '13800004', 'dept-18', false);
      store.add('s18n18-c5', '13800005', 'dept-18', false);
      store.add('s18n18-c6', '13800006', 'dept-18', true);
      store.add('s18n18-c7', '13800007', 'dept-18', false);
      store.add('s18n18-c8', '13800008', 'dept-18', false);
      store.add('s18n18-c9', '13800009', 'dept-18', false);
      store.add('s18n18-c10', '138000010', 'dept-18', true);
      store.add('s18n18-c11', '138000011', 'dept-18', false);
      store.add('s18n18-c12', '138000012', 'dept-18', false);
      store.add('s18n18-c13', '138000013', 'dept-18', false);
      store.add('s18n18-c14', '138000014', 'dept-18', true);
      store.add('s18n18-c15', '138000015', 'dept-18', false);
      store.add('s18n18-c16', '138000016', 'dept-18', false);
      store.add('s18n18-c17', '138000017', 'dept-18', false);
      store.add('s18n18-c18', '138000018', 'dept-18', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(17);
      expect(store.search('dept-18').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0358 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_35900
     * @tc.name      testScenarioGrid0359
     * @tc.desc      Verify 18 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0359 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n18-c1', '13800001', 'dept-19', true);
      store.add('s19n18-c2', '13800002', 'dept-19', false);
      store.add('s19n18-c3', '13800003', 'dept-19', false);
      store.add('s19n18-c4', '13800004', 'dept-19', false);
      store.add('s19n18-c5', '13800005', 'dept-19', true);
      store.add('s19n18-c6', '13800006', 'dept-19', false);
      store.add('s19n18-c7', '13800007', 'dept-19', false);
      store.add('s19n18-c8', '13800008', 'dept-19', false);
      store.add('s19n18-c9', '13800009', 'dept-19', true);
      store.add('s19n18-c10', '138000010', 'dept-19', false);
      store.add('s19n18-c11', '138000011', 'dept-19', false);
      store.add('s19n18-c12', '138000012', 'dept-19', false);
      store.add('s19n18-c13', '138000013', 'dept-19', true);
      store.add('s19n18-c14', '138000014', 'dept-19', false);
      store.add('s19n18-c15', '138000015', 'dept-19', false);
      store.add('s19n18-c16', '138000016', 'dept-19', false);
      store.add('s19n18-c17', '138000017', 'dept-19', true);
      store.add('s19n18-c18', '138000018', 'dept-19', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(17);
      expect(store.search('dept-19').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0359 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP9_36000
     * @tc.name      testScenarioGrid0360
     * @tc.desc      Verify 18 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0360 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n18-c1', '13800001', 'dept-20', false);
      store.add('s20n18-c2', '13800002', 'dept-20', false);
      store.add('s20n18-c3', '13800003', 'dept-20', false);
      store.add('s20n18-c4', '13800004', 'dept-20', true);
      store.add('s20n18-c5', '13800005', 'dept-20', false);
      store.add('s20n18-c6', '13800006', 'dept-20', false);
      store.add('s20n18-c7', '13800007', 'dept-20', false);
      store.add('s20n18-c8', '13800008', 'dept-20', true);
      store.add('s20n18-c9', '13800009', 'dept-20', false);
      store.add('s20n18-c10', '138000010', 'dept-20', false);
      store.add('s20n18-c11', '138000011', 'dept-20', false);
      store.add('s20n18-c12', '138000012', 'dept-20', true);
      store.add('s20n18-c13', '138000013', 'dept-20', false);
      store.add('s20n18-c14', '138000014', 'dept-20', false);
      store.add('s20n18-c15', '138000015', 'dept-20', false);
      store.add('s20n18-c16', '138000016', 'dept-20', true);
      store.add('s20n18-c17', '138000017', 'dept-20', false);
      store.add('s20n18-c18', '138000018', 'dept-20', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(17);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(17);
      expect(store.search('dept-20').length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0360 end');
    })

  })
}
