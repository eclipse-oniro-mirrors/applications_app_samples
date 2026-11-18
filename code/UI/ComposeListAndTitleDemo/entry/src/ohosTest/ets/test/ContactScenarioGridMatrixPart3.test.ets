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

export default function ContactScenarioGridMatrixPart3Test(): void {
  describe('ContactScenarioGridMatrixPart3', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_8100
     * @tc.name      testScenarioGrid0081
     * @tc.desc      Verify 5 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0081 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n5-c1', '13800001', 'dept-1', false);
      store.add('s1n5-c2', '13800002', 'dept-1', false);
      store.add('s1n5-c3', '13800003', 'dept-1', true);
      store.add('s1n5-c4', '13800004', 'dept-1', false);
      store.add('s1n5-c5', '13800005', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(4);
      expect(store.search('dept-1').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0081 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_8200
     * @tc.name      testScenarioGrid0082
     * @tc.desc      Verify 5 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0082 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n5-c1', '13800001', 'dept-2', false);
      store.add('s2n5-c2', '13800002', 'dept-2', true);
      store.add('s2n5-c3', '13800003', 'dept-2', false);
      store.add('s2n5-c4', '13800004', 'dept-2', false);
      store.add('s2n5-c5', '13800005', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(false);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(4);
      expect(store.search('dept-2').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0082 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_8300
     * @tc.name      testScenarioGrid0083
     * @tc.desc      Verify 5 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0083 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n5-c1', '13800001', 'dept-3', true);
      store.add('s3n5-c2', '13800002', 'dept-3', false);
      store.add('s3n5-c3', '13800003', 'dept-3', false);
      store.add('s3n5-c4', '13800004', 'dept-3', false);
      store.add('s3n5-c5', '13800005', 'dept-3', true);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(false);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(4);
      expect(store.search('dept-3').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0083 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_8400
     * @tc.name      testScenarioGrid0084
     * @tc.desc      Verify 5 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0084 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n5-c1', '13800001', 'dept-4', false);
      store.add('s4n5-c2', '13800002', 'dept-4', false);
      store.add('s4n5-c3', '13800003', 'dept-4', false);
      store.add('s4n5-c4', '13800004', 'dept-4', true);
      store.add('s4n5-c5', '13800005', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(4);
      expect(store.search('dept-4').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0084 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_8500
     * @tc.name      testScenarioGrid0085
     * @tc.desc      Verify 5 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0085 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n5-c1', '13800001', 'dept-5', false);
      store.add('s5n5-c2', '13800002', 'dept-5', false);
      store.add('s5n5-c3', '13800003', 'dept-5', true);
      store.add('s5n5-c4', '13800004', 'dept-5', false);
      store.add('s5n5-c5', '13800005', 'dept-5', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(4);
      expect(store.search('dept-5').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0085 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_8600
     * @tc.name      testScenarioGrid0086
     * @tc.desc      Verify 5 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0086 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n5-c1', '13800001', 'dept-6', false);
      store.add('s6n5-c2', '13800002', 'dept-6', true);
      store.add('s6n5-c3', '13800003', 'dept-6', false);
      store.add('s6n5-c4', '13800004', 'dept-6', false);
      store.add('s6n5-c5', '13800005', 'dept-6', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(4);
      expect(store.search('dept-6').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0086 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_8700
     * @tc.name      testScenarioGrid0087
     * @tc.desc      Verify 5 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0087 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n5-c1', '13800001', 'dept-7', true);
      store.add('s7n5-c2', '13800002', 'dept-7', false);
      store.add('s7n5-c3', '13800003', 'dept-7', false);
      store.add('s7n5-c4', '13800004', 'dept-7', false);
      store.add('s7n5-c5', '13800005', 'dept-7', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(4);
      expect(store.search('dept-7').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0087 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_8800
     * @tc.name      testScenarioGrid0088
     * @tc.desc      Verify 5 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0088 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n5-c1', '13800001', 'dept-8', false);
      store.add('s8n5-c2', '13800002', 'dept-8', false);
      store.add('s8n5-c3', '13800003', 'dept-8', false);
      store.add('s8n5-c4', '13800004', 'dept-8', true);
      store.add('s8n5-c5', '13800005', 'dept-8', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(4);
      expect(store.search('dept-8').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0088 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_8900
     * @tc.name      testScenarioGrid0089
     * @tc.desc      Verify 5 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0089 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n5-c1', '13800001', 'dept-9', false);
      store.add('s9n5-c2', '13800002', 'dept-9', false);
      store.add('s9n5-c3', '13800003', 'dept-9', true);
      store.add('s9n5-c4', '13800004', 'dept-9', false);
      store.add('s9n5-c5', '13800005', 'dept-9', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(false);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(4);
      expect(store.search('dept-9').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0089 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_9000
     * @tc.name      testScenarioGrid0090
     * @tc.desc      Verify 5 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0090 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n5-c1', '13800001', 'dept-10', false);
      store.add('s10n5-c2', '13800002', 'dept-10', true);
      store.add('s10n5-c3', '13800003', 'dept-10', false);
      store.add('s10n5-c4', '13800004', 'dept-10', false);
      store.add('s10n5-c5', '13800005', 'dept-10', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(4);
      expect(store.search('dept-10').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0090 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_9100
     * @tc.name      testScenarioGrid0091
     * @tc.desc      Verify 5 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0091 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n5-c1', '13800001', 'dept-11', true);
      store.add('s11n5-c2', '13800002', 'dept-11', false);
      store.add('s11n5-c3', '13800003', 'dept-11', false);
      store.add('s11n5-c4', '13800004', 'dept-11', false);
      store.add('s11n5-c5', '13800005', 'dept-11', true);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(4);
      expect(store.search('dept-11').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0091 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_9200
     * @tc.name      testScenarioGrid0092
     * @tc.desc      Verify 5 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0092 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n5-c1', '13800001', 'dept-12', false);
      store.add('s12n5-c2', '13800002', 'dept-12', false);
      store.add('s12n5-c3', '13800003', 'dept-12', false);
      store.add('s12n5-c4', '13800004', 'dept-12', true);
      store.add('s12n5-c5', '13800005', 'dept-12', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(4);
      expect(store.search('dept-12').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0092 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_9300
     * @tc.name      testScenarioGrid0093
     * @tc.desc      Verify 5 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0093 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n5-c1', '13800001', 'dept-13', false);
      store.add('s13n5-c2', '13800002', 'dept-13', false);
      store.add('s13n5-c3', '13800003', 'dept-13', true);
      store.add('s13n5-c4', '13800004', 'dept-13', false);
      store.add('s13n5-c5', '13800005', 'dept-13', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(4);
      expect(store.search('dept-13').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0093 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_9400
     * @tc.name      testScenarioGrid0094
     * @tc.desc      Verify 5 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0094 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n5-c1', '13800001', 'dept-14', false);
      store.add('s14n5-c2', '13800002', 'dept-14', true);
      store.add('s14n5-c3', '13800003', 'dept-14', false);
      store.add('s14n5-c4', '13800004', 'dept-14', false);
      store.add('s14n5-c5', '13800005', 'dept-14', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(4);
      expect(store.search('dept-14').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0094 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_9500
     * @tc.name      testScenarioGrid0095
     * @tc.desc      Verify 5 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0095 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n5-c1', '13800001', 'dept-15', true);
      store.add('s15n5-c2', '13800002', 'dept-15', false);
      store.add('s15n5-c3', '13800003', 'dept-15', false);
      store.add('s15n5-c4', '13800004', 'dept-15', false);
      store.add('s15n5-c5', '13800005', 'dept-15', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(4);
      expect(store.search('dept-15').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0095 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_9600
     * @tc.name      testScenarioGrid0096
     * @tc.desc      Verify 5 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0096 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n5-c1', '13800001', 'dept-16', false);
      store.add('s16n5-c2', '13800002', 'dept-16', false);
      store.add('s16n5-c3', '13800003', 'dept-16', false);
      store.add('s16n5-c4', '13800004', 'dept-16', true);
      store.add('s16n5-c5', '13800005', 'dept-16', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(false);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(4);
      expect(store.search('dept-16').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0096 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_9700
     * @tc.name      testScenarioGrid0097
     * @tc.desc      Verify 5 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0097 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n5-c1', '13800001', 'dept-17', false);
      store.add('s17n5-c2', '13800002', 'dept-17', false);
      store.add('s17n5-c3', '13800003', 'dept-17', true);
      store.add('s17n5-c4', '13800004', 'dept-17', false);
      store.add('s17n5-c5', '13800005', 'dept-17', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(4);
      expect(store.search('dept-17').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0097 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_9800
     * @tc.name      testScenarioGrid0098
     * @tc.desc      Verify 5 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0098 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n5-c1', '13800001', 'dept-18', false);
      store.add('s18n5-c2', '13800002', 'dept-18', true);
      store.add('s18n5-c3', '13800003', 'dept-18', false);
      store.add('s18n5-c4', '13800004', 'dept-18', false);
      store.add('s18n5-c5', '13800005', 'dept-18', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(5)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(4);
      expect(store.search('dept-18').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0098 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_9900
     * @tc.name      testScenarioGrid0099
     * @tc.desc      Verify 5 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0099 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n5-c1', '13800001', 'dept-19', true);
      store.add('s19n5-c2', '13800002', 'dept-19', false);
      store.add('s19n5-c3', '13800003', 'dept-19', false);
      store.add('s19n5-c4', '13800004', 'dept-19', false);
      store.add('s19n5-c5', '13800005', 'dept-19', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(true);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(4);
      expect(store.search('dept-19').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0099 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_10000
     * @tc.name      testScenarioGrid0100
     * @tc.desc      Verify 5 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0100 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n5-c1', '13800001', 'dept-20', false);
      store.add('s20n5-c2', '13800002', 'dept-20', false);
      store.add('s20n5-c3', '13800003', 'dept-20', false);
      store.add('s20n5-c4', '13800004', 'dept-20', true);
      store.add('s20n5-c5', '13800005', 'dept-20', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(4);
      expect(store.search('dept-20').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0100 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_10100
     * @tc.name      testScenarioGrid0101
     * @tc.desc      Verify 6 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0101 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n6-c1', '13800001', 'dept-1', false);
      store.add('s1n6-c2', '13800002', 'dept-1', false);
      store.add('s1n6-c3', '13800003', 'dept-1', true);
      store.add('s1n6-c4', '13800004', 'dept-1', false);
      store.add('s1n6-c5', '13800005', 'dept-1', false);
      store.add('s1n6-c6', '13800006', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(5);
      expect(store.search('dept-1').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0101 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_10200
     * @tc.name      testScenarioGrid0102
     * @tc.desc      Verify 6 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0102 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n6-c1', '13800001', 'dept-2', false);
      store.add('s2n6-c2', '13800002', 'dept-2', true);
      store.add('s2n6-c3', '13800003', 'dept-2', false);
      store.add('s2n6-c4', '13800004', 'dept-2', false);
      store.add('s2n6-c5', '13800005', 'dept-2', false);
      store.add('s2n6-c6', '13800006', 'dept-2', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(5);
      expect(store.search('dept-2').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0102 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_10300
     * @tc.name      testScenarioGrid0103
     * @tc.desc      Verify 6 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0103 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n6-c1', '13800001', 'dept-3', true);
      store.add('s3n6-c2', '13800002', 'dept-3', false);
      store.add('s3n6-c3', '13800003', 'dept-3', false);
      store.add('s3n6-c4', '13800004', 'dept-3', false);
      store.add('s3n6-c5', '13800005', 'dept-3', true);
      store.add('s3n6-c6', '13800006', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(null);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(5);
      expect(store.search('dept-3').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0103 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_10400
     * @tc.name      testScenarioGrid0104
     * @tc.desc      Verify 6 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0104 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n6-c1', '13800001', 'dept-4', false);
      store.add('s4n6-c2', '13800002', 'dept-4', false);
      store.add('s4n6-c3', '13800003', 'dept-4', false);
      store.add('s4n6-c4', '13800004', 'dept-4', true);
      store.add('s4n6-c5', '13800005', 'dept-4', false);
      store.add('s4n6-c6', '13800006', 'dept-4', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(5);
      expect(store.search('dept-4').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0104 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_10500
     * @tc.name      testScenarioGrid0105
     * @tc.desc      Verify 6 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0105 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n6-c1', '13800001', 'dept-5', false);
      store.add('s5n6-c2', '13800002', 'dept-5', false);
      store.add('s5n6-c3', '13800003', 'dept-5', true);
      store.add('s5n6-c4', '13800004', 'dept-5', false);
      store.add('s5n6-c5', '13800005', 'dept-5', false);
      store.add('s5n6-c6', '13800006', 'dept-5', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(5);
      expect(store.search('dept-5').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0105 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_10600
     * @tc.name      testScenarioGrid0106
     * @tc.desc      Verify 6 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0106 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n6-c1', '13800001', 'dept-6', false);
      store.add('s6n6-c2', '13800002', 'dept-6', true);
      store.add('s6n6-c3', '13800003', 'dept-6', false);
      store.add('s6n6-c4', '13800004', 'dept-6', false);
      store.add('s6n6-c5', '13800005', 'dept-6', false);
      store.add('s6n6-c6', '13800006', 'dept-6', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(5);
      expect(store.search('dept-6').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0106 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_10700
     * @tc.name      testScenarioGrid0107
     * @tc.desc      Verify 6 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0107 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n6-c1', '13800001', 'dept-7', true);
      store.add('s7n6-c2', '13800002', 'dept-7', false);
      store.add('s7n6-c3', '13800003', 'dept-7', false);
      store.add('s7n6-c4', '13800004', 'dept-7', false);
      store.add('s7n6-c5', '13800005', 'dept-7', true);
      store.add('s7n6-c6', '13800006', 'dept-7', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(5);
      expect(store.search('dept-7').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0107 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_10800
     * @tc.name      testScenarioGrid0108
     * @tc.desc      Verify 6 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0108 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n6-c1', '13800001', 'dept-8', false);
      store.add('s8n6-c2', '13800002', 'dept-8', false);
      store.add('s8n6-c3', '13800003', 'dept-8', false);
      store.add('s8n6-c4', '13800004', 'dept-8', true);
      store.add('s8n6-c5', '13800005', 'dept-8', false);
      store.add('s8n6-c6', '13800006', 'dept-8', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(5);
      expect(store.search('dept-8').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0108 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_10900
     * @tc.name      testScenarioGrid0109
     * @tc.desc      Verify 6 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0109 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n6-c1', '13800001', 'dept-9', false);
      store.add('s9n6-c2', '13800002', 'dept-9', false);
      store.add('s9n6-c3', '13800003', 'dept-9', true);
      store.add('s9n6-c4', '13800004', 'dept-9', false);
      store.add('s9n6-c5', '13800005', 'dept-9', false);
      store.add('s9n6-c6', '13800006', 'dept-9', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(null);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(5);
      expect(store.search('dept-9').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0109 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_11000
     * @tc.name      testScenarioGrid0110
     * @tc.desc      Verify 6 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0110 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n6-c1', '13800001', 'dept-10', false);
      store.add('s10n6-c2', '13800002', 'dept-10', true);
      store.add('s10n6-c3', '13800003', 'dept-10', false);
      store.add('s10n6-c4', '13800004', 'dept-10', false);
      store.add('s10n6-c5', '13800005', 'dept-10', false);
      store.add('s10n6-c6', '13800006', 'dept-10', true);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(5);
      expect(store.search('dept-10').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0110 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_11100
     * @tc.name      testScenarioGrid0111
     * @tc.desc      Verify 6 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0111 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n6-c1', '13800001', 'dept-11', true);
      store.add('s11n6-c2', '13800002', 'dept-11', false);
      store.add('s11n6-c3', '13800003', 'dept-11', false);
      store.add('s11n6-c4', '13800004', 'dept-11', false);
      store.add('s11n6-c5', '13800005', 'dept-11', true);
      store.add('s11n6-c6', '13800006', 'dept-11', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(5);
      expect(store.search('dept-11').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0111 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_11200
     * @tc.name      testScenarioGrid0112
     * @tc.desc      Verify 6 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0112 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n6-c1', '13800001', 'dept-12', false);
      store.add('s12n6-c2', '13800002', 'dept-12', false);
      store.add('s12n6-c3', '13800003', 'dept-12', false);
      store.add('s12n6-c4', '13800004', 'dept-12', true);
      store.add('s12n6-c5', '13800005', 'dept-12', false);
      store.add('s12n6-c6', '13800006', 'dept-12', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(5);
      expect(store.search('dept-12').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0112 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_11300
     * @tc.name      testScenarioGrid0113
     * @tc.desc      Verify 6 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0113 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n6-c1', '13800001', 'dept-13', false);
      store.add('s13n6-c2', '13800002', 'dept-13', false);
      store.add('s13n6-c3', '13800003', 'dept-13', true);
      store.add('s13n6-c4', '13800004', 'dept-13', false);
      store.add('s13n6-c5', '13800005', 'dept-13', false);
      store.add('s13n6-c6', '13800006', 'dept-13', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(5);
      expect(store.search('dept-13').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0113 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_11400
     * @tc.name      testScenarioGrid0114
     * @tc.desc      Verify 6 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0114 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n6-c1', '13800001', 'dept-14', false);
      store.add('s14n6-c2', '13800002', 'dept-14', true);
      store.add('s14n6-c3', '13800003', 'dept-14', false);
      store.add('s14n6-c4', '13800004', 'dept-14', false);
      store.add('s14n6-c5', '13800005', 'dept-14', false);
      store.add('s14n6-c6', '13800006', 'dept-14', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(5);
      expect(store.search('dept-14').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0114 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_11500
     * @tc.name      testScenarioGrid0115
     * @tc.desc      Verify 6 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0115 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n6-c1', '13800001', 'dept-15', true);
      store.add('s15n6-c2', '13800002', 'dept-15', false);
      store.add('s15n6-c3', '13800003', 'dept-15', false);
      store.add('s15n6-c4', '13800004', 'dept-15', false);
      store.add('s15n6-c5', '13800005', 'dept-15', true);
      store.add('s15n6-c6', '13800006', 'dept-15', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(null);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(5);
      expect(store.search('dept-15').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0115 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_11600
     * @tc.name      testScenarioGrid0116
     * @tc.desc      Verify 6 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0116 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n6-c1', '13800001', 'dept-16', false);
      store.add('s16n6-c2', '13800002', 'dept-16', false);
      store.add('s16n6-c3', '13800003', 'dept-16', false);
      store.add('s16n6-c4', '13800004', 'dept-16', true);
      store.add('s16n6-c5', '13800005', 'dept-16', false);
      store.add('s16n6-c6', '13800006', 'dept-16', false);
      expect(store.remove(5)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(5) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(5);
      expect(store.search('dept-16').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0116 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_11700
     * @tc.name      testScenarioGrid0117
     * @tc.desc      Verify 6 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0117 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n6-c1', '13800001', 'dept-17', false);
      store.add('s17n6-c2', '13800002', 'dept-17', false);
      store.add('s17n6-c3', '13800003', 'dept-17', true);
      store.add('s17n6-c4', '13800004', 'dept-17', false);
      store.add('s17n6-c5', '13800005', 'dept-17', false);
      store.add('s17n6-c6', '13800006', 'dept-17', false);
      expect(store.remove(6)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(6) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(5);
      expect(store.search('dept-17').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0117 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_11800
     * @tc.name      testScenarioGrid0118
     * @tc.desc      Verify 6 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0118 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n6-c1', '13800001', 'dept-18', false);
      store.add('s18n6-c2', '13800002', 'dept-18', true);
      store.add('s18n6-c3', '13800003', 'dept-18', false);
      store.add('s18n6-c4', '13800004', 'dept-18', false);
      store.add('s18n6-c5', '13800005', 'dept-18', false);
      store.add('s18n6-c6', '13800006', 'dept-18', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(5);
      expect(store.search('dept-18').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0118 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_11900
     * @tc.name      testScenarioGrid0119
     * @tc.desc      Verify 6 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0119 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n6-c1', '13800001', 'dept-19', true);
      store.add('s19n6-c2', '13800002', 'dept-19', false);
      store.add('s19n6-c3', '13800003', 'dept-19', false);
      store.add('s19n6-c4', '13800004', 'dept-19', false);
      store.add('s19n6-c5', '13800005', 'dept-19', true);
      store.add('s19n6-c6', '13800006', 'dept-19', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(5);
      expect(store.search('dept-19').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0119 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP3_12000
     * @tc.name      testScenarioGrid0120
     * @tc.desc      Verify 6 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0120 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n6-c1', '13800001', 'dept-20', false);
      store.add('s20n6-c2', '13800002', 'dept-20', false);
      store.add('s20n6-c3', '13800003', 'dept-20', false);
      store.add('s20n6-c4', '13800004', 'dept-20', true);
      store.add('s20n6-c5', '13800005', 'dept-20', false);
      store.add('s20n6-c6', '13800006', 'dept-20', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(5);
      expect(store.search('dept-20').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0120 end');
    })

  })
}
