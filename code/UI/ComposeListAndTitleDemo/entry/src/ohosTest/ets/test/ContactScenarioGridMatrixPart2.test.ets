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

export default function ContactScenarioGridMatrixPart2Test(): void {
  describe('ContactScenarioGridMatrixPart2', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_4100
     * @tc.name      testScenarioGrid0041
     * @tc.desc      Verify 3 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0041 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n3-c1', '13800001', 'dept-1', false);
      store.add('s1n3-c2', '13800002', 'dept-1', false);
      store.add('s1n3-c3', '13800003', 'dept-1', true);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(2);
      expect(store.search('dept-1').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0041 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_4200
     * @tc.name      testScenarioGrid0042
     * @tc.desc      Verify 3 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0042 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n3-c1', '13800001', 'dept-2', false);
      store.add('s2n3-c2', '13800002', 'dept-2', true);
      store.add('s2n3-c3', '13800003', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(2);
      expect(store.search('dept-2').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0042 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_4300
     * @tc.name      testScenarioGrid0043
     * @tc.desc      Verify 3 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0043 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n3-c1', '13800001', 'dept-3', true);
      store.add('s3n3-c2', '13800002', 'dept-3', false);
      store.add('s3n3-c3', '13800003', 'dept-3', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(2);
      expect(store.search('dept-3').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0043 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_4400
     * @tc.name      testScenarioGrid0044
     * @tc.desc      Verify 3 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0044 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n3-c1', '13800001', 'dept-4', false);
      store.add('s4n3-c2', '13800002', 'dept-4', false);
      store.add('s4n3-c3', '13800003', 'dept-4', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(2);
      expect(store.search('dept-4').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0044 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_4500
     * @tc.name      testScenarioGrid0045
     * @tc.desc      Verify 3 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0045 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n3-c1', '13800001', 'dept-5', false);
      store.add('s5n3-c2', '13800002', 'dept-5', false);
      store.add('s5n3-c3', '13800003', 'dept-5', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(2);
      expect(store.search('dept-5').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0045 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_4600
     * @tc.name      testScenarioGrid0046
     * @tc.desc      Verify 3 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0046 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n3-c1', '13800001', 'dept-6', false);
      store.add('s6n3-c2', '13800002', 'dept-6', true);
      store.add('s6n3-c3', '13800003', 'dept-6', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(2);
      expect(store.search('dept-6').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0046 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_4700
     * @tc.name      testScenarioGrid0047
     * @tc.desc      Verify 3 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0047 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n3-c1', '13800001', 'dept-7', true);
      store.add('s7n3-c2', '13800002', 'dept-7', false);
      store.add('s7n3-c3', '13800003', 'dept-7', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(false);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(2);
      expect(store.search('dept-7').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0047 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_4800
     * @tc.name      testScenarioGrid0048
     * @tc.desc      Verify 3 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0048 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n3-c1', '13800001', 'dept-8', false);
      store.add('s8n3-c2', '13800002', 'dept-8', false);
      store.add('s8n3-c3', '13800003', 'dept-8', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(2);
      expect(store.search('dept-8').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0048 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_4900
     * @tc.name      testScenarioGrid0049
     * @tc.desc      Verify 3 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0049 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n3-c1', '13800001', 'dept-9', false);
      store.add('s9n3-c2', '13800002', 'dept-9', false);
      store.add('s9n3-c3', '13800003', 'dept-9', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(2);
      expect(store.search('dept-9').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0049 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_5000
     * @tc.name      testScenarioGrid0050
     * @tc.desc      Verify 3 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0050 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n3-c1', '13800001', 'dept-10', false);
      store.add('s10n3-c2', '13800002', 'dept-10', true);
      store.add('s10n3-c3', '13800003', 'dept-10', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(2);
      expect(store.search('dept-10').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0050 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_5100
     * @tc.name      testScenarioGrid0051
     * @tc.desc      Verify 3 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0051 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n3-c1', '13800001', 'dept-11', true);
      store.add('s11n3-c2', '13800002', 'dept-11', false);
      store.add('s11n3-c3', '13800003', 'dept-11', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(false);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(2);
      expect(store.search('dept-11').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0051 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_5200
     * @tc.name      testScenarioGrid0052
     * @tc.desc      Verify 3 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0052 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n3-c1', '13800001', 'dept-12', false);
      store.add('s12n3-c2', '13800002', 'dept-12', false);
      store.add('s12n3-c3', '13800003', 'dept-12', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(2);
      expect(store.search('dept-12').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0052 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_5300
     * @tc.name      testScenarioGrid0053
     * @tc.desc      Verify 3 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0053 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n3-c1', '13800001', 'dept-13', false);
      store.add('s13n3-c2', '13800002', 'dept-13', false);
      store.add('s13n3-c3', '13800003', 'dept-13', true);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(2);
      expect(store.search('dept-13').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0053 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_5400
     * @tc.name      testScenarioGrid0054
     * @tc.desc      Verify 3 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0054 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n3-c1', '13800001', 'dept-14', false);
      store.add('s14n3-c2', '13800002', 'dept-14', true);
      store.add('s14n3-c3', '13800003', 'dept-14', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(2);
      expect(store.search('dept-14').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0054 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_5500
     * @tc.name      testScenarioGrid0055
     * @tc.desc      Verify 3 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0055 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n3-c1', '13800001', 'dept-15', true);
      store.add('s15n3-c2', '13800002', 'dept-15', false);
      store.add('s15n3-c3', '13800003', 'dept-15', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(2);
      expect(store.search('dept-15').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0055 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_5600
     * @tc.name      testScenarioGrid0056
     * @tc.desc      Verify 3 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0056 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n3-c1', '13800001', 'dept-16', false);
      store.add('s16n3-c2', '13800002', 'dept-16', false);
      store.add('s16n3-c3', '13800003', 'dept-16', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(2);
      expect(store.search('dept-16').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0056 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_5700
     * @tc.name      testScenarioGrid0057
     * @tc.desc      Verify 3 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0057 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n3-c1', '13800001', 'dept-17', false);
      store.add('s17n3-c2', '13800002', 'dept-17', false);
      store.add('s17n3-c3', '13800003', 'dept-17', true);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(2);
      expect(store.search('dept-17').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0057 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_5800
     * @tc.name      testScenarioGrid0058
     * @tc.desc      Verify 3 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0058 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n3-c1', '13800001', 'dept-18', false);
      store.add('s18n3-c2', '13800002', 'dept-18', true);
      store.add('s18n3-c3', '13800003', 'dept-18', false);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(2);
      expect(store.search('dept-18').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0058 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_5900
     * @tc.name      testScenarioGrid0059
     * @tc.desc      Verify 3 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0059 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n3-c1', '13800001', 'dept-19', true);
      store.add('s19n3-c2', '13800002', 'dept-19', false);
      store.add('s19n3-c3', '13800003', 'dept-19', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(false);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(2);
      expect(store.search('dept-19').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0059 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_6000
     * @tc.name      testScenarioGrid0060
     * @tc.desc      Verify 3 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0060 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n3-c1', '13800001', 'dept-20', false);
      store.add('s20n3-c2', '13800002', 'dept-20', false);
      store.add('s20n3-c3', '13800003', 'dept-20', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(2);
      expect(store.search('dept-20').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0060 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_6100
     * @tc.name      testScenarioGrid0061
     * @tc.desc      Verify 4 contacts scenario 1 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0061 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s1n4-c1', '13800001', 'dept-1', false);
      store.add('s1n4-c2', '13800002', 'dept-1', false);
      store.add('s1n4-c3', '13800003', 'dept-1', true);
      store.add('s1n4-c4', '13800004', 'dept-1', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s1').length).assertEqual(3);
      expect(store.search('dept-1').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0061 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_6200
     * @tc.name      testScenarioGrid0062
     * @tc.desc      Verify 4 contacts scenario 2 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0062 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s2n4-c1', '13800001', 'dept-2', false);
      store.add('s2n4-c2', '13800002', 'dept-2', true);
      store.add('s2n4-c3', '13800003', 'dept-2', false);
      store.add('s2n4-c4', '13800004', 'dept-2', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(null);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s2').length).assertEqual(3);
      expect(store.search('dept-2').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0062 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_6300
     * @tc.name      testScenarioGrid0063
     * @tc.desc      Verify 4 contacts scenario 3 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0063 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s3n4-c1', '13800001', 'dept-3', true);
      store.add('s3n4-c2', '13800002', 'dept-3', false);
      store.add('s3n4-c3', '13800003', 'dept-3', false);
      store.add('s3n4-c4', '13800004', 'dept-3', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s3').length).assertEqual(3);
      expect(store.search('dept-3').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0063 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_6400
     * @tc.name      testScenarioGrid0064
     * @tc.desc      Verify 4 contacts scenario 4 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0064 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s4n4-c1', '13800001', 'dept-4', false);
      store.add('s4n4-c2', '13800002', 'dept-4', false);
      store.add('s4n4-c3', '13800003', 'dept-4', false);
      store.add('s4n4-c4', '13800004', 'dept-4', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s4').length).assertEqual(3);
      expect(store.search('dept-4').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0064 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_6500
     * @tc.name      testScenarioGrid0065
     * @tc.desc      Verify 4 contacts scenario 5 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0065 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s5n4-c1', '13800001', 'dept-5', false);
      store.add('s5n4-c2', '13800002', 'dept-5', false);
      store.add('s5n4-c3', '13800003', 'dept-5', true);
      store.add('s5n4-c4', '13800004', 'dept-5', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s5').length).assertEqual(3);
      expect(store.search('dept-5').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0065 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_6600
     * @tc.name      testScenarioGrid0066
     * @tc.desc      Verify 4 contacts scenario 6 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0066 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s6n4-c1', '13800001', 'dept-6', false);
      store.add('s6n4-c2', '13800002', 'dept-6', true);
      store.add('s6n4-c3', '13800003', 'dept-6', false);
      store.add('s6n4-c4', '13800004', 'dept-6', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(null);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s6').length).assertEqual(3);
      expect(store.search('dept-6').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0066 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_6700
     * @tc.name      testScenarioGrid0067
     * @tc.desc      Verify 4 contacts scenario 7 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0067 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s7n4-c1', '13800001', 'dept-7', true);
      store.add('s7n4-c2', '13800002', 'dept-7', false);
      store.add('s7n4-c3', '13800003', 'dept-7', false);
      store.add('s7n4-c4', '13800004', 'dept-7', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s7').length).assertEqual(3);
      expect(store.search('dept-7').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0067 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_6800
     * @tc.name      testScenarioGrid0068
     * @tc.desc      Verify 4 contacts scenario 8 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0068 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s8n4-c1', '13800001', 'dept-8', false);
      store.add('s8n4-c2', '13800002', 'dept-8', false);
      store.add('s8n4-c3', '13800003', 'dept-8', false);
      store.add('s8n4-c4', '13800004', 'dept-8', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s8').length).assertEqual(3);
      expect(store.search('dept-8').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0068 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_6900
     * @tc.name      testScenarioGrid0069
     * @tc.desc      Verify 4 contacts scenario 9 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0069 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s9n4-c1', '13800001', 'dept-9', false);
      store.add('s9n4-c2', '13800002', 'dept-9', false);
      store.add('s9n4-c3', '13800003', 'dept-9', true);
      store.add('s9n4-c4', '13800004', 'dept-9', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s9').length).assertEqual(3);
      expect(store.search('dept-9').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0069 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_7000
     * @tc.name      testScenarioGrid0070
     * @tc.desc      Verify 4 contacts scenario 10 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0070 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s10n4-c1', '13800001', 'dept-10', false);
      store.add('s10n4-c2', '13800002', 'dept-10', true);
      store.add('s10n4-c3', '13800003', 'dept-10', false);
      store.add('s10n4-c4', '13800004', 'dept-10', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(null);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s10').length).assertEqual(3);
      expect(store.search('dept-10').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0070 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_7100
     * @tc.name      testScenarioGrid0071
     * @tc.desc      Verify 4 contacts scenario 11 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0071 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s11n4-c1', '13800001', 'dept-11', true);
      store.add('s11n4-c2', '13800002', 'dept-11', false);
      store.add('s11n4-c3', '13800003', 'dept-11', false);
      store.add('s11n4-c4', '13800004', 'dept-11', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s11').length).assertEqual(3);
      expect(store.search('dept-11').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0071 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_7200
     * @tc.name      testScenarioGrid0072
     * @tc.desc      Verify 4 contacts scenario 12 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0072 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s12n4-c1', '13800001', 'dept-12', false);
      store.add('s12n4-c2', '13800002', 'dept-12', false);
      store.add('s12n4-c3', '13800003', 'dept-12', false);
      store.add('s12n4-c4', '13800004', 'dept-12', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s12').length).assertEqual(3);
      expect(store.search('dept-12').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0072 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_7300
     * @tc.name      testScenarioGrid0073
     * @tc.desc      Verify 4 contacts scenario 13 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0073 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s13n4-c1', '13800001', 'dept-13', false);
      store.add('s13n4-c2', '13800002', 'dept-13', false);
      store.add('s13n4-c3', '13800003', 'dept-13', true);
      store.add('s13n4-c4', '13800004', 'dept-13', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s13').length).assertEqual(3);
      expect(store.search('dept-13').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0073 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_7400
     * @tc.name      testScenarioGrid0074
     * @tc.desc      Verify 4 contacts scenario 14 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0074 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s14n4-c1', '13800001', 'dept-14', false);
      store.add('s14n4-c2', '13800002', 'dept-14', true);
      store.add('s14n4-c3', '13800003', 'dept-14', false);
      store.add('s14n4-c4', '13800004', 'dept-14', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(null);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s14').length).assertEqual(3);
      expect(store.search('dept-14').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0074 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_7500
     * @tc.name      testScenarioGrid0075
     * @tc.desc      Verify 4 contacts scenario 15 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0075 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s15n4-c1', '13800001', 'dept-15', true);
      store.add('s15n4-c2', '13800002', 'dept-15', false);
      store.add('s15n4-c3', '13800003', 'dept-15', false);
      store.add('s15n4-c4', '13800004', 'dept-15', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s15').length).assertEqual(3);
      expect(store.search('dept-15').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0075 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_7600
     * @tc.name      testScenarioGrid0076
     * @tc.desc      Verify 4 contacts scenario 16 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0076 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s16n4-c1', '13800001', 'dept-16', false);
      store.add('s16n4-c2', '13800002', 'dept-16', false);
      store.add('s16n4-c3', '13800003', 'dept-16', false);
      store.add('s16n4-c4', '13800004', 'dept-16', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s16').length).assertEqual(3);
      expect(store.search('dept-16').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0076 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_7700
     * @tc.name      testScenarioGrid0077
     * @tc.desc      Verify 4 contacts scenario 17 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0077 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s17n4-c1', '13800001', 'dept-17', false);
      store.add('s17n4-c2', '13800002', 'dept-17', false);
      store.add('s17n4-c3', '13800003', 'dept-17', true);
      store.add('s17n4-c4', '13800004', 'dept-17', false);
      expect(store.remove(2)).assertEqual(true);
      expect(store.toggleOnline(4)).assertEqual(true);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(2) === null).assertTrue();
      expect(store.search('s17').length).assertEqual(3);
      expect(store.search('dept-17').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0077 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_7800
     * @tc.name      testScenarioGrid0078
     * @tc.desc      Verify 4 contacts scenario 18 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0078 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s18n4-c1', '13800001', 'dept-18', false);
      store.add('s18n4-c2', '13800002', 'dept-18', true);
      store.add('s18n4-c3', '13800003', 'dept-18', false);
      store.add('s18n4-c4', '13800004', 'dept-18', false);
      expect(store.remove(3)).assertEqual(true);
      expect(store.toggleOnline(3)).assertEqual(null);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(3) === null).assertTrue();
      expect(store.search('s18').length).assertEqual(3);
      expect(store.search('dept-18').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0078 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_7900
     * @tc.name      testScenarioGrid0079
     * @tc.desc      Verify 4 contacts scenario 19 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0079 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s19n4-c1', '13800001', 'dept-19', true);
      store.add('s19n4-c2', '13800002', 'dept-19', false);
      store.add('s19n4-c3', '13800003', 'dept-19', false);
      store.add('s19n4-c4', '13800004', 'dept-19', false);
      expect(store.remove(4)).assertEqual(true);
      expect(store.toggleOnline(2)).assertEqual(true);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(4) === null).assertTrue();
      expect(store.search('s19').length).assertEqual(3);
      expect(store.search('dept-19').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0079 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSSP2_8000
     * @tc.name      testScenarioGrid0080
     * @tc.desc      Verify 4 contacts scenario 20 remove/toggle/search.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0080 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('s20n4-c1', '13800001', 'dept-20', false);
      store.add('s20n4-c2', '13800002', 'dept-20', false);
      store.add('s20n4-c3', '13800003', 'dept-20', false);
      store.add('s20n4-c4', '13800004', 'dept-20', true);
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1)).assertEqual(null);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
      expect(store.search('s20').length).assertEqual(3);
      expect(store.search('dept-20').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0080 end');
    })

  })
}
