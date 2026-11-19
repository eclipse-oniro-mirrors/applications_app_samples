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

export default function ContactScenarioGridMatrixPart11Test(): void {
  describe('ContactScenarioGridMatrixPart11', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_40100
     * @tc.name      testScenarioGrid0401
     * @tc.desc      Verify 21 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0401 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n21-c1', '13800001', 'dept-1', false);
      store.add('s1n21-c2', '13800002', 'dept-1', false);
      store.add('s1n21-c3', '13800003', 'dept-1', true);
      store.add('s1n21-c4', '13800004', 'dept-1', false);
      store.add('s1n21-c5', '13800005', 'dept-1', false);
      store.add('s1n21-c6', '13800006', 'dept-1', false);
      store.add('s1n21-c7', '13800007', 'dept-1', true);
      store.add('s1n21-c8', '13800008', 'dept-1', false);
      store.add('s1n21-c9', '13800009', 'dept-1', false);
      store.add('s1n21-c10', '138000010', 'dept-1', false);
      store.add('s1n21-c11', '138000011', 'dept-1', true);
      store.add('s1n21-c12', '138000012', 'dept-1', false);
      store.add('s1n21-c13', '138000013', 'dept-1', false);
      store.add('s1n21-c14', '138000014', 'dept-1', false);
      store.add('s1n21-c15', '138000015', 'dept-1', true);
      store.add('s1n21-c16', '138000016', 'dept-1', false);
      store.add('s1n21-c17', '138000017', 'dept-1', false);
      store.add('s1n21-c18', '138000018', 'dept-1', false);
      store.add('s1n21-c19', '138000019', 'dept-1', true);
      store.add('s1n21-c20', '138000020', 'dept-1', false);
      store.add('s1n21-c21', '138000021', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(20);
      expect(store.search('dept-1').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0401 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_40200
     * @tc.name      testScenarioGrid0402
     * @tc.desc      Verify 21 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0402 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n21-c1', '13800001', 'dept-2', false);
      store.add('s2n21-c2', '13800002', 'dept-2', true);
      store.add('s2n21-c3', '13800003', 'dept-2', false);
      store.add('s2n21-c4', '13800004', 'dept-2', false);
      store.add('s2n21-c5', '13800005', 'dept-2', false);
      store.add('s2n21-c6', '13800006', 'dept-2', true);
      store.add('s2n21-c7', '13800007', 'dept-2', false);
      store.add('s2n21-c8', '13800008', 'dept-2', false);
      store.add('s2n21-c9', '13800009', 'dept-2', false);
      store.add('s2n21-c10', '138000010', 'dept-2', true);
      store.add('s2n21-c11', '138000011', 'dept-2', false);
      store.add('s2n21-c12', '138000012', 'dept-2', false);
      store.add('s2n21-c13', '138000013', 'dept-2', false);
      store.add('s2n21-c14', '138000014', 'dept-2', true);
      store.add('s2n21-c15', '138000015', 'dept-2', false);
      store.add('s2n21-c16', '138000016', 'dept-2', false);
      store.add('s2n21-c17', '138000017', 'dept-2', false);
      store.add('s2n21-c18', '138000018', 'dept-2', true);
      store.add('s2n21-c19', '138000019', 'dept-2', false);
      store.add('s2n21-c20', '138000020', 'dept-2', false);
      store.add('s2n21-c21', '138000021', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(20);
      expect(store.search('dept-2').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0402 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_40300
     * @tc.name      testScenarioGrid0403
     * @tc.desc      Verify 21 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0403 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n21-c1', '13800001', 'dept-3', true);
      store.add('s3n21-c2', '13800002', 'dept-3', false);
      store.add('s3n21-c3', '13800003', 'dept-3', false);
      store.add('s3n21-c4', '13800004', 'dept-3', false);
      store.add('s3n21-c5', '13800005', 'dept-3', true);
      store.add('s3n21-c6', '13800006', 'dept-3', false);
      store.add('s3n21-c7', '13800007', 'dept-3', false);
      store.add('s3n21-c8', '13800008', 'dept-3', false);
      store.add('s3n21-c9', '13800009', 'dept-3', true);
      store.add('s3n21-c10', '138000010', 'dept-3', false);
      store.add('s3n21-c11', '138000011', 'dept-3', false);
      store.add('s3n21-c12', '138000012', 'dept-3', false);
      store.add('s3n21-c13', '138000013', 'dept-3', true);
      store.add('s3n21-c14', '138000014', 'dept-3', false);
      store.add('s3n21-c15', '138000015', 'dept-3', false);
      store.add('s3n21-c16', '138000016', 'dept-3', false);
      store.add('s3n21-c17', '138000017', 'dept-3', true);
      store.add('s3n21-c18', '138000018', 'dept-3', false);
      store.add('s3n21-c19', '138000019', 'dept-3', false);
      store.add('s3n21-c20', '138000020', 'dept-3', false);
      store.add('s3n21-c21', '138000021', 'dept-3', true);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(20);
      expect(store.search('dept-3').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0403 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_40400
     * @tc.name      testScenarioGrid0404
     * @tc.desc      Verify 21 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0404 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n21-c1', '13800001', 'dept-4', false);
      store.add('s4n21-c2', '13800002', 'dept-4', false);
      store.add('s4n21-c3', '13800003', 'dept-4', false);
      store.add('s4n21-c4', '13800004', 'dept-4', true);
      store.add('s4n21-c5', '13800005', 'dept-4', false);
      store.add('s4n21-c6', '13800006', 'dept-4', false);
      store.add('s4n21-c7', '13800007', 'dept-4', false);
      store.add('s4n21-c8', '13800008', 'dept-4', true);
      store.add('s4n21-c9', '13800009', 'dept-4', false);
      store.add('s4n21-c10', '138000010', 'dept-4', false);
      store.add('s4n21-c11', '138000011', 'dept-4', false);
      store.add('s4n21-c12', '138000012', 'dept-4', true);
      store.add('s4n21-c13', '138000013', 'dept-4', false);
      store.add('s4n21-c14', '138000014', 'dept-4', false);
      store.add('s4n21-c15', '138000015', 'dept-4', false);
      store.add('s4n21-c16', '138000016', 'dept-4', true);
      store.add('s4n21-c17', '138000017', 'dept-4', false);
      store.add('s4n21-c18', '138000018', 'dept-4', false);
      store.add('s4n21-c19', '138000019', 'dept-4', false);
      store.add('s4n21-c20', '138000020', 'dept-4', true);
      store.add('s4n21-c21', '138000021', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(20);
      expect(store.search('dept-4').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0404 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_40500
     * @tc.name      testScenarioGrid0405
     * @tc.desc      Verify 21 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0405 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n21-c1', '13800001', 'dept-5', false);
      store.add('s5n21-c2', '13800002', 'dept-5', false);
      store.add('s5n21-c3', '13800003', 'dept-5', true);
      store.add('s5n21-c4', '13800004', 'dept-5', false);
      store.add('s5n21-c5', '13800005', 'dept-5', false);
      store.add('s5n21-c6', '13800006', 'dept-5', false);
      store.add('s5n21-c7', '13800007', 'dept-5', true);
      store.add('s5n21-c8', '13800008', 'dept-5', false);
      store.add('s5n21-c9', '13800009', 'dept-5', false);
      store.add('s5n21-c10', '138000010', 'dept-5', false);
      store.add('s5n21-c11', '138000011', 'dept-5', true);
      store.add('s5n21-c12', '138000012', 'dept-5', false);
      store.add('s5n21-c13', '138000013', 'dept-5', false);
      store.add('s5n21-c14', '138000014', 'dept-5', false);
      store.add('s5n21-c15', '138000015', 'dept-5', true);
      store.add('s5n21-c16', '138000016', 'dept-5', false);
      store.add('s5n21-c17', '138000017', 'dept-5', false);
      store.add('s5n21-c18', '138000018', 'dept-5', false);
      store.add('s5n21-c19', '138000019', 'dept-5', true);
      store.add('s5n21-c20', '138000020', 'dept-5', false);
      store.add('s5n21-c21', '138000021', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(20);
      expect(store.search('dept-5').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0405 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_40600
     * @tc.name      testScenarioGrid0406
     * @tc.desc      Verify 21 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0406 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n21-c1', '13800001', 'dept-6', false);
      store.add('s6n21-c2', '13800002', 'dept-6', true);
      store.add('s6n21-c3', '13800003', 'dept-6', false);
      store.add('s6n21-c4', '13800004', 'dept-6', false);
      store.add('s6n21-c5', '13800005', 'dept-6', false);
      store.add('s6n21-c6', '13800006', 'dept-6', true);
      store.add('s6n21-c7', '13800007', 'dept-6', false);
      store.add('s6n21-c8', '13800008', 'dept-6', false);
      store.add('s6n21-c9', '13800009', 'dept-6', false);
      store.add('s6n21-c10', '138000010', 'dept-6', true);
      store.add('s6n21-c11', '138000011', 'dept-6', false);
      store.add('s6n21-c12', '138000012', 'dept-6', false);
      store.add('s6n21-c13', '138000013', 'dept-6', false);
      store.add('s6n21-c14', '138000014', 'dept-6', true);
      store.add('s6n21-c15', '138000015', 'dept-6', false);
      store.add('s6n21-c16', '138000016', 'dept-6', false);
      store.add('s6n21-c17', '138000017', 'dept-6', false);
      store.add('s6n21-c18', '138000018', 'dept-6', true);
      store.add('s6n21-c19', '138000019', 'dept-6', false);
      store.add('s6n21-c20', '138000020', 'dept-6', false);
      store.add('s6n21-c21', '138000021', 'dept-6', false);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(19)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(20);
      expect(store.search('dept-6').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0406 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_40700
     * @tc.name      testScenarioGrid0407
     * @tc.desc      Verify 21 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0407 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n21-c1', '13800001', 'dept-7', true);
      store.add('s7n21-c2', '13800002', 'dept-7', false);
      store.add('s7n21-c3', '13800003', 'dept-7', false);
      store.add('s7n21-c4', '13800004', 'dept-7', false);
      store.add('s7n21-c5', '13800005', 'dept-7', true);
      store.add('s7n21-c6', '13800006', 'dept-7', false);
      store.add('s7n21-c7', '13800007', 'dept-7', false);
      store.add('s7n21-c8', '13800008', 'dept-7', false);
      store.add('s7n21-c9', '13800009', 'dept-7', true);
      store.add('s7n21-c10', '138000010', 'dept-7', false);
      store.add('s7n21-c11', '138000011', 'dept-7', false);
      store.add('s7n21-c12', '138000012', 'dept-7', false);
      store.add('s7n21-c13', '138000013', 'dept-7', true);
      store.add('s7n21-c14', '138000014', 'dept-7', false);
      store.add('s7n21-c15', '138000015', 'dept-7', false);
      store.add('s7n21-c16', '138000016', 'dept-7', false);
      store.add('s7n21-c17', '138000017', 'dept-7', true);
      store.add('s7n21-c18', '138000018', 'dept-7', false);
      store.add('s7n21-c19', '138000019', 'dept-7', false);
      store.add('s7n21-c20', '138000020', 'dept-7', false);
      store.add('s7n21-c21', '138000021', 'dept-7', true);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(false);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(20);
      expect(store.search('dept-7').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0407 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_40800
     * @tc.name      testScenarioGrid0408
     * @tc.desc      Verify 21 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0408 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n21-c1', '13800001', 'dept-8', false);
      store.add('s8n21-c2', '13800002', 'dept-8', false);
      store.add('s8n21-c3', '13800003', 'dept-8', false);
      store.add('s8n21-c4', '13800004', 'dept-8', true);
      store.add('s8n21-c5', '13800005', 'dept-8', false);
      store.add('s8n21-c6', '13800006', 'dept-8', false);
      store.add('s8n21-c7', '13800007', 'dept-8', false);
      store.add('s8n21-c8', '13800008', 'dept-8', true);
      store.add('s8n21-c9', '13800009', 'dept-8', false);
      store.add('s8n21-c10', '138000010', 'dept-8', false);
      store.add('s8n21-c11', '138000011', 'dept-8', false);
      store.add('s8n21-c12', '138000012', 'dept-8', true);
      store.add('s8n21-c13', '138000013', 'dept-8', false);
      store.add('s8n21-c14', '138000014', 'dept-8', false);
      store.add('s8n21-c15', '138000015', 'dept-8', false);
      store.add('s8n21-c16', '138000016', 'dept-8', true);
      store.add('s8n21-c17', '138000017', 'dept-8', false);
      store.add('s8n21-c18', '138000018', 'dept-8', false);
      store.add('s8n21-c19', '138000019', 'dept-8', false);
      store.add('s8n21-c20', '138000020', 'dept-8', true);
      store.add('s8n21-c21', '138000021', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(false);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(20);
      expect(store.search('dept-8').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0408 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_40900
     * @tc.name      testScenarioGrid0409
     * @tc.desc      Verify 21 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0409 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n21-c1', '13800001', 'dept-9', false);
      store.add('s9n21-c2', '13800002', 'dept-9', false);
      store.add('s9n21-c3', '13800003', 'dept-9', true);
      store.add('s9n21-c4', '13800004', 'dept-9', false);
      store.add('s9n21-c5', '13800005', 'dept-9', false);
      store.add('s9n21-c6', '13800006', 'dept-9', false);
      store.add('s9n21-c7', '13800007', 'dept-9', true);
      store.add('s9n21-c8', '13800008', 'dept-9', false);
      store.add('s9n21-c9', '13800009', 'dept-9', false);
      store.add('s9n21-c10', '138000010', 'dept-9', false);
      store.add('s9n21-c11', '138000011', 'dept-9', true);
      store.add('s9n21-c12', '138000012', 'dept-9', false);
      store.add('s9n21-c13', '138000013', 'dept-9', false);
      store.add('s9n21-c14', '138000014', 'dept-9', false);
      store.add('s9n21-c15', '138000015', 'dept-9', true);
      store.add('s9n21-c16', '138000016', 'dept-9', false);
      store.add('s9n21-c17', '138000017', 'dept-9', false);
      store.add('s9n21-c18', '138000018', 'dept-9', false);
      store.add('s9n21-c19', '138000019', 'dept-9', true);
      store.add('s9n21-c20', '138000020', 'dept-9', false);
      store.add('s9n21-c21', '138000021', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(false);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(20);
      expect(store.search('dept-9').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0409 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_41000
     * @tc.name      testScenarioGrid0410
     * @tc.desc      Verify 21 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0410 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n21-c1', '13800001', 'dept-10', false);
      store.add('s10n21-c2', '13800002', 'dept-10', true);
      store.add('s10n21-c3', '13800003', 'dept-10', false);
      store.add('s10n21-c4', '13800004', 'dept-10', false);
      store.add('s10n21-c5', '13800005', 'dept-10', false);
      store.add('s10n21-c6', '13800006', 'dept-10', true);
      store.add('s10n21-c7', '13800007', 'dept-10', false);
      store.add('s10n21-c8', '13800008', 'dept-10', false);
      store.add('s10n21-c9', '13800009', 'dept-10', false);
      store.add('s10n21-c10', '138000010', 'dept-10', true);
      store.add('s10n21-c11', '138000011', 'dept-10', false);
      store.add('s10n21-c12', '138000012', 'dept-10', false);
      store.add('s10n21-c13', '138000013', 'dept-10', false);
      store.add('s10n21-c14', '138000014', 'dept-10', true);
      store.add('s10n21-c15', '138000015', 'dept-10', false);
      store.add('s10n21-c16', '138000016', 'dept-10', false);
      store.add('s10n21-c17', '138000017', 'dept-10', false);
      store.add('s10n21-c18', '138000018', 'dept-10', true);
      store.add('s10n21-c19', '138000019', 'dept-10', false);
      store.add('s10n21-c20', '138000020', 'dept-10', false);
      store.add('s10n21-c21', '138000021', 'dept-10', false);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(false);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(20);
      expect(store.search('dept-10').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0410 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_41100
     * @tc.name      testScenarioGrid0411
     * @tc.desc      Verify 21 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0411 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n21-c1', '13800001', 'dept-11', true);
      store.add('s11n21-c2', '13800002', 'dept-11', false);
      store.add('s11n21-c3', '13800003', 'dept-11', false);
      store.add('s11n21-c4', '13800004', 'dept-11', false);
      store.add('s11n21-c5', '13800005', 'dept-11', true);
      store.add('s11n21-c6', '13800006', 'dept-11', false);
      store.add('s11n21-c7', '13800007', 'dept-11', false);
      store.add('s11n21-c8', '13800008', 'dept-11', false);
      store.add('s11n21-c9', '13800009', 'dept-11', true);
      store.add('s11n21-c10', '138000010', 'dept-11', false);
      store.add('s11n21-c11', '138000011', 'dept-11', false);
      store.add('s11n21-c12', '138000012', 'dept-11', false);
      store.add('s11n21-c13', '138000013', 'dept-11', true);
      store.add('s11n21-c14', '138000014', 'dept-11', false);
      store.add('s11n21-c15', '138000015', 'dept-11', false);
      store.add('s11n21-c16', '138000016', 'dept-11', false);
      store.add('s11n21-c17', '138000017', 'dept-11', true);
      store.add('s11n21-c18', '138000018', 'dept-11', false);
      store.add('s11n21-c19', '138000019', 'dept-11', false);
      store.add('s11n21-c20', '138000020', 'dept-11', false);
      store.add('s11n21-c21', '138000021', 'dept-11', true);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(false);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(5);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(20);
      expect(store.search('dept-11').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0411 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_41200
     * @tc.name      testScenarioGrid0412
     * @tc.desc      Verify 21 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0412 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n21-c1', '13800001', 'dept-12', false);
      store.add('s12n21-c2', '13800002', 'dept-12', false);
      store.add('s12n21-c3', '13800003', 'dept-12', false);
      store.add('s12n21-c4', '13800004', 'dept-12', true);
      store.add('s12n21-c5', '13800005', 'dept-12', false);
      store.add('s12n21-c6', '13800006', 'dept-12', false);
      store.add('s12n21-c7', '13800007', 'dept-12', false);
      store.add('s12n21-c8', '13800008', 'dept-12', true);
      store.add('s12n21-c9', '13800009', 'dept-12', false);
      store.add('s12n21-c10', '138000010', 'dept-12', false);
      store.add('s12n21-c11', '138000011', 'dept-12', false);
      store.add('s12n21-c12', '138000012', 'dept-12', true);
      store.add('s12n21-c13', '138000013', 'dept-12', false);
      store.add('s12n21-c14', '138000014', 'dept-12', false);
      store.add('s12n21-c15', '138000015', 'dept-12', false);
      store.add('s12n21-c16', '138000016', 'dept-12', true);
      store.add('s12n21-c17', '138000017', 'dept-12', false);
      store.add('s12n21-c18', '138000018', 'dept-12', false);
      store.add('s12n21-c19', '138000019', 'dept-12', false);
      store.add('s12n21-c20', '138000020', 'dept-12', true);
      store.add('s12n21-c21', '138000021', 'dept-12', false);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(false);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(20);
      expect(store.search('dept-12').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0412 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_41300
     * @tc.name      testScenarioGrid0413
     * @tc.desc      Verify 21 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0413 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n21-c1', '13800001', 'dept-13', false);
      store.add('s13n21-c2', '13800002', 'dept-13', false);
      store.add('s13n21-c3', '13800003', 'dept-13', true);
      store.add('s13n21-c4', '13800004', 'dept-13', false);
      store.add('s13n21-c5', '13800005', 'dept-13', false);
      store.add('s13n21-c6', '13800006', 'dept-13', false);
      store.add('s13n21-c7', '13800007', 'dept-13', true);
      store.add('s13n21-c8', '13800008', 'dept-13', false);
      store.add('s13n21-c9', '13800009', 'dept-13', false);
      store.add('s13n21-c10', '138000010', 'dept-13', false);
      store.add('s13n21-c11', '138000011', 'dept-13', true);
      store.add('s13n21-c12', '138000012', 'dept-13', false);
      store.add('s13n21-c13', '138000013', 'dept-13', false);
      store.add('s13n21-c14', '138000014', 'dept-13', false);
      store.add('s13n21-c15', '138000015', 'dept-13', true);
      store.add('s13n21-c16', '138000016', 'dept-13', false);
      store.add('s13n21-c17', '138000017', 'dept-13', false);
      store.add('s13n21-c18', '138000018', 'dept-13', false);
      store.add('s13n21-c19', '138000019', 'dept-13', true);
      store.add('s13n21-c20', '138000020', 'dept-13', false);
      store.add('s13n21-c21', '138000021', 'dept-13', false);
      expect(store.remove(14)).assertEqual(true);
      expect(store.toggleOnline(19)).assertEqual(false);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(14) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(20);
      expect(store.search('dept-13').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0413 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_41400
     * @tc.name      testScenarioGrid0414
     * @tc.desc      Verify 21 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0414 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n21-c1', '13800001', 'dept-14', false);
      store.add('s14n21-c2', '13800002', 'dept-14', true);
      store.add('s14n21-c3', '13800003', 'dept-14', false);
      store.add('s14n21-c4', '13800004', 'dept-14', false);
      store.add('s14n21-c5', '13800005', 'dept-14', false);
      store.add('s14n21-c6', '13800006', 'dept-14', true);
      store.add('s14n21-c7', '13800007', 'dept-14', false);
      store.add('s14n21-c8', '13800008', 'dept-14', false);
      store.add('s14n21-c9', '13800009', 'dept-14', false);
      store.add('s14n21-c10', '138000010', 'dept-14', true);
      store.add('s14n21-c11', '138000011', 'dept-14', false);
      store.add('s14n21-c12', '138000012', 'dept-14', false);
      store.add('s14n21-c13', '138000013', 'dept-14', false);
      store.add('s14n21-c14', '138000014', 'dept-14', true);
      store.add('s14n21-c15', '138000015', 'dept-14', false);
      store.add('s14n21-c16', '138000016', 'dept-14', false);
      store.add('s14n21-c17', '138000017', 'dept-14', false);
      store.add('s14n21-c18', '138000018', 'dept-14', true);
      store.add('s14n21-c19', '138000019', 'dept-14', false);
      store.add('s14n21-c20', '138000020', 'dept-14', false);
      store.add('s14n21-c21', '138000021', 'dept-14', false);
      expect(store.remove(15)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(15) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(20);
      expect(store.search('dept-14').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0414 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_41500
     * @tc.name      testScenarioGrid0415
     * @tc.desc      Verify 21 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0415 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n21-c1', '13800001', 'dept-15', true);
      store.add('s15n21-c2', '13800002', 'dept-15', false);
      store.add('s15n21-c3', '13800003', 'dept-15', false);
      store.add('s15n21-c4', '13800004', 'dept-15', false);
      store.add('s15n21-c5', '13800005', 'dept-15', true);
      store.add('s15n21-c6', '13800006', 'dept-15', false);
      store.add('s15n21-c7', '13800007', 'dept-15', false);
      store.add('s15n21-c8', '13800008', 'dept-15', false);
      store.add('s15n21-c9', '13800009', 'dept-15', true);
      store.add('s15n21-c10', '138000010', 'dept-15', false);
      store.add('s15n21-c11', '138000011', 'dept-15', false);
      store.add('s15n21-c12', '138000012', 'dept-15', false);
      store.add('s15n21-c13', '138000013', 'dept-15', true);
      store.add('s15n21-c14', '138000014', 'dept-15', false);
      store.add('s15n21-c15', '138000015', 'dept-15', false);
      store.add('s15n21-c16', '138000016', 'dept-15', false);
      store.add('s15n21-c17', '138000017', 'dept-15', true);
      store.add('s15n21-c18', '138000018', 'dept-15', false);
      store.add('s15n21-c19', '138000019', 'dept-15', false);
      store.add('s15n21-c20', '138000020', 'dept-15', false);
      store.add('s15n21-c21', '138000021', 'dept-15', true);
      expect(store.remove(16)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(16) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(20);
      expect(store.search('dept-15').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0415 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_41600
     * @tc.name      testScenarioGrid0416
     * @tc.desc      Verify 21 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0416 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n21-c1', '13800001', 'dept-16', false);
      store.add('s16n21-c2', '13800002', 'dept-16', false);
      store.add('s16n21-c3', '13800003', 'dept-16', false);
      store.add('s16n21-c4', '13800004', 'dept-16', true);
      store.add('s16n21-c5', '13800005', 'dept-16', false);
      store.add('s16n21-c6', '13800006', 'dept-16', false);
      store.add('s16n21-c7', '13800007', 'dept-16', false);
      store.add('s16n21-c8', '13800008', 'dept-16', true);
      store.add('s16n21-c9', '13800009', 'dept-16', false);
      store.add('s16n21-c10', '138000010', 'dept-16', false);
      store.add('s16n21-c11', '138000011', 'dept-16', false);
      store.add('s16n21-c12', '138000012', 'dept-16', true);
      store.add('s16n21-c13', '138000013', 'dept-16', false);
      store.add('s16n21-c14', '138000014', 'dept-16', false);
      store.add('s16n21-c15', '138000015', 'dept-16', false);
      store.add('s16n21-c16', '138000016', 'dept-16', true);
      store.add('s16n21-c17', '138000017', 'dept-16', false);
      store.add('s16n21-c18', '138000018', 'dept-16', false);
      store.add('s16n21-c19', '138000019', 'dept-16', false);
      store.add('s16n21-c20', '138000020', 'dept-16', true);
      store.add('s16n21-c21', '138000021', 'dept-16', false);
      expect(store.remove(17)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(17) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(20);
      expect(store.search('dept-16').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0416 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_41700
     * @tc.name      testScenarioGrid0417
     * @tc.desc      Verify 21 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0417 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n21-c1', '13800001', 'dept-17', false);
      store.add('s17n21-c2', '13800002', 'dept-17', false);
      store.add('s17n21-c3', '13800003', 'dept-17', true);
      store.add('s17n21-c4', '13800004', 'dept-17', false);
      store.add('s17n21-c5', '13800005', 'dept-17', false);
      store.add('s17n21-c6', '13800006', 'dept-17', false);
      store.add('s17n21-c7', '13800007', 'dept-17', true);
      store.add('s17n21-c8', '13800008', 'dept-17', false);
      store.add('s17n21-c9', '13800009', 'dept-17', false);
      store.add('s17n21-c10', '138000010', 'dept-17', false);
      store.add('s17n21-c11', '138000011', 'dept-17', true);
      store.add('s17n21-c12', '138000012', 'dept-17', false);
      store.add('s17n21-c13', '138000013', 'dept-17', false);
      store.add('s17n21-c14', '138000014', 'dept-17', false);
      store.add('s17n21-c15', '138000015', 'dept-17', true);
      store.add('s17n21-c16', '138000016', 'dept-17', false);
      store.add('s17n21-c17', '138000017', 'dept-17', false);
      store.add('s17n21-c18', '138000018', 'dept-17', false);
      store.add('s17n21-c19', '138000019', 'dept-17', true);
      store.add('s17n21-c20', '138000020', 'dept-17', false);
      store.add('s17n21-c21', '138000021', 'dept-17', false);
      expect(store.remove(18)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(18) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(20);
      expect(store.search('dept-17').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0417 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_41800
     * @tc.name      testScenarioGrid0418
     * @tc.desc      Verify 21 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0418 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n21-c1', '13800001', 'dept-18', false);
      store.add('s18n21-c2', '13800002', 'dept-18', true);
      store.add('s18n21-c3', '13800003', 'dept-18', false);
      store.add('s18n21-c4', '13800004', 'dept-18', false);
      store.add('s18n21-c5', '13800005', 'dept-18', false);
      store.add('s18n21-c6', '13800006', 'dept-18', true);
      store.add('s18n21-c7', '13800007', 'dept-18', false);
      store.add('s18n21-c8', '13800008', 'dept-18', false);
      store.add('s18n21-c9', '13800009', 'dept-18', false);
      store.add('s18n21-c10', '138000010', 'dept-18', true);
      store.add('s18n21-c11', '138000011', 'dept-18', false);
      store.add('s18n21-c12', '138000012', 'dept-18', false);
      store.add('s18n21-c13', '138000013', 'dept-18', false);
      store.add('s18n21-c14', '138000014', 'dept-18', true);
      store.add('s18n21-c15', '138000015', 'dept-18', false);
      store.add('s18n21-c16', '138000016', 'dept-18', false);
      store.add('s18n21-c17', '138000017', 'dept-18', false);
      store.add('s18n21-c18', '138000018', 'dept-18', true);
      store.add('s18n21-c19', '138000019', 'dept-18', false);
      store.add('s18n21-c20', '138000020', 'dept-18', false);
      store.add('s18n21-c21', '138000021', 'dept-18', false);
      expect(store.remove(19)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(19) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(20);
      expect(store.search('dept-18').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0418 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_41900
     * @tc.name      testScenarioGrid0419
     * @tc.desc      Verify 21 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0419 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n21-c1', '13800001', 'dept-19', true);
      store.add('s19n21-c2', '13800002', 'dept-19', false);
      store.add('s19n21-c3', '13800003', 'dept-19', false);
      store.add('s19n21-c4', '13800004', 'dept-19', false);
      store.add('s19n21-c5', '13800005', 'dept-19', true);
      store.add('s19n21-c6', '13800006', 'dept-19', false);
      store.add('s19n21-c7', '13800007', 'dept-19', false);
      store.add('s19n21-c8', '13800008', 'dept-19', false);
      store.add('s19n21-c9', '13800009', 'dept-19', true);
      store.add('s19n21-c10', '138000010', 'dept-19', false);
      store.add('s19n21-c11', '138000011', 'dept-19', false);
      store.add('s19n21-c12', '138000012', 'dept-19', false);
      store.add('s19n21-c13', '138000013', 'dept-19', true);
      store.add('s19n21-c14', '138000014', 'dept-19', false);
      store.add('s19n21-c15', '138000015', 'dept-19', false);
      store.add('s19n21-c16', '138000016', 'dept-19', false);
      store.add('s19n21-c17', '138000017', 'dept-19', true);
      store.add('s19n21-c18', '138000018', 'dept-19', false);
      store.add('s19n21-c19', '138000019', 'dept-19', false);
      store.add('s19n21-c20', '138000020', 'dept-19', false);
      store.add('s19n21-c21', '138000021', 'dept-19', true);
      expect(store.remove(20)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(20) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(20);
      expect(store.search('dept-19').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0419 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_42000
     * @tc.name      testScenarioGrid0420
     * @tc.desc      Verify 21 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0420 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n21-c1', '13800001', 'dept-20', false);
      store.add('s20n21-c2', '13800002', 'dept-20', false);
      store.add('s20n21-c3', '13800003', 'dept-20', false);
      store.add('s20n21-c4', '13800004', 'dept-20', true);
      store.add('s20n21-c5', '13800005', 'dept-20', false);
      store.add('s20n21-c6', '13800006', 'dept-20', false);
      store.add('s20n21-c7', '13800007', 'dept-20', false);
      store.add('s20n21-c8', '13800008', 'dept-20', true);
      store.add('s20n21-c9', '13800009', 'dept-20', false);
      store.add('s20n21-c10', '138000010', 'dept-20', false);
      store.add('s20n21-c11', '138000011', 'dept-20', false);
      store.add('s20n21-c12', '138000012', 'dept-20', true);
      store.add('s20n21-c13', '138000013', 'dept-20', false);
      store.add('s20n21-c14', '138000014', 'dept-20', false);
      store.add('s20n21-c15', '138000015', 'dept-20', false);
      store.add('s20n21-c16', '138000016', 'dept-20', true);
      store.add('s20n21-c17', '138000017', 'dept-20', false);
      store.add('s20n21-c18', '138000018', 'dept-20', false);
      store.add('s20n21-c19', '138000019', 'dept-20', false);
      store.add('s20n21-c20', '138000020', 'dept-20', true);
      store.add('s20n21-c21', '138000021', 'dept-20', false);
      expect(store.remove(21)).assertEqual(true);
      expect(store.toggleOnline(19)).assertEqual(true);
      expect(store.count()).assertEqual(20);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(21) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(20);
      expect(store.search('dept-20').length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0420 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_42100
     * @tc.name      testScenarioGrid0421
     * @tc.desc      Verify 22 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0421 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n22-c1', '13800001', 'dept-1', false);
      store.add('s1n22-c2', '13800002', 'dept-1', false);
      store.add('s1n22-c3', '13800003', 'dept-1', true);
      store.add('s1n22-c4', '13800004', 'dept-1', false);
      store.add('s1n22-c5', '13800005', 'dept-1', false);
      store.add('s1n22-c6', '13800006', 'dept-1', false);
      store.add('s1n22-c7', '13800007', 'dept-1', true);
      store.add('s1n22-c8', '13800008', 'dept-1', false);
      store.add('s1n22-c9', '13800009', 'dept-1', false);
      store.add('s1n22-c10', '138000010', 'dept-1', false);
      store.add('s1n22-c11', '138000011', 'dept-1', true);
      store.add('s1n22-c12', '138000012', 'dept-1', false);
      store.add('s1n22-c13', '138000013', 'dept-1', false);
      store.add('s1n22-c14', '138000014', 'dept-1', false);
      store.add('s1n22-c15', '138000015', 'dept-1', true);
      store.add('s1n22-c16', '138000016', 'dept-1', false);
      store.add('s1n22-c17', '138000017', 'dept-1', false);
      store.add('s1n22-c18', '138000018', 'dept-1', false);
      store.add('s1n22-c19', '138000019', 'dept-1', true);
      store.add('s1n22-c20', '138000020', 'dept-1', false);
      store.add('s1n22-c21', '138000021', 'dept-1', false);
      store.add('s1n22-c22', '138000022', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(21);
      expect(store.search('dept-1').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0421 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_42200
     * @tc.name      testScenarioGrid0422
     * @tc.desc      Verify 22 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0422 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n22-c1', '13800001', 'dept-2', false);
      store.add('s2n22-c2', '13800002', 'dept-2', true);
      store.add('s2n22-c3', '13800003', 'dept-2', false);
      store.add('s2n22-c4', '13800004', 'dept-2', false);
      store.add('s2n22-c5', '13800005', 'dept-2', false);
      store.add('s2n22-c6', '13800006', 'dept-2', true);
      store.add('s2n22-c7', '13800007', 'dept-2', false);
      store.add('s2n22-c8', '13800008', 'dept-2', false);
      store.add('s2n22-c9', '13800009', 'dept-2', false);
      store.add('s2n22-c10', '138000010', 'dept-2', true);
      store.add('s2n22-c11', '138000011', 'dept-2', false);
      store.add('s2n22-c12', '138000012', 'dept-2', false);
      store.add('s2n22-c13', '138000013', 'dept-2', false);
      store.add('s2n22-c14', '138000014', 'dept-2', true);
      store.add('s2n22-c15', '138000015', 'dept-2', false);
      store.add('s2n22-c16', '138000016', 'dept-2', false);
      store.add('s2n22-c17', '138000017', 'dept-2', false);
      store.add('s2n22-c18', '138000018', 'dept-2', true);
      store.add('s2n22-c19', '138000019', 'dept-2', false);
      store.add('s2n22-c20', '138000020', 'dept-2', false);
      store.add('s2n22-c21', '138000021', 'dept-2', false);
      store.add('s2n22-c22', '138000022', 'dept-2', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(7)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(21);
      expect(store.search('dept-2').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0422 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_42300
     * @tc.name      testScenarioGrid0423
     * @tc.desc      Verify 22 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0423 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n22-c1', '13800001', 'dept-3', true);
      store.add('s3n22-c2', '13800002', 'dept-3', false);
      store.add('s3n22-c3', '13800003', 'dept-3', false);
      store.add('s3n22-c4', '13800004', 'dept-3', false);
      store.add('s3n22-c5', '13800005', 'dept-3', true);
      store.add('s3n22-c6', '13800006', 'dept-3', false);
      store.add('s3n22-c7', '13800007', 'dept-3', false);
      store.add('s3n22-c8', '13800008', 'dept-3', false);
      store.add('s3n22-c9', '13800009', 'dept-3', true);
      store.add('s3n22-c10', '138000010', 'dept-3', false);
      store.add('s3n22-c11', '138000011', 'dept-3', false);
      store.add('s3n22-c12', '138000012', 'dept-3', false);
      store.add('s3n22-c13', '138000013', 'dept-3', true);
      store.add('s3n22-c14', '138000014', 'dept-3', false);
      store.add('s3n22-c15', '138000015', 'dept-3', false);
      store.add('s3n22-c16', '138000016', 'dept-3', false);
      store.add('s3n22-c17', '138000017', 'dept-3', true);
      store.add('s3n22-c18', '138000018', 'dept-3', false);
      store.add('s3n22-c19', '138000019', 'dept-3', false);
      store.add('s3n22-c20', '138000020', 'dept-3', false);
      store.add('s3n22-c21', '138000021', 'dept-3', true);
      store.add('s3n22-c22', '138000022', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(10)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(21);
      expect(store.search('dept-3').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0423 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_42400
     * @tc.name      testScenarioGrid0424
     * @tc.desc      Verify 22 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0424 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n22-c1', '13800001', 'dept-4', false);
      store.add('s4n22-c2', '13800002', 'dept-4', false);
      store.add('s4n22-c3', '13800003', 'dept-4', false);
      store.add('s4n22-c4', '13800004', 'dept-4', true);
      store.add('s4n22-c5', '13800005', 'dept-4', false);
      store.add('s4n22-c6', '13800006', 'dept-4', false);
      store.add('s4n22-c7', '13800007', 'dept-4', false);
      store.add('s4n22-c8', '13800008', 'dept-4', true);
      store.add('s4n22-c9', '13800009', 'dept-4', false);
      store.add('s4n22-c10', '138000010', 'dept-4', false);
      store.add('s4n22-c11', '138000011', 'dept-4', false);
      store.add('s4n22-c12', '138000012', 'dept-4', true);
      store.add('s4n22-c13', '138000013', 'dept-4', false);
      store.add('s4n22-c14', '138000014', 'dept-4', false);
      store.add('s4n22-c15', '138000015', 'dept-4', false);
      store.add('s4n22-c16', '138000016', 'dept-4', true);
      store.add('s4n22-c17', '138000017', 'dept-4', false);
      store.add('s4n22-c18', '138000018', 'dept-4', false);
      store.add('s4n22-c19', '138000019', 'dept-4', false);
      store.add('s4n22-c20', '138000020', 'dept-4', true);
      store.add('s4n22-c21', '138000021', 'dept-4', false);
      store.add('s4n22-c22', '138000022', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(13)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(21);
      expect(store.search('dept-4').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0424 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_42500
     * @tc.name      testScenarioGrid0425
     * @tc.desc      Verify 22 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0425 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n22-c1', '13800001', 'dept-5', false);
      store.add('s5n22-c2', '13800002', 'dept-5', false);
      store.add('s5n22-c3', '13800003', 'dept-5', true);
      store.add('s5n22-c4', '13800004', 'dept-5', false);
      store.add('s5n22-c5', '13800005', 'dept-5', false);
      store.add('s5n22-c6', '13800006', 'dept-5', false);
      store.add('s5n22-c7', '13800007', 'dept-5', true);
      store.add('s5n22-c8', '13800008', 'dept-5', false);
      store.add('s5n22-c9', '13800009', 'dept-5', false);
      store.add('s5n22-c10', '138000010', 'dept-5', false);
      store.add('s5n22-c11', '138000011', 'dept-5', true);
      store.add('s5n22-c12', '138000012', 'dept-5', false);
      store.add('s5n22-c13', '138000013', 'dept-5', false);
      store.add('s5n22-c14', '138000014', 'dept-5', false);
      store.add('s5n22-c15', '138000015', 'dept-5', true);
      store.add('s5n22-c16', '138000016', 'dept-5', false);
      store.add('s5n22-c17', '138000017', 'dept-5', false);
      store.add('s5n22-c18', '138000018', 'dept-5', false);
      store.add('s5n22-c19', '138000019', 'dept-5', true);
      store.add('s5n22-c20', '138000020', 'dept-5', false);
      store.add('s5n22-c21', '138000021', 'dept-5', false);
      store.add('s5n22-c22', '138000022', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(16)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(21);
      expect(store.search('dept-5').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0425 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_42600
     * @tc.name      testScenarioGrid0426
     * @tc.desc      Verify 22 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0426 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n22-c1', '13800001', 'dept-6', false);
      store.add('s6n22-c2', '13800002', 'dept-6', true);
      store.add('s6n22-c3', '13800003', 'dept-6', false);
      store.add('s6n22-c4', '13800004', 'dept-6', false);
      store.add('s6n22-c5', '13800005', 'dept-6', false);
      store.add('s6n22-c6', '13800006', 'dept-6', true);
      store.add('s6n22-c7', '13800007', 'dept-6', false);
      store.add('s6n22-c8', '13800008', 'dept-6', false);
      store.add('s6n22-c9', '13800009', 'dept-6', false);
      store.add('s6n22-c10', '138000010', 'dept-6', true);
      store.add('s6n22-c11', '138000011', 'dept-6', false);
      store.add('s6n22-c12', '138000012', 'dept-6', false);
      store.add('s6n22-c13', '138000013', 'dept-6', false);
      store.add('s6n22-c14', '138000014', 'dept-6', true);
      store.add('s6n22-c15', '138000015', 'dept-6', false);
      store.add('s6n22-c16', '138000016', 'dept-6', false);
      store.add('s6n22-c17', '138000017', 'dept-6', false);
      store.add('s6n22-c18', '138000018', 'dept-6', true);
      store.add('s6n22-c19', '138000019', 'dept-6', false);
      store.add('s6n22-c20', '138000020', 'dept-6', false);
      store.add('s6n22-c21', '138000021', 'dept-6', false);
      store.add('s6n22-c22', '138000022', 'dept-6', true);
      expect(store.remove(7)).assertEqual(true);
      expect(store.toggleOnline(19)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(7) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(21);
      expect(store.search('dept-6').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0426 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_42700
     * @tc.name      testScenarioGrid0427
     * @tc.desc      Verify 22 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0427 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n22-c1', '13800001', 'dept-7', true);
      store.add('s7n22-c2', '13800002', 'dept-7', false);
      store.add('s7n22-c3', '13800003', 'dept-7', false);
      store.add('s7n22-c4', '13800004', 'dept-7', false);
      store.add('s7n22-c5', '13800005', 'dept-7', true);
      store.add('s7n22-c6', '13800006', 'dept-7', false);
      store.add('s7n22-c7', '13800007', 'dept-7', false);
      store.add('s7n22-c8', '13800008', 'dept-7', false);
      store.add('s7n22-c9', '13800009', 'dept-7', true);
      store.add('s7n22-c10', '138000010', 'dept-7', false);
      store.add('s7n22-c11', '138000011', 'dept-7', false);
      store.add('s7n22-c12', '138000012', 'dept-7', false);
      store.add('s7n22-c13', '138000013', 'dept-7', true);
      store.add('s7n22-c14', '138000014', 'dept-7', false);
      store.add('s7n22-c15', '138000015', 'dept-7', false);
      store.add('s7n22-c16', '138000016', 'dept-7', false);
      store.add('s7n22-c17', '138000017', 'dept-7', true);
      store.add('s7n22-c18', '138000018', 'dept-7', false);
      store.add('s7n22-c19', '138000019', 'dept-7', false);
      store.add('s7n22-c20', '138000020', 'dept-7', false);
      store.add('s7n22-c21', '138000021', 'dept-7', true);
      store.add('s7n22-c22', '138000022', 'dept-7', false);
      expect(store.remove(8)).assertEqual(true);
      expect(store.toggleOnline(22)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(8) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(21);
      expect(store.search('dept-7').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0427 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_42800
     * @tc.name      testScenarioGrid0428
     * @tc.desc      Verify 22 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0428 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n22-c1', '13800001', 'dept-8', false);
      store.add('s8n22-c2', '13800002', 'dept-8', false);
      store.add('s8n22-c3', '13800003', 'dept-8', false);
      store.add('s8n22-c4', '13800004', 'dept-8', true);
      store.add('s8n22-c5', '13800005', 'dept-8', false);
      store.add('s8n22-c6', '13800006', 'dept-8', false);
      store.add('s8n22-c7', '13800007', 'dept-8', false);
      store.add('s8n22-c8', '13800008', 'dept-8', true);
      store.add('s8n22-c9', '13800009', 'dept-8', false);
      store.add('s8n22-c10', '138000010', 'dept-8', false);
      store.add('s8n22-c11', '138000011', 'dept-8', false);
      store.add('s8n22-c12', '138000012', 'dept-8', true);
      store.add('s8n22-c13', '138000013', 'dept-8', false);
      store.add('s8n22-c14', '138000014', 'dept-8', false);
      store.add('s8n22-c15', '138000015', 'dept-8', false);
      store.add('s8n22-c16', '138000016', 'dept-8', true);
      store.add('s8n22-c17', '138000017', 'dept-8', false);
      store.add('s8n22-c18', '138000018', 'dept-8', false);
      store.add('s8n22-c19', '138000019', 'dept-8', false);
      store.add('s8n22-c20', '138000020', 'dept-8', true);
      store.add('s8n22-c21', '138000021', 'dept-8', false);
      store.add('s8n22-c22', '138000022', 'dept-8', false);
      expect(store.remove(9)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(9) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(21);
      expect(store.search('dept-8').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0428 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_42900
     * @tc.name      testScenarioGrid0429
     * @tc.desc      Verify 22 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0429 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n22-c1', '13800001', 'dept-9', false);
      store.add('s9n22-c2', '13800002', 'dept-9', false);
      store.add('s9n22-c3', '13800003', 'dept-9', true);
      store.add('s9n22-c4', '13800004', 'dept-9', false);
      store.add('s9n22-c5', '13800005', 'dept-9', false);
      store.add('s9n22-c6', '13800006', 'dept-9', false);
      store.add('s9n22-c7', '13800007', 'dept-9', true);
      store.add('s9n22-c8', '13800008', 'dept-9', false);
      store.add('s9n22-c9', '13800009', 'dept-9', false);
      store.add('s9n22-c10', '138000010', 'dept-9', false);
      store.add('s9n22-c11', '138000011', 'dept-9', true);
      store.add('s9n22-c12', '138000012', 'dept-9', false);
      store.add('s9n22-c13', '138000013', 'dept-9', false);
      store.add('s9n22-c14', '138000014', 'dept-9', false);
      store.add('s9n22-c15', '138000015', 'dept-9', true);
      store.add('s9n22-c16', '138000016', 'dept-9', false);
      store.add('s9n22-c17', '138000017', 'dept-9', false);
      store.add('s9n22-c18', '138000018', 'dept-9', false);
      store.add('s9n22-c19', '138000019', 'dept-9', true);
      store.add('s9n22-c20', '138000020', 'dept-9', false);
      store.add('s9n22-c21', '138000021', 'dept-9', false);
      store.add('s9n22-c22', '138000022', 'dept-9', false);
      expect(store.remove(10)).assertEqual(true);
      expect(store.toggleOnline(6)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(10) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(21);
      expect(store.search('dept-9').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0429 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_43000
     * @tc.name      testScenarioGrid0430
     * @tc.desc      Verify 22 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0430 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n22-c1', '13800001', 'dept-10', false);
      store.add('s10n22-c2', '13800002', 'dept-10', true);
      store.add('s10n22-c3', '13800003', 'dept-10', false);
      store.add('s10n22-c4', '13800004', 'dept-10', false);
      store.add('s10n22-c5', '13800005', 'dept-10', false);
      store.add('s10n22-c6', '13800006', 'dept-10', true);
      store.add('s10n22-c7', '13800007', 'dept-10', false);
      store.add('s10n22-c8', '13800008', 'dept-10', false);
      store.add('s10n22-c9', '13800009', 'dept-10', false);
      store.add('s10n22-c10', '138000010', 'dept-10', true);
      store.add('s10n22-c11', '138000011', 'dept-10', false);
      store.add('s10n22-c12', '138000012', 'dept-10', false);
      store.add('s10n22-c13', '138000013', 'dept-10', false);
      store.add('s10n22-c14', '138000014', 'dept-10', true);
      store.add('s10n22-c15', '138000015', 'dept-10', false);
      store.add('s10n22-c16', '138000016', 'dept-10', false);
      store.add('s10n22-c17', '138000017', 'dept-10', false);
      store.add('s10n22-c18', '138000018', 'dept-10', true);
      store.add('s10n22-c19', '138000019', 'dept-10', false);
      store.add('s10n22-c20', '138000020', 'dept-10', false);
      store.add('s10n22-c21', '138000021', 'dept-10', false);
      store.add('s10n22-c22', '138000022', 'dept-10', true);
      expect(store.remove(11)).assertEqual(true);
      expect(store.toggleOnline(9)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(11) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(21);
      expect(store.search('dept-10').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0430 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_43100
     * @tc.name      testScenarioGrid0431
     * @tc.desc      Verify 22 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0431 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n22-c1', '13800001', 'dept-11', true);
      store.add('s11n22-c2', '13800002', 'dept-11', false);
      store.add('s11n22-c3', '13800003', 'dept-11', false);
      store.add('s11n22-c4', '13800004', 'dept-11', false);
      store.add('s11n22-c5', '13800005', 'dept-11', true);
      store.add('s11n22-c6', '13800006', 'dept-11', false);
      store.add('s11n22-c7', '13800007', 'dept-11', false);
      store.add('s11n22-c8', '13800008', 'dept-11', false);
      store.add('s11n22-c9', '13800009', 'dept-11', true);
      store.add('s11n22-c10', '138000010', 'dept-11', false);
      store.add('s11n22-c11', '138000011', 'dept-11', false);
      store.add('s11n22-c12', '138000012', 'dept-11', false);
      store.add('s11n22-c13', '138000013', 'dept-11', true);
      store.add('s11n22-c14', '138000014', 'dept-11', false);
      store.add('s11n22-c15', '138000015', 'dept-11', false);
      store.add('s11n22-c16', '138000016', 'dept-11', false);
      store.add('s11n22-c17', '138000017', 'dept-11', true);
      store.add('s11n22-c18', '138000018', 'dept-11', false);
      store.add('s11n22-c19', '138000019', 'dept-11', false);
      store.add('s11n22-c20', '138000020', 'dept-11', false);
      store.add('s11n22-c21', '138000021', 'dept-11', true);
      store.add('s11n22-c22', '138000022', 'dept-11', false);
      expect(store.remove(12)).assertEqual(true);
      expect(store.toggleOnline(12)).assertEqual(null);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(12) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(21);
      expect(store.search('dept-11').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0431 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_43200
     * @tc.name      testScenarioGrid0432
     * @tc.desc      Verify 22 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0432 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n22-c1', '13800001', 'dept-12', false);
      store.add('s12n22-c2', '13800002', 'dept-12', false);
      store.add('s12n22-c3', '13800003', 'dept-12', false);
      store.add('s12n22-c4', '13800004', 'dept-12', true);
      store.add('s12n22-c5', '13800005', 'dept-12', false);
      store.add('s12n22-c6', '13800006', 'dept-12', false);
      store.add('s12n22-c7', '13800007', 'dept-12', false);
      store.add('s12n22-c8', '13800008', 'dept-12', true);
      store.add('s12n22-c9', '13800009', 'dept-12', false);
      store.add('s12n22-c10', '138000010', 'dept-12', false);
      store.add('s12n22-c11', '138000011', 'dept-12', false);
      store.add('s12n22-c12', '138000012', 'dept-12', true);
      store.add('s12n22-c13', '138000013', 'dept-12', false);
      store.add('s12n22-c14', '138000014', 'dept-12', false);
      store.add('s12n22-c15', '138000015', 'dept-12', false);
      store.add('s12n22-c16', '138000016', 'dept-12', true);
      store.add('s12n22-c17', '138000017', 'dept-12', false);
      store.add('s12n22-c18', '138000018', 'dept-12', false);
      store.add('s12n22-c19', '138000019', 'dept-12', false);
      store.add('s12n22-c20', '138000020', 'dept-12', true);
      store.add('s12n22-c21', '138000021', 'dept-12', false);
      store.add('s12n22-c22', '138000022', 'dept-12', false);
      expect(store.remove(13)).assertEqual(true);
      expect(store.toggleOnline(15)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(13) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(21);
      expect(store.search('dept-12').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0432 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_43300
     * @tc.name      testScenarioGrid0433
     * @tc.desc      Verify 22 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0433 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n22-c1', '13800001', 'dept-13', false);
      store.add('s13n22-c2', '13800002', 'dept-13', false);
      store.add('s13n22-c3', '13800003', 'dept-13', true);
      store.add('s13n22-c4', '13800004', 'dept-13', false);
      store.add('s13n22-c5', '13800005', 'dept-13', false);
      store.add('s13n22-c6', '13800006', 'dept-13', false);
      store.add('s13n22-c7', '13800007', 'dept-13', true);
      store.add('s13n22-c8', '13800008', 'dept-13', false);
      store.add('s13n22-c9', '13800009', 'dept-13', false);
      store.add('s13n22-c10', '138000010', 'dept-13', false);
      store.add('s13n22-c11', '138000011', 'dept-13', true);
      store.add('s13n22-c12', '138000012', 'dept-13', false);
      store.add('s13n22-c13', '138000013', 'dept-13', false);
      store.add('s13n22-c14', '138000014', 'dept-13', false);
      store.add('s13n22-c15', '138000015', 'dept-13', true);
      store.add('s13n22-c16', '138000016', 'dept-13', false);
      store.add('s13n22-c17', '138000017', 'dept-13', false);
      store.add('s13n22-c18', '138000018', 'dept-13', false);
      store.add('s13n22-c19', '138000019', 'dept-13', true);
      store.add('s13n22-c20', '138000020', 'dept-13', false);
      store.add('s13n22-c21', '138000021', 'dept-13', false);
      store.add('s13n22-c22', '138000022', 'dept-13', false);
      expect(store.remove(14)).assertEqual(true);
      expect(store.toggleOnline(18)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(14) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(21);
      expect(store.search('dept-13').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0433 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_43400
     * @tc.name      testScenarioGrid0434
     * @tc.desc      Verify 22 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0434 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n22-c1', '13800001', 'dept-14', false);
      store.add('s14n22-c2', '13800002', 'dept-14', true);
      store.add('s14n22-c3', '13800003', 'dept-14', false);
      store.add('s14n22-c4', '13800004', 'dept-14', false);
      store.add('s14n22-c5', '13800005', 'dept-14', false);
      store.add('s14n22-c6', '13800006', 'dept-14', true);
      store.add('s14n22-c7', '13800007', 'dept-14', false);
      store.add('s14n22-c8', '13800008', 'dept-14', false);
      store.add('s14n22-c9', '13800009', 'dept-14', false);
      store.add('s14n22-c10', '138000010', 'dept-14', true);
      store.add('s14n22-c11', '138000011', 'dept-14', false);
      store.add('s14n22-c12', '138000012', 'dept-14', false);
      store.add('s14n22-c13', '138000013', 'dept-14', false);
      store.add('s14n22-c14', '138000014', 'dept-14', true);
      store.add('s14n22-c15', '138000015', 'dept-14', false);
      store.add('s14n22-c16', '138000016', 'dept-14', false);
      store.add('s14n22-c17', '138000017', 'dept-14', false);
      store.add('s14n22-c18', '138000018', 'dept-14', true);
      store.add('s14n22-c19', '138000019', 'dept-14', false);
      store.add('s14n22-c20', '138000020', 'dept-14', false);
      store.add('s14n22-c21', '138000021', 'dept-14', false);
      store.add('s14n22-c22', '138000022', 'dept-14', true);
      expect(store.remove(15)).assertEqual(true);
      expect(store.toggleOnline(21)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(15) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(21);
      expect(store.search('dept-14').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0434 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_43500
     * @tc.name      testScenarioGrid0435
     * @tc.desc      Verify 22 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0435 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n22-c1', '13800001', 'dept-15', true);
      store.add('s15n22-c2', '13800002', 'dept-15', false);
      store.add('s15n22-c3', '13800003', 'dept-15', false);
      store.add('s15n22-c4', '13800004', 'dept-15', false);
      store.add('s15n22-c5', '13800005', 'dept-15', true);
      store.add('s15n22-c6', '13800006', 'dept-15', false);
      store.add('s15n22-c7', '13800007', 'dept-15', false);
      store.add('s15n22-c8', '13800008', 'dept-15', false);
      store.add('s15n22-c9', '13800009', 'dept-15', true);
      store.add('s15n22-c10', '138000010', 'dept-15', false);
      store.add('s15n22-c11', '138000011', 'dept-15', false);
      store.add('s15n22-c12', '138000012', 'dept-15', false);
      store.add('s15n22-c13', '138000013', 'dept-15', true);
      store.add('s15n22-c14', '138000014', 'dept-15', false);
      store.add('s15n22-c15', '138000015', 'dept-15', false);
      store.add('s15n22-c16', '138000016', 'dept-15', false);
      store.add('s15n22-c17', '138000017', 'dept-15', true);
      store.add('s15n22-c18', '138000018', 'dept-15', false);
      store.add('s15n22-c19', '138000019', 'dept-15', false);
      store.add('s15n22-c20', '138000020', 'dept-15', false);
      store.add('s15n22-c21', '138000021', 'dept-15', true);
      store.add('s15n22-c22', '138000022', 'dept-15', false);
      expect(store.remove(16)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(16) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(21);
      expect(store.search('dept-15').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0435 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_43600
     * @tc.name      testScenarioGrid0436
     * @tc.desc      Verify 22 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0436 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n22-c1', '13800001', 'dept-16', false);
      store.add('s16n22-c2', '13800002', 'dept-16', false);
      store.add('s16n22-c3', '13800003', 'dept-16', false);
      store.add('s16n22-c4', '13800004', 'dept-16', true);
      store.add('s16n22-c5', '13800005', 'dept-16', false);
      store.add('s16n22-c6', '13800006', 'dept-16', false);
      store.add('s16n22-c7', '13800007', 'dept-16', false);
      store.add('s16n22-c8', '13800008', 'dept-16', true);
      store.add('s16n22-c9', '13800009', 'dept-16', false);
      store.add('s16n22-c10', '138000010', 'dept-16', false);
      store.add('s16n22-c11', '138000011', 'dept-16', false);
      store.add('s16n22-c12', '138000012', 'dept-16', true);
      store.add('s16n22-c13', '138000013', 'dept-16', false);
      store.add('s16n22-c14', '138000014', 'dept-16', false);
      store.add('s16n22-c15', '138000015', 'dept-16', false);
      store.add('s16n22-c16', '138000016', 'dept-16', true);
      store.add('s16n22-c17', '138000017', 'dept-16', false);
      store.add('s16n22-c18', '138000018', 'dept-16', false);
      store.add('s16n22-c19', '138000019', 'dept-16', false);
      store.add('s16n22-c20', '138000020', 'dept-16', true);
      store.add('s16n22-c21', '138000021', 'dept-16', false);
      store.add('s16n22-c22', '138000022', 'dept-16', false);
      expect(store.remove(17)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(17) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(21);
      expect(store.search('dept-16').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0436 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_43700
     * @tc.name      testScenarioGrid0437
     * @tc.desc      Verify 22 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0437 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n22-c1', '13800001', 'dept-17', false);
      store.add('s17n22-c2', '13800002', 'dept-17', false);
      store.add('s17n22-c3', '13800003', 'dept-17', true);
      store.add('s17n22-c4', '13800004', 'dept-17', false);
      store.add('s17n22-c5', '13800005', 'dept-17', false);
      store.add('s17n22-c6', '13800006', 'dept-17', false);
      store.add('s17n22-c7', '13800007', 'dept-17', true);
      store.add('s17n22-c8', '13800008', 'dept-17', false);
      store.add('s17n22-c9', '13800009', 'dept-17', false);
      store.add('s17n22-c10', '138000010', 'dept-17', false);
      store.add('s17n22-c11', '138000011', 'dept-17', true);
      store.add('s17n22-c12', '138000012', 'dept-17', false);
      store.add('s17n22-c13', '138000013', 'dept-17', false);
      store.add('s17n22-c14', '138000014', 'dept-17', false);
      store.add('s17n22-c15', '138000015', 'dept-17', true);
      store.add('s17n22-c16', '138000016', 'dept-17', false);
      store.add('s17n22-c17', '138000017', 'dept-17', false);
      store.add('s17n22-c18', '138000018', 'dept-17', false);
      store.add('s17n22-c19', '138000019', 'dept-17', true);
      store.add('s17n22-c20', '138000020', 'dept-17', false);
      store.add('s17n22-c21', '138000021', 'dept-17', false);
      store.add('s17n22-c22', '138000022', 'dept-17', false);
      expect(store.remove(18)).assertEqual(true);
      expect(store.toggleOnline(8)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(18) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(21);
      expect(store.search('dept-17').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0437 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_43800
     * @tc.name      testScenarioGrid0438
     * @tc.desc      Verify 22 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0438 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n22-c1', '13800001', 'dept-18', false);
      store.add('s18n22-c2', '13800002', 'dept-18', true);
      store.add('s18n22-c3', '13800003', 'dept-18', false);
      store.add('s18n22-c4', '13800004', 'dept-18', false);
      store.add('s18n22-c5', '13800005', 'dept-18', false);
      store.add('s18n22-c6', '13800006', 'dept-18', true);
      store.add('s18n22-c7', '13800007', 'dept-18', false);
      store.add('s18n22-c8', '13800008', 'dept-18', false);
      store.add('s18n22-c9', '13800009', 'dept-18', false);
      store.add('s18n22-c10', '138000010', 'dept-18', true);
      store.add('s18n22-c11', '138000011', 'dept-18', false);
      store.add('s18n22-c12', '138000012', 'dept-18', false);
      store.add('s18n22-c13', '138000013', 'dept-18', false);
      store.add('s18n22-c14', '138000014', 'dept-18', true);
      store.add('s18n22-c15', '138000015', 'dept-18', false);
      store.add('s18n22-c16', '138000016', 'dept-18', false);
      store.add('s18n22-c17', '138000017', 'dept-18', false);
      store.add('s18n22-c18', '138000018', 'dept-18', true);
      store.add('s18n22-c19', '138000019', 'dept-18', false);
      store.add('s18n22-c20', '138000020', 'dept-18', false);
      store.add('s18n22-c21', '138000021', 'dept-18', false);
      store.add('s18n22-c22', '138000022', 'dept-18', true);
      expect(store.remove(19)).assertEqual(true);
      expect(store.toggleOnline(11)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(19) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(21);
      expect(store.search('dept-18').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0438 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_43900
     * @tc.name      testScenarioGrid0439
     * @tc.desc      Verify 22 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0439 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n22-c1', '13800001', 'dept-19', true);
      store.add('s19n22-c2', '13800002', 'dept-19', false);
      store.add('s19n22-c3', '13800003', 'dept-19', false);
      store.add('s19n22-c4', '13800004', 'dept-19', false);
      store.add('s19n22-c5', '13800005', 'dept-19', true);
      store.add('s19n22-c6', '13800006', 'dept-19', false);
      store.add('s19n22-c7', '13800007', 'dept-19', false);
      store.add('s19n22-c8', '13800008', 'dept-19', false);
      store.add('s19n22-c9', '13800009', 'dept-19', true);
      store.add('s19n22-c10', '138000010', 'dept-19', false);
      store.add('s19n22-c11', '138000011', 'dept-19', false);
      store.add('s19n22-c12', '138000012', 'dept-19', false);
      store.add('s19n22-c13', '138000013', 'dept-19', true);
      store.add('s19n22-c14', '138000014', 'dept-19', false);
      store.add('s19n22-c15', '138000015', 'dept-19', false);
      store.add('s19n22-c16', '138000016', 'dept-19', false);
      store.add('s19n22-c17', '138000017', 'dept-19', true);
      store.add('s19n22-c18', '138000018', 'dept-19', false);
      store.add('s19n22-c19', '138000019', 'dept-19', false);
      store.add('s19n22-c20', '138000020', 'dept-19', false);
      store.add('s19n22-c21', '138000021', 'dept-19', true);
      store.add('s19n22-c22', '138000022', 'dept-19', false);
      expect(store.remove(20)).assertEqual(true);
      expect(store.toggleOnline(14)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(7);
      expect(store.findById(20) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(21);
      expect(store.search('dept-19').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0439 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP11_44000
     * @tc.name      testScenarioGrid0440
     * @tc.desc      Verify 22 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0440 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n22-c1', '13800001', 'dept-20', false);
      store.add('s20n22-c2', '13800002', 'dept-20', false);
      store.add('s20n22-c3', '13800003', 'dept-20', false);
      store.add('s20n22-c4', '13800004', 'dept-20', true);
      store.add('s20n22-c5', '13800005', 'dept-20', false);
      store.add('s20n22-c6', '13800006', 'dept-20', false);
      store.add('s20n22-c7', '13800007', 'dept-20', false);
      store.add('s20n22-c8', '13800008', 'dept-20', true);
      store.add('s20n22-c9', '13800009', 'dept-20', false);
      store.add('s20n22-c10', '138000010', 'dept-20', false);
      store.add('s20n22-c11', '138000011', 'dept-20', false);
      store.add('s20n22-c12', '138000012', 'dept-20', true);
      store.add('s20n22-c13', '138000013', 'dept-20', false);
      store.add('s20n22-c14', '138000014', 'dept-20', false);
      store.add('s20n22-c15', '138000015', 'dept-20', false);
      store.add('s20n22-c16', '138000016', 'dept-20', true);
      store.add('s20n22-c17', '138000017', 'dept-20', false);
      store.add('s20n22-c18', '138000018', 'dept-20', false);
      store.add('s20n22-c19', '138000019', 'dept-20', false);
      store.add('s20n22-c20', '138000020', 'dept-20', true);
      store.add('s20n22-c21', '138000021', 'dept-20', false);
      store.add('s20n22-c22', '138000022', 'dept-20', false);
      expect(store.remove(21)).assertEqual(true);
      expect(store.toggleOnline(17)).assertEqual(true);
      expect(store.count()).assertEqual(21);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(21) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(21);
      expect(store.search('dept-20').length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0440 end');
    })

  })
}
