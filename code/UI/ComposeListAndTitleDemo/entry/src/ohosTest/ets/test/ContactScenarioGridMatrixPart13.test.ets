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

export default function ContactScenarioGridMatrixPart13Test(): void {
  describe('ContactScenarioGridMatrixPart13', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_48100
     * @tc.name      testScenarioGrid0481
     * @tc.desc      Verify 25 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0481 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n25-c1', '13800001', 'dept-1', false);
      store.add('s1n25-c2', '13800002', 'dept-1', false);
      store.add('s1n25-c3', '13800003', 'dept-1', true);
      store.add('s1n25-c4', '13800004', 'dept-1', false);
      store.add('s1n25-c5', '13800005', 'dept-1', false);
      store.add('s1n25-c6', '13800006', 'dept-1', false);
      store.add('s1n25-c7', '13800007', 'dept-1', true);
      store.add('s1n25-c8', '13800008', 'dept-1', false);
      store.add('s1n25-c9', '13800009', 'dept-1', false);
      store.add('s1n25-c10', '138000010', 'dept-1', false);
      store.add('s1n25-c11', '138000011', 'dept-1', true);
      store.add('s1n25-c12', '138000012', 'dept-1', false);
      store.add('s1n25-c13', '138000013', 'dept-1', false);
      store.add('s1n25-c14', '138000014', 'dept-1', false);
      store.add('s1n25-c15', '138000015', 'dept-1', true);
      store.add('s1n25-c16', '138000016', 'dept-1', false);
      store.add('s1n25-c17', '138000017', 'dept-1', false);
      store.add('s1n25-c18', '138000018', 'dept-1', false);
      store.add('s1n25-c19', '138000019', 'dept-1', true);
      store.add('s1n25-c20', '138000020', 'dept-1', false);
      store.add('s1n25-c21', '138000021', 'dept-1', false);
      store.add('s1n25-c22', '138000022', 'dept-1', false);
      store.add('s1n25-c23', '138000023', 'dept-1', true);
      store.add('s1n25-c24', '138000024', 'dept-1', false);
      store.add('s1n25-c25', '138000025', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(24);
      expect(store.search('dept-1').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0481 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_48200
     * @tc.name      testScenarioGrid0482
     * @tc.desc      Verify 25 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0482 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n25-c1', '13800001', 'dept-2', false);
      store.add('s2n25-c2', '13800002', 'dept-2', true);
      store.add('s2n25-c3', '13800003', 'dept-2', false);
      store.add('s2n25-c4', '13800004', 'dept-2', false);
      store.add('s2n25-c5', '13800005', 'dept-2', false);
      store.add('s2n25-c6', '13800006', 'dept-2', true);
      store.add('s2n25-c7', '13800007', 'dept-2', false);
      store.add('s2n25-c8', '13800008', 'dept-2', false);
      store.add('s2n25-c9', '13800009', 'dept-2', false);
      store.add('s2n25-c10', '138000010', 'dept-2', true);
      store.add('s2n25-c11', '138000011', 'dept-2', false);
      store.add('s2n25-c12', '138000012', 'dept-2', false);
      store.add('s2n25-c13', '138000013', 'dept-2', false);
      store.add('s2n25-c14', '138000014', 'dept-2', true);
      store.add('s2n25-c15', '138000015', 'dept-2', false);
      store.add('s2n25-c16', '138000016', 'dept-2', false);
      store.add('s2n25-c17', '138000017', 'dept-2', false);
      store.add('s2n25-c18', '138000018', 'dept-2', true);
      store.add('s2n25-c19', '138000019', 'dept-2', false);
      store.add('s2n25-c20', '138000020', 'dept-2', false);
      store.add('s2n25-c21', '138000021', 'dept-2', false);
      store.add('s2n25-c22', '138000022', 'dept-2', true);
      store.add('s2n25-c23', '138000023', 'dept-2', false);
      store.add('s2n25-c24', '138000024', 'dept-2', false);
      store.add('s2n25-c25', '138000025', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(24);
      expect(store.search('dept-2').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0482 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_48300
     * @tc.name      testScenarioGrid0483
     * @tc.desc      Verify 25 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0483 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n25-c1', '13800001', 'dept-3', true);
      store.add('s3n25-c2', '13800002', 'dept-3', false);
      store.add('s3n25-c3', '13800003', 'dept-3', false);
      store.add('s3n25-c4', '13800004', 'dept-3', false);
      store.add('s3n25-c5', '13800005', 'dept-3', true);
      store.add('s3n25-c6', '13800006', 'dept-3', false);
      store.add('s3n25-c7', '13800007', 'dept-3', false);
      store.add('s3n25-c8', '13800008', 'dept-3', false);
      store.add('s3n25-c9', '13800009', 'dept-3', true);
      store.add('s3n25-c10', '138000010', 'dept-3', false);
      store.add('s3n25-c11', '138000011', 'dept-3', false);
      store.add('s3n25-c12', '138000012', 'dept-3', false);
      store.add('s3n25-c13', '138000013', 'dept-3', true);
      store.add('s3n25-c14', '138000014', 'dept-3', false);
      store.add('s3n25-c15', '138000015', 'dept-3', false);
      store.add('s3n25-c16', '138000016', 'dept-3', false);
      store.add('s3n25-c17', '138000017', 'dept-3', true);
      store.add('s3n25-c18', '138000018', 'dept-3', false);
      store.add('s3n25-c19', '138000019', 'dept-3', false);
      store.add('s3n25-c20', '138000020', 'dept-3', false);
      store.add('s3n25-c21', '138000021', 'dept-3', true);
      store.add('s3n25-c22', '138000022', 'dept-3', false);
      store.add('s3n25-c23', '138000023', 'dept-3', false);
      store.add('s3n25-c24', '138000024', 'dept-3', false);
      store.add('s3n25-c25', '138000025', 'dept-3', true);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(8);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(24);
      expect(store.search('dept-3').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0483 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_48400
     * @tc.name      testScenarioGrid0484
     * @tc.desc      Verify 25 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0484 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n25-c1', '13800001', 'dept-4', false);
      store.add('s4n25-c2', '13800002', 'dept-4', false);
      store.add('s4n25-c3', '13800003', 'dept-4', false);
      store.add('s4n25-c4', '13800004', 'dept-4', true);
      store.add('s4n25-c5', '13800005', 'dept-4', false);
      store.add('s4n25-c6', '13800006', 'dept-4', false);
      store.add('s4n25-c7', '13800007', 'dept-4', false);
      store.add('s4n25-c8', '13800008', 'dept-4', true);
      store.add('s4n25-c9', '13800009', 'dept-4', false);
      store.add('s4n25-c10', '138000010', 'dept-4', false);
      store.add('s4n25-c11', '138000011', 'dept-4', false);
      store.add('s4n25-c12', '138000012', 'dept-4', true);
      store.add('s4n25-c13', '138000013', 'dept-4', false);
      store.add('s4n25-c14', '138000014', 'dept-4', false);
      store.add('s4n25-c15', '138000015', 'dept-4', false);
      store.add('s4n25-c16', '138000016', 'dept-4', true);
      store.add('s4n25-c17', '138000017', 'dept-4', false);
      store.add('s4n25-c18', '138000018', 'dept-4', false);
      store.add('s4n25-c19', '138000019', 'dept-4', false);
      store.add('s4n25-c20', '138000020', 'dept-4', true);
      store.add('s4n25-c21', '138000021', 'dept-4', false);
      store.add('s4n25-c22', '138000022', 'dept-4', false);
      store.add('s4n25-c23', '138000023', 'dept-4', false);
      store.add('s4n25-c24', '138000024', 'dept-4', true);
      store.add('s4n25-c25', '138000025', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(24);
      expect(store.search('dept-4').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0484 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_48500
     * @tc.name      testScenarioGrid0485
     * @tc.desc      Verify 25 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0485 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n25-c1', '13800001', 'dept-5', false);
      store.add('s5n25-c2', '13800002', 'dept-5', false);
      store.add('s5n25-c3', '13800003', 'dept-5', true);
      store.add('s5n25-c4', '13800004', 'dept-5', false);
      store.add('s5n25-c5', '13800005', 'dept-5', false);
      store.add('s5n25-c6', '13800006', 'dept-5', false);
      store.add('s5n25-c7', '13800007', 'dept-5', true);
      store.add('s5n25-c8', '13800008', 'dept-5', false);
      store.add('s5n25-c9', '13800009', 'dept-5', false);
      store.add('s5n25-c10', '138000010', 'dept-5', false);
      store.add('s5n25-c11', '138000011', 'dept-5', true);
      store.add('s5n25-c12', '138000012', 'dept-5', false);
      store.add('s5n25-c13', '138000013', 'dept-5', false);
      store.add('s5n25-c14', '138000014', 'dept-5', false);
      store.add('s5n25-c15', '138000015', 'dept-5', true);
      store.add('s5n25-c16', '138000016', 'dept-5', false);
      store.add('s5n25-c17', '138000017', 'dept-5', false);
      store.add('s5n25-c18', '138000018', 'dept-5', false);
      store.add('s5n25-c19', '138000019', 'dept-5', true);
      store.add('s5n25-c20', '138000020', 'dept-5', false);
      store.add('s5n25-c21', '138000021', 'dept-5', false);
      store.add('s5n25-c22', '138000022', 'dept-5', false);
      store.add('s5n25-c23', '138000023', 'dept-5', true);
      store.add('s5n25-c24', '138000024', 'dept-5', false);
      store.add('s5n25-c25', '138000025', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(24);
      expect(store.search('dept-5').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0485 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_48600
     * @tc.name      testScenarioGrid0486
     * @tc.desc      Verify 25 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0486 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n25-c1', '13800001', 'dept-6', false);
      store.add('s6n25-c2', '13800002', 'dept-6', true);
      store.add('s6n25-c3', '13800003', 'dept-6', false);
      store.add('s6n25-c4', '13800004', 'dept-6', false);
      store.add('s6n25-c5', '13800005', 'dept-6', false);
      store.add('s6n25-c6', '13800006', 'dept-6', true);
      store.add('s6n25-c7', '13800007', 'dept-6', false);
      store.add('s6n25-c8', '13800008', 'dept-6', false);
      store.add('s6n25-c9', '13800009', 'dept-6', false);
      store.add('s6n25-c10', '138000010', 'dept-6', true);
      store.add('s6n25-c11', '138000011', 'dept-6', false);
      store.add('s6n25-c12', '138000012', 'dept-6', false);
      store.add('s6n25-c13', '138000013', 'dept-6', false);
      store.add('s6n25-c14', '138000014', 'dept-6', true);
      store.add('s6n25-c15', '138000015', 'dept-6', false);
      store.add('s6n25-c16', '138000016', 'dept-6', false);
      store.add('s6n25-c17', '138000017', 'dept-6', false);
      store.add('s6n25-c18', '138000018', 'dept-6', true);
      store.add('s6n25-c19', '138000019', 'dept-6', false);
      store.add('s6n25-c20', '138000020', 'dept-6', false);
      store.add('s6n25-c21', '138000021', 'dept-6', false);
      store.add('s6n25-c22', '138000022', 'dept-6', true);
      store.add('s6n25-c23', '138000023', 'dept-6', false);
      store.add('s6n25-c24', '138000024', 'dept-6', false);
      store.add('s6n25-c25', '138000025', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(19)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(24);
      expect(store.search('dept-6').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0486 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_48700
     * @tc.name      testScenarioGrid0487
     * @tc.desc      Verify 25 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0487 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n25-c1', '13800001', 'dept-7', true);
      store.add('s7n25-c2', '13800002', 'dept-7', false);
      store.add('s7n25-c3', '13800003', 'dept-7', false);
      store.add('s7n25-c4', '13800004', 'dept-7', false);
      store.add('s7n25-c5', '13800005', 'dept-7', true);
      store.add('s7n25-c6', '13800006', 'dept-7', false);
      store.add('s7n25-c7', '13800007', 'dept-7', false);
      store.add('s7n25-c8', '13800008', 'dept-7', false);
      store.add('s7n25-c9', '13800009', 'dept-7', true);
      store.add('s7n25-c10', '138000010', 'dept-7', false);
      store.add('s7n25-c11', '138000011', 'dept-7', false);
      store.add('s7n25-c12', '138000012', 'dept-7', false);
      store.add('s7n25-c13', '138000013', 'dept-7', true);
      store.add('s7n25-c14', '138000014', 'dept-7', false);
      store.add('s7n25-c15', '138000015', 'dept-7', false);
      store.add('s7n25-c16', '138000016', 'dept-7', false);
      store.add('s7n25-c17', '138000017', 'dept-7', true);
      store.add('s7n25-c18', '138000018', 'dept-7', false);
      store.add('s7n25-c19', '138000019', 'dept-7', false);
      store.add('s7n25-c20', '138000020', 'dept-7', false);
      store.add('s7n25-c21', '138000021', 'dept-7', true);
      store.add('s7n25-c22', '138000022', 'dept-7', false);
      store.add('s7n25-c23', '138000023', 'dept-7', false);
      store.add('s7n25-c24', '138000024', 'dept-7', false);
      store.add('s7n25-c25', '138000025', 'dept-7', true);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(22)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(8);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(24);
      expect(store.search('dept-7').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0487 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_48800
     * @tc.name      testScenarioGrid0488
     * @tc.desc      Verify 25 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0488 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n25-c1', '13800001', 'dept-8', false);
      store.add('s8n25-c2', '13800002', 'dept-8', false);
      store.add('s8n25-c3', '13800003', 'dept-8', false);
      store.add('s8n25-c4', '13800004', 'dept-8', true);
      store.add('s8n25-c5', '13800005', 'dept-8', false);
      store.add('s8n25-c6', '13800006', 'dept-8', false);
      store.add('s8n25-c7', '13800007', 'dept-8', false);
      store.add('s8n25-c8', '13800008', 'dept-8', true);
      store.add('s8n25-c9', '13800009', 'dept-8', false);
      store.add('s8n25-c10', '138000010', 'dept-8', false);
      store.add('s8n25-c11', '138000011', 'dept-8', false);
      store.add('s8n25-c12', '138000012', 'dept-8', true);
      store.add('s8n25-c13', '138000013', 'dept-8', false);
      store.add('s8n25-c14', '138000014', 'dept-8', false);
      store.add('s8n25-c15', '138000015', 'dept-8', false);
      store.add('s8n25-c16', '138000016', 'dept-8', true);
      store.add('s8n25-c17', '138000017', 'dept-8', false);
      store.add('s8n25-c18', '138000018', 'dept-8', false);
      store.add('s8n25-c19', '138000019', 'dept-8', false);
      store.add('s8n25-c20', '138000020', 'dept-8', true);
      store.add('s8n25-c21', '138000021', 'dept-8', false);
      store.add('s8n25-c22', '138000022', 'dept-8', false);
      store.add('s8n25-c23', '138000023', 'dept-8', false);
      store.add('s8n25-c24', '138000024', 'dept-8', true);
      store.add('s8n25-c25', '138000025', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(25)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(24);
      expect(store.search('dept-8').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0488 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_48900
     * @tc.name      testScenarioGrid0489
     * @tc.desc      Verify 25 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0489 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n25-c1', '13800001', 'dept-9', false);
      store.add('s9n25-c2', '13800002', 'dept-9', false);
      store.add('s9n25-c3', '13800003', 'dept-9', true);
      store.add('s9n25-c4', '13800004', 'dept-9', false);
      store.add('s9n25-c5', '13800005', 'dept-9', false);
      store.add('s9n25-c6', '13800006', 'dept-9', false);
      store.add('s9n25-c7', '13800007', 'dept-9', true);
      store.add('s9n25-c8', '13800008', 'dept-9', false);
      store.add('s9n25-c9', '13800009', 'dept-9', false);
      store.add('s9n25-c10', '138000010', 'dept-9', false);
      store.add('s9n25-c11', '138000011', 'dept-9', true);
      store.add('s9n25-c12', '138000012', 'dept-9', false);
      store.add('s9n25-c13', '138000013', 'dept-9', false);
      store.add('s9n25-c14', '138000014', 'dept-9', false);
      store.add('s9n25-c15', '138000015', 'dept-9', true);
      store.add('s9n25-c16', '138000016', 'dept-9', false);
      store.add('s9n25-c17', '138000017', 'dept-9', false);
      store.add('s9n25-c18', '138000018', 'dept-9', false);
      store.add('s9n25-c19', '138000019', 'dept-9', true);
      store.add('s9n25-c20', '138000020', 'dept-9', false);
      store.add('s9n25-c21', '138000021', 'dept-9', false);
      store.add('s9n25-c22', '138000022', 'dept-9', false);
      store.add('s9n25-c23', '138000023', 'dept-9', true);
      store.add('s9n25-c24', '138000024', 'dept-9', false);
      store.add('s9n25-c25', '138000025', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(false);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(24);
      expect(store.search('dept-9').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0489 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_49000
     * @tc.name      testScenarioGrid0490
     * @tc.desc      Verify 25 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0490 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n25-c1', '13800001', 'dept-10', false);
      store.add('s10n25-c2', '13800002', 'dept-10', true);
      store.add('s10n25-c3', '13800003', 'dept-10', false);
      store.add('s10n25-c4', '13800004', 'dept-10', false);
      store.add('s10n25-c5', '13800005', 'dept-10', false);
      store.add('s10n25-c6', '13800006', 'dept-10', true);
      store.add('s10n25-c7', '13800007', 'dept-10', false);
      store.add('s10n25-c8', '13800008', 'dept-10', false);
      store.add('s10n25-c9', '13800009', 'dept-10', false);
      store.add('s10n25-c10', '138000010', 'dept-10', true);
      store.add('s10n25-c11', '138000011', 'dept-10', false);
      store.add('s10n25-c12', '138000012', 'dept-10', false);
      store.add('s10n25-c13', '138000013', 'dept-10', false);
      store.add('s10n25-c14', '138000014', 'dept-10', true);
      store.add('s10n25-c15', '138000015', 'dept-10', false);
      store.add('s10n25-c16', '138000016', 'dept-10', false);
      store.add('s10n25-c17', '138000017', 'dept-10', false);
      store.add('s10n25-c18', '138000018', 'dept-10', true);
      store.add('s10n25-c19', '138000019', 'dept-10', false);
      store.add('s10n25-c20', '138000020', 'dept-10', false);
      store.add('s10n25-c21', '138000021', 'dept-10', false);
      store.add('s10n25-c22', '138000022', 'dept-10', true);
      store.add('s10n25-c23', '138000023', 'dept-10', false);
      store.add('s10n25-c24', '138000024', 'dept-10', false);
      store.add('s10n25-c25', '138000025', 'dept-10', false);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(false);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(24);
      expect(store.search('dept-10').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0490 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_49100
     * @tc.name      testScenarioGrid0491
     * @tc.desc      Verify 25 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0491 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n25-c1', '13800001', 'dept-11', true);
      store.add('s11n25-c2', '13800002', 'dept-11', false);
      store.add('s11n25-c3', '13800003', 'dept-11', false);
      store.add('s11n25-c4', '13800004', 'dept-11', false);
      store.add('s11n25-c5', '13800005', 'dept-11', true);
      store.add('s11n25-c6', '13800006', 'dept-11', false);
      store.add('s11n25-c7', '13800007', 'dept-11', false);
      store.add('s11n25-c8', '13800008', 'dept-11', false);
      store.add('s11n25-c9', '13800009', 'dept-11', true);
      store.add('s11n25-c10', '138000010', 'dept-11', false);
      store.add('s11n25-c11', '138000011', 'dept-11', false);
      store.add('s11n25-c12', '138000012', 'dept-11', false);
      store.add('s11n25-c13', '138000013', 'dept-11', true);
      store.add('s11n25-c14', '138000014', 'dept-11', false);
      store.add('s11n25-c15', '138000015', 'dept-11', false);
      store.add('s11n25-c16', '138000016', 'dept-11', false);
      store.add('s11n25-c17', '138000017', 'dept-11', true);
      store.add('s11n25-c18', '138000018', 'dept-11', false);
      store.add('s11n25-c19', '138000019', 'dept-11', false);
      store.add('s11n25-c20', '138000020', 'dept-11', false);
      store.add('s11n25-c21', '138000021', 'dept-11', true);
      store.add('s11n25-c22', '138000022', 'dept-11', false);
      store.add('s11n25-c23', '138000023', 'dept-11', false);
      store.add('s11n25-c24', '138000024', 'dept-11', false);
      store.add('s11n25-c25', '138000025', 'dept-11', true);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(false);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(24);
      expect(store.search('dept-11').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0491 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_49200
     * @tc.name      testScenarioGrid0492
     * @tc.desc      Verify 25 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0492 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n25-c1', '13800001', 'dept-12', false);
      store.add('s12n25-c2', '13800002', 'dept-12', false);
      store.add('s12n25-c3', '13800003', 'dept-12', false);
      store.add('s12n25-c4', '13800004', 'dept-12', true);
      store.add('s12n25-c5', '13800005', 'dept-12', false);
      store.add('s12n25-c6', '13800006', 'dept-12', false);
      store.add('s12n25-c7', '13800007', 'dept-12', false);
      store.add('s12n25-c8', '13800008', 'dept-12', true);
      store.add('s12n25-c9', '13800009', 'dept-12', false);
      store.add('s12n25-c10', '138000010', 'dept-12', false);
      store.add('s12n25-c11', '138000011', 'dept-12', false);
      store.add('s12n25-c12', '138000012', 'dept-12', true);
      store.add('s12n25-c13', '138000013', 'dept-12', false);
      store.add('s12n25-c14', '138000014', 'dept-12', false);
      store.add('s12n25-c15', '138000015', 'dept-12', false);
      store.add('s12n25-c16', '138000016', 'dept-12', true);
      store.add('s12n25-c17', '138000017', 'dept-12', false);
      store.add('s12n25-c18', '138000018', 'dept-12', false);
      store.add('s12n25-c19', '138000019', 'dept-12', false);
      store.add('s12n25-c20', '138000020', 'dept-12', true);
      store.add('s12n25-c21', '138000021', 'dept-12', false);
      store.add('s12n25-c22', '138000022', 'dept-12', false);
      store.add('s12n25-c23', '138000023', 'dept-12', false);
      store.add('s12n25-c24', '138000024', 'dept-12', true);
      store.add('s12n25-c25', '138000025', 'dept-12', false);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(12)).assertEqual(false);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(24);
      expect(store.search('dept-12').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0492 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_49300
     * @tc.name      testScenarioGrid0493
     * @tc.desc      Verify 25 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0493 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n25-c1', '13800001', 'dept-13', false);
      store.add('s13n25-c2', '13800002', 'dept-13', false);
      store.add('s13n25-c3', '13800003', 'dept-13', true);
      store.add('s13n25-c4', '13800004', 'dept-13', false);
      store.add('s13n25-c5', '13800005', 'dept-13', false);
      store.add('s13n25-c6', '13800006', 'dept-13', false);
      store.add('s13n25-c7', '13800007', 'dept-13', true);
      store.add('s13n25-c8', '13800008', 'dept-13', false);
      store.add('s13n25-c9', '13800009', 'dept-13', false);
      store.add('s13n25-c10', '138000010', 'dept-13', false);
      store.add('s13n25-c11', '138000011', 'dept-13', true);
      store.add('s13n25-c12', '138000012', 'dept-13', false);
      store.add('s13n25-c13', '138000013', 'dept-13', false);
      store.add('s13n25-c14', '138000014', 'dept-13', false);
      store.add('s13n25-c15', '138000015', 'dept-13', true);
      store.add('s13n25-c16', '138000016', 'dept-13', false);
      store.add('s13n25-c17', '138000017', 'dept-13', false);
      store.add('s13n25-c18', '138000018', 'dept-13', false);
      store.add('s13n25-c19', '138000019', 'dept-13', true);
      store.add('s13n25-c20', '138000020', 'dept-13', false);
      store.add('s13n25-c21', '138000021', 'dept-13', false);
      store.add('s13n25-c22', '138000022', 'dept-13', false);
      store.add('s13n25-c23', '138000023', 'dept-13', true);
      store.add('s13n25-c24', '138000024', 'dept-13', false);
      store.add('s13n25-c25', '138000025', 'dept-13', false);
      expect(store.remove(14)).assertEqual(true);
      expect(store.toggleOnline(15)).assertEqual(false);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(14) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(24);
      expect(store.search('dept-13').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0493 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_49400
     * @tc.name      testScenarioGrid0494
     * @tc.desc      Verify 25 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0494 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n25-c1', '13800001', 'dept-14', false);
      store.add('s14n25-c2', '13800002', 'dept-14', true);
      store.add('s14n25-c3', '13800003', 'dept-14', false);
      store.add('s14n25-c4', '13800004', 'dept-14', false);
      store.add('s14n25-c5', '13800005', 'dept-14', false);
      store.add('s14n25-c6', '13800006', 'dept-14', true);
      store.add('s14n25-c7', '13800007', 'dept-14', false);
      store.add('s14n25-c8', '13800008', 'dept-14', false);
      store.add('s14n25-c9', '13800009', 'dept-14', false);
      store.add('s14n25-c10', '138000010', 'dept-14', true);
      store.add('s14n25-c11', '138000011', 'dept-14', false);
      store.add('s14n25-c12', '138000012', 'dept-14', false);
      store.add('s14n25-c13', '138000013', 'dept-14', false);
      store.add('s14n25-c14', '138000014', 'dept-14', true);
      store.add('s14n25-c15', '138000015', 'dept-14', false);
      store.add('s14n25-c16', '138000016', 'dept-14', false);
      store.add('s14n25-c17', '138000017', 'dept-14', false);
      store.add('s14n25-c18', '138000018', 'dept-14', true);
      store.add('s14n25-c19', '138000019', 'dept-14', false);
      store.add('s14n25-c20', '138000020', 'dept-14', false);
      store.add('s14n25-c21', '138000021', 'dept-14', false);
      store.add('s14n25-c22', '138000022', 'dept-14', true);
      store.add('s14n25-c23', '138000023', 'dept-14', false);
      store.add('s14n25-c24', '138000024', 'dept-14', false);
      store.add('s14n25-c25', '138000025', 'dept-14', false);
      expect(store.remove(15)).assertEqual(true);
      expect(store.toggleOnline(18)).assertEqual(false);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(15) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(24);
      expect(store.search('dept-14').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0494 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_49500
     * @tc.name      testScenarioGrid0495
     * @tc.desc      Verify 25 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0495 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n25-c1', '13800001', 'dept-15', true);
      store.add('s15n25-c2', '13800002', 'dept-15', false);
      store.add('s15n25-c3', '13800003', 'dept-15', false);
      store.add('s15n25-c4', '13800004', 'dept-15', false);
      store.add('s15n25-c5', '13800005', 'dept-15', true);
      store.add('s15n25-c6', '13800006', 'dept-15', false);
      store.add('s15n25-c7', '13800007', 'dept-15', false);
      store.add('s15n25-c8', '13800008', 'dept-15', false);
      store.add('s15n25-c9', '13800009', 'dept-15', true);
      store.add('s15n25-c10', '138000010', 'dept-15', false);
      store.add('s15n25-c11', '138000011', 'dept-15', false);
      store.add('s15n25-c12', '138000012', 'dept-15', false);
      store.add('s15n25-c13', '138000013', 'dept-15', true);
      store.add('s15n25-c14', '138000014', 'dept-15', false);
      store.add('s15n25-c15', '138000015', 'dept-15', false);
      store.add('s15n25-c16', '138000016', 'dept-15', false);
      store.add('s15n25-c17', '138000017', 'dept-15', true);
      store.add('s15n25-c18', '138000018', 'dept-15', false);
      store.add('s15n25-c19', '138000019', 'dept-15', false);
      store.add('s15n25-c20', '138000020', 'dept-15', false);
      store.add('s15n25-c21', '138000021', 'dept-15', true);
      store.add('s15n25-c22', '138000022', 'dept-15', false);
      store.add('s15n25-c23', '138000023', 'dept-15', false);
      store.add('s15n25-c24', '138000024', 'dept-15', false);
      store.add('s15n25-c25', '138000025', 'dept-15', true);
      expect(store.remove(16)).assertEqual(true);
      expect(store.toggleOnline(21)).assertEqual(false);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(16) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(24);
      expect(store.search('dept-15').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0495 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_49600
     * @tc.name      testScenarioGrid0496
     * @tc.desc      Verify 25 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0496 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n25-c1', '13800001', 'dept-16', false);
      store.add('s16n25-c2', '13800002', 'dept-16', false);
      store.add('s16n25-c3', '13800003', 'dept-16', false);
      store.add('s16n25-c4', '13800004', 'dept-16', true);
      store.add('s16n25-c5', '13800005', 'dept-16', false);
      store.add('s16n25-c6', '13800006', 'dept-16', false);
      store.add('s16n25-c7', '13800007', 'dept-16', false);
      store.add('s16n25-c8', '13800008', 'dept-16', true);
      store.add('s16n25-c9', '13800009', 'dept-16', false);
      store.add('s16n25-c10', '138000010', 'dept-16', false);
      store.add('s16n25-c11', '138000011', 'dept-16', false);
      store.add('s16n25-c12', '138000012', 'dept-16', true);
      store.add('s16n25-c13', '138000013', 'dept-16', false);
      store.add('s16n25-c14', '138000014', 'dept-16', false);
      store.add('s16n25-c15', '138000015', 'dept-16', false);
      store.add('s16n25-c16', '138000016', 'dept-16', true);
      store.add('s16n25-c17', '138000017', 'dept-16', false);
      store.add('s16n25-c18', '138000018', 'dept-16', false);
      store.add('s16n25-c19', '138000019', 'dept-16', false);
      store.add('s16n25-c20', '138000020', 'dept-16', true);
      store.add('s16n25-c21', '138000021', 'dept-16', false);
      store.add('s16n25-c22', '138000022', 'dept-16', false);
      store.add('s16n25-c23', '138000023', 'dept-16', false);
      store.add('s16n25-c24', '138000024', 'dept-16', true);
      store.add('s16n25-c25', '138000025', 'dept-16', false);
      expect(store.remove(17)).assertEqual(true);
      expect(store.toggleOnline(24)).assertEqual(false);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(17) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(24);
      expect(store.search('dept-16').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0496 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_49700
     * @tc.name      testScenarioGrid0497
     * @tc.desc      Verify 25 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0497 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n25-c1', '13800001', 'dept-17', false);
      store.add('s17n25-c2', '13800002', 'dept-17', false);
      store.add('s17n25-c3', '13800003', 'dept-17', true);
      store.add('s17n25-c4', '13800004', 'dept-17', false);
      store.add('s17n25-c5', '13800005', 'dept-17', false);
      store.add('s17n25-c6', '13800006', 'dept-17', false);
      store.add('s17n25-c7', '13800007', 'dept-17', true);
      store.add('s17n25-c8', '13800008', 'dept-17', false);
      store.add('s17n25-c9', '13800009', 'dept-17', false);
      store.add('s17n25-c10', '138000010', 'dept-17', false);
      store.add('s17n25-c11', '138000011', 'dept-17', true);
      store.add('s17n25-c12', '138000012', 'dept-17', false);
      store.add('s17n25-c13', '138000013', 'dept-17', false);
      store.add('s17n25-c14', '138000014', 'dept-17', false);
      store.add('s17n25-c15', '138000015', 'dept-17', true);
      store.add('s17n25-c16', '138000016', 'dept-17', false);
      store.add('s17n25-c17', '138000017', 'dept-17', false);
      store.add('s17n25-c18', '138000018', 'dept-17', false);
      store.add('s17n25-c19', '138000019', 'dept-17', true);
      store.add('s17n25-c20', '138000020', 'dept-17', false);
      store.add('s17n25-c21', '138000021', 'dept-17', false);
      store.add('s17n25-c22', '138000022', 'dept-17', false);
      store.add('s17n25-c23', '138000023', 'dept-17', true);
      store.add('s17n25-c24', '138000024', 'dept-17', false);
      store.add('s17n25-c25', '138000025', 'dept-17', false);
      expect(store.remove(18)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(18) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(24);
      expect(store.search('dept-17').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0497 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_49800
     * @tc.name      testScenarioGrid0498
     * @tc.desc      Verify 25 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0498 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n25-c1', '13800001', 'dept-18', false);
      store.add('s18n25-c2', '13800002', 'dept-18', true);
      store.add('s18n25-c3', '13800003', 'dept-18', false);
      store.add('s18n25-c4', '13800004', 'dept-18', false);
      store.add('s18n25-c5', '13800005', 'dept-18', false);
      store.add('s18n25-c6', '13800006', 'dept-18', true);
      store.add('s18n25-c7', '13800007', 'dept-18', false);
      store.add('s18n25-c8', '13800008', 'dept-18', false);
      store.add('s18n25-c9', '13800009', 'dept-18', false);
      store.add('s18n25-c10', '138000010', 'dept-18', true);
      store.add('s18n25-c11', '138000011', 'dept-18', false);
      store.add('s18n25-c12', '138000012', 'dept-18', false);
      store.add('s18n25-c13', '138000013', 'dept-18', false);
      store.add('s18n25-c14', '138000014', 'dept-18', true);
      store.add('s18n25-c15', '138000015', 'dept-18', false);
      store.add('s18n25-c16', '138000016', 'dept-18', false);
      store.add('s18n25-c17', '138000017', 'dept-18', false);
      store.add('s18n25-c18', '138000018', 'dept-18', true);
      store.add('s18n25-c19', '138000019', 'dept-18', false);
      store.add('s18n25-c20', '138000020', 'dept-18', false);
      store.add('s18n25-c21', '138000021', 'dept-18', false);
      store.add('s18n25-c22', '138000022', 'dept-18', true);
      store.add('s18n25-c23', '138000023', 'dept-18', false);
      store.add('s18n25-c24', '138000024', 'dept-18', false);
      store.add('s18n25-c25', '138000025', 'dept-18', false);
      expect(store.remove(19)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(19) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(24);
      expect(store.search('dept-18').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0498 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_49900
     * @tc.name      testScenarioGrid0499
     * @tc.desc      Verify 25 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0499 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n25-c1', '13800001', 'dept-19', true);
      store.add('s19n25-c2', '13800002', 'dept-19', false);
      store.add('s19n25-c3', '13800003', 'dept-19', false);
      store.add('s19n25-c4', '13800004', 'dept-19', false);
      store.add('s19n25-c5', '13800005', 'dept-19', true);
      store.add('s19n25-c6', '13800006', 'dept-19', false);
      store.add('s19n25-c7', '13800007', 'dept-19', false);
      store.add('s19n25-c8', '13800008', 'dept-19', false);
      store.add('s19n25-c9', '13800009', 'dept-19', true);
      store.add('s19n25-c10', '138000010', 'dept-19', false);
      store.add('s19n25-c11', '138000011', 'dept-19', false);
      store.add('s19n25-c12', '138000012', 'dept-19', false);
      store.add('s19n25-c13', '138000013', 'dept-19', true);
      store.add('s19n25-c14', '138000014', 'dept-19', false);
      store.add('s19n25-c15', '138000015', 'dept-19', false);
      store.add('s19n25-c16', '138000016', 'dept-19', false);
      store.add('s19n25-c17', '138000017', 'dept-19', true);
      store.add('s19n25-c18', '138000018', 'dept-19', false);
      store.add('s19n25-c19', '138000019', 'dept-19', false);
      store.add('s19n25-c20', '138000020', 'dept-19', false);
      store.add('s19n25-c21', '138000021', 'dept-19', true);
      store.add('s19n25-c22', '138000022', 'dept-19', false);
      store.add('s19n25-c23', '138000023', 'dept-19', false);
      store.add('s19n25-c24', '138000024', 'dept-19', false);
      store.add('s19n25-c25', '138000025', 'dept-19', true);
      expect(store.remove(20)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(8);
      expect(store.findById(20) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(24);
      expect(store.search('dept-19').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0499 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP13_50000
     * @tc.name      testScenarioGrid0500
     * @tc.desc      Verify 25 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0500 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n25-c1', '13800001', 'dept-20', false);
      store.add('s20n25-c2', '13800002', 'dept-20', false);
      store.add('s20n25-c3', '13800003', 'dept-20', false);
      store.add('s20n25-c4', '13800004', 'dept-20', true);
      store.add('s20n25-c5', '13800005', 'dept-20', false);
      store.add('s20n25-c6', '13800006', 'dept-20', false);
      store.add('s20n25-c7', '13800007', 'dept-20', false);
      store.add('s20n25-c8', '13800008', 'dept-20', true);
      store.add('s20n25-c9', '13800009', 'dept-20', false);
      store.add('s20n25-c10', '138000010', 'dept-20', false);
      store.add('s20n25-c11', '138000011', 'dept-20', false);
      store.add('s20n25-c12', '138000012', 'dept-20', true);
      store.add('s20n25-c13', '138000013', 'dept-20', false);
      store.add('s20n25-c14', '138000014', 'dept-20', false);
      store.add('s20n25-c15', '138000015', 'dept-20', false);
      store.add('s20n25-c16', '138000016', 'dept-20', true);
      store.add('s20n25-c17', '138000017', 'dept-20', false);
      store.add('s20n25-c18', '138000018', 'dept-20', false);
      store.add('s20n25-c19', '138000019', 'dept-20', false);
      store.add('s20n25-c20', '138000020', 'dept-20', true);
      store.add('s20n25-c21', '138000021', 'dept-20', false);
      store.add('s20n25-c22', '138000022', 'dept-20', false);
      store.add('s20n25-c23', '138000023', 'dept-20', false);
      store.add('s20n25-c24', '138000024', 'dept-20', true);
      store.add('s20n25-c25', '138000025', 'dept-20', false);
      expect(store.remove(21)).assertEqual(true);
      expect(store.toggleOnline(11)).assertEqual(true);
      expect(store.count()).assertEqual(24);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(21) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(24);
      expect(store.search('dept-20').length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0500 end');
    })

  })
}
