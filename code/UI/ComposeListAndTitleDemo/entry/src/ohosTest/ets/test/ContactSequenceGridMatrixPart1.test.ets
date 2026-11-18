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

export default function ContactSequenceGridMatrixPart1Test(): void {
  describe('ContactSequenceGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_0100
     * @tc.name      testContactSequence0001
     * @tc.desc      Verify contact operations sequence 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0001 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-0-0', '13800001', 'dept-0');
      store.add('user-0-1', '13800002', 'dept-1');
      store.add('user-0-2', '13800003', 'dept-2');
      store.add('user-0-3', '13800004', 'dept-3');
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0001 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_0200
     * @tc.name      testContactSequence0002
     * @tc.desc      Verify contact operations sequence 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0002 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-1-0', '13800001', 'dept-0');
      store.add('user-1-1', '13800002', 'dept-1');
      store.toggleOnline(1);
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0002 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_0300
     * @tc.name      testContactSequence0003
     * @tc.desc      Verify contact operations sequence 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0003 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-2-0', '13800001', 'dept-0');
      store.toggleOnline(1);
      store.toggleOnline(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0003 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_0400
     * @tc.name      testContactSequence0004
     * @tc.desc      Verify contact operations sequence 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0004 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-3-0', '13800001', 'dept-0');
      store.remove(1);
      store.add('user-3-2', '13800002', 'dept-2');
      store.add('user-3-3', '13800003', 'dept-3');
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('2,3');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0004 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_0500
     * @tc.name      testContactSequence0005
     * @tc.desc      Verify contact operations sequence 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0005 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-4-0', '13800001', 'dept-0');
      store.add('user-4-1', '13800002', 'dept-1');
      store.remove(1);
      store.toggleOnline(1);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0005 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_0600
     * @tc.name      testContactSequence0006
     * @tc.desc      Verify contact operations sequence 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0006 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-5-0', '13800001', 'dept-0');
      store.add('user-5-1', '13800002', 'dept-1');
      store.add('user-5-2', '13800003', 'dept-2');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0006 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_0700
     * @tc.name      testContactSequence0007
     * @tc.desc      Verify contact operations sequence 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0007 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-6-0', '13800001', 'dept-0');
      store.toggleOnline(1);
      store.add('user-6-2', '13800002', 'dept-2');
      store.toggleOnline(1);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('1,2');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0007 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_0800
     * @tc.name      testContactSequence0008
     * @tc.desc      Verify contact operations sequence 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0008 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-7-0', '13800001', 'dept-0');
      store.add('user-7-1', '13800002', 'dept-1');
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0008 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_0900
     * @tc.name      testContactSequence0009
     * @tc.desc      Verify contact operations sequence 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0009 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-8-0', '13800001', 'dept-0');
      store.toggleOnline(1);
      store.remove(1);
      store.add('user-8-3', '13800002', 'dept-3');
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0009 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_1000
     * @tc.name      testContactSequence0010
     * @tc.desc      Verify contact operations sequence 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0010 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-9-0', '13800001', 'dept-0');
      store.add('user-9-1', '13800002', 'dept-1');
      store.add('user-9-2', '13800003', 'dept-2');
      store.add('user-9-3', '13800004', 'dept-3');
      store.add('user-9-4', '13800005', 'dept-4');
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0010 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_1100
     * @tc.name      testContactSequence0011
     * @tc.desc      Verify contact operations sequence 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0011 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-10-0', '13800001', 'dept-0');
      store.remove(1);
      store.remove(0);
      store.add('user-10-3', '13800002', 'dept-3');
      store.toggleOnline(1);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0011 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_1200
     * @tc.name      testContactSequence0012
     * @tc.desc      Verify contact operations sequence 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0012 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-11-0', '13800001', 'dept-0');
      store.add('user-11-1', '13800002', 'dept-1');
      store.clear();
      store.add('user-11-3', '13800003', 'dept-3');
      store.add('user-11-4', '13800004', 'dept-4');
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('3,4');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0012 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_1300
     * @tc.name      testContactSequence0013
     * @tc.desc      Verify contact operations sequence 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0013 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-12-0', '13800001', 'dept-0');
      store.toggleOnline(1);
      store.toggleOnline(1);
      store.toggleOnline(1);
      store.toggleOnline(1);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0013 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_1400
     * @tc.name      testContactSequence0014
     * @tc.desc      Verify contact operations sequence 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0014 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-13-0', '13800001', 'dept-0');
      store.add('user-13-1', '13800002', 'dept-1');
      store.toggleOnline(1);
      store.remove(1);
      store.toggleOnline(1);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0014 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_1500
     * @tc.name      testContactSequence0015
     * @tc.desc      Verify contact operations sequence 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0015 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-14-0', '13800001', 'dept-0');
      store.remove(1);
      store.toggleOnline(0);
      store.add('user-14-3', '13800002', 'dept-3');
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0015 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_1600
     * @tc.name      testContactSequence0016
     * @tc.desc      Verify contact operations sequence 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0016 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-15-0', '13800001', 'dept-0');
      store.add('user-15-1', '13800002', 'dept-1');
      store.add('user-15-2', '13800003', 'dept-2');
      store.toggleOnline(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0016 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_1700
     * @tc.name      testContactSequence0017
     * @tc.desc      Verify contact operations sequence 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0017 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-16-0', '13800001', 'dept-0');
      store.toggleOnline(1);
      store.add('user-16-2', '13800002', 'dept-2');
      store.remove(1);
      store.add('user-16-4', '13800003', 'dept-4');
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('2,3');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0017 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_1800
     * @tc.name      testContactSequence0018
     * @tc.desc      Verify contact operations sequence 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0018 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-17-0', '13800001', 'dept-0');
      store.add('user-17-1', '13800002', 'dept-1');
      store.remove(1);
      store.toggleOnline(1);
      store.toggleOnline(1);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('2');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0018 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_1900
     * @tc.name      testContactSequence0019
     * @tc.desc      Verify contact operations sequence 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0019 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-18-0', '13800001', 'dept-0');
      store.clear();
      store.add('user-18-2', '13800002', 'dept-2');
      store.add('user-18-3', '13800003', 'dept-3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0019 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_2000
     * @tc.name      testContactSequence0020
     * @tc.desc      Verify contact operations sequence 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0020 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('user-19-0', '13800001', 'dept-0');
      store.add('user-19-1', '13800002', 'dept-1');
      store.toggleOnline(1);
      store.toggleOnline(1);
      store.add('user-19-4', '13800003', 'dept-4');
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactSequence0020 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_2100
     * @tc.name      testContactAddGrid0021
     * @tc.desc      Verify add 0 contacts and online count.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactAddGrid0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0021 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0021 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_2200
     * @tc.name      testContactAddGrid0022
     * @tc.desc      Verify add 1 contacts and online count.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactAddGrid0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0022 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('c1', '13800001', 'd1', false);
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.findById(1) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0022 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_2300
     * @tc.name      testContactAddGrid0023
     * @tc.desc      Verify add 2 contacts and online count.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactAddGrid0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0023 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('c1', '13800001', 'd1', false);
      store.add('c2', '13800002', 'd2', true);
      expect(store.count()).assertEqual(2);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0023 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_2400
     * @tc.name      testContactAddGrid0024
     * @tc.desc      Verify add 3 contacts and online count.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactAddGrid0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0024 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('c1', '13800001', 'd1', false);
      store.add('c2', '13800002', 'd2', true);
      store.add('c3', '13800003', 'd3', false);
      expect(store.count()).assertEqual(3);
      expect(store.onlineCount()).assertEqual(1);
      expect(store.findById(1) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0024 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_2500
     * @tc.name      testContactAddGrid0025
     * @tc.desc      Verify add 5 contacts and online count.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactAddGrid0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0025 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('c1', '13800001', 'd1', false);
      store.add('c2', '13800002', 'd2', true);
      store.add('c3', '13800003', 'd3', false);
      store.add('c4', '13800004', 'd4', true);
      store.add('c5', '13800005', 'd5', false);
      expect(store.count()).assertEqual(5);
      expect(store.onlineCount()).assertEqual(2);
      expect(store.findById(1) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0025 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_2600
     * @tc.name      testContactAddGrid0026
     * @tc.desc      Verify add 8 contacts and online count.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactAddGrid0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0026 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('c1', '13800001', 'd1', false);
      store.add('c2', '13800002', 'd2', true);
      store.add('c3', '13800003', 'd3', false);
      store.add('c4', '13800004', 'd4', true);
      store.add('c5', '13800005', 'd5', false);
      store.add('c6', '13800006', 'd6', true);
      store.add('c7', '13800007', 'd7', false);
      store.add('c8', '13800008', 'd8', true);
      expect(store.count()).assertEqual(8);
      expect(store.onlineCount()).assertEqual(4);
      expect(store.findById(1) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0026 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSGP1_2700
     * @tc.name      testContactAddGrid0027
     * @tc.desc      Verify add 12 contacts and online count.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactAddGrid0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0027 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('c1', '13800001', 'd1', false);
      store.add('c2', '13800002', 'd2', true);
      store.add('c3', '13800003', 'd3', false);
      store.add('c4', '13800004', 'd4', true);
      store.add('c5', '13800005', 'd5', false);
      store.add('c6', '13800006', 'd6', true);
      store.add('c7', '13800007', 'd7', false);
      store.add('c8', '13800008', 'd8', true);
      store.add('c9', '13800009', 'd9', false);
      store.add('c10', '138000010', 'd10', true);
      store.add('c11', '138000011', 'd11', false);
      store.add('c12', '138000012', 'd12', true);
      expect(store.count()).assertEqual(12);
      expect(store.onlineCount()).assertEqual(6);
      expect(store.findById(1) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactAddGrid0027 end');
    })

  })
}
