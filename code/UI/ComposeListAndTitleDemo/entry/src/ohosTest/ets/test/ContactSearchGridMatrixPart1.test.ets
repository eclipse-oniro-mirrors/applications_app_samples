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

export default function ContactSearchGridMatrixPart1Test(): void {
  describe('ContactSearchGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_0100
     * @tc.name      testSearchGrid0001
     * @tc.desc      Verify search keyword '' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0001 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('');
      expect(hits.length).assertEqual(8);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5,6,7,8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0001 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_0200
     * @tc.name      testSearchGrid0002
     * @tc.desc      Verify search keyword 'a' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0002 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('a');
      expect(hits.length).assertEqual(8);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,3,4,5,6,7,8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0002 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_0300
     * @tc.name      testSearchGrid0003
     * @tc.desc      Verify search keyword 'AL' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0003 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('AL');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0003 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_0400
     * @tc.name      testSearchGrid0004
     * @tc.desc      Verify search keyword 'alpha' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0004 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('alpha');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0004 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_0500
     * @tc.name      testSearchGrid0005
     * @tc.desc      Verify search keyword 'beta' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0005 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('beta');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0005 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_0600
     * @tc.name      testSearchGrid0006
     * @tc.desc      Verify search keyword 'amma' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0006 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('amma');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('3,7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0006 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_0700
     * @tc.name      testSearchGrid0007
     * @tc.desc      Verify search keyword 'e' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0007 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('e');
      expect(hits.length).assertEqual(7);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,2,4,5,6,7,8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0007 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_0800
     * @tc.name      testSearchGrid0008
     * @tc.desc      Verify search keyword 'zzz' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0008 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('zzz');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0008 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_0900
     * @tc.name      testSearchGrid0009
     * @tc.desc      Verify search keyword '  ' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0009 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('  ');
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0009 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_1000
     * @tc.name      testSearchGrid0010
     * @tc.desc      Verify search keyword 'Al' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0010 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('Al');
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('1,4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0010 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_1100
     * @tc.name      testSearchGrid0011
     * @tc.desc      Verify search keyword 'ta' over fixed contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchGrid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0011 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('Alice', '13800001', 'Alpha');
      store.add('Bob', '13800002', 'Beta');
      store.add('Carol', '13800003', 'Gamma');
      store.add('Dave', '13800004', 'Alpha');
      store.add('Eve', '13800005', 'Delta');
      store.add('Frank', '13800006', 'Beta');
      store.add('Grace', '13800007', 'Gamma');
      store.add('Heidi', '13800008', 'Delta');
      const hits: ContactItem[] = store.search('ta');
      expect(hits.length).assertEqual(4);
      expect(hits.map((item: ContactItem) => item.id).join(',')).assertEqual('2,5,6,8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchGrid0011 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_1200
     * @tc.name      testSearchAll0012
     * @tc.desc      Verify empty and common prefix search for 1 contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchAll0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchAll0012 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('name-1', '13800001', 'dept-1');
      expect(store.search("").length).assertEqual(1);
      expect(store.search("name-").length).assertEqual(1);
      expect(store.search("missing").length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchAll0012 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_1300
     * @tc.name      testSearchAll0013
     * @tc.desc      Verify empty and common prefix search for 2 contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchAll0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchAll0013 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('name-1', '13800001', 'dept-1');
      store.add('name-2', '13800002', 'dept-2');
      expect(store.search("").length).assertEqual(2);
      expect(store.search("name-").length).assertEqual(2);
      expect(store.search("missing").length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchAll0013 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_1400
     * @tc.name      testSearchAll0014
     * @tc.desc      Verify empty and common prefix search for 5 contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchAll0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchAll0014 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('name-1', '13800001', 'dept-1');
      store.add('name-2', '13800002', 'dept-2');
      store.add('name-3', '13800003', 'dept-3');
      store.add('name-4', '13800004', 'dept-4');
      store.add('name-5', '13800005', 'dept-5');
      expect(store.search("").length).assertEqual(5);
      expect(store.search("name-").length).assertEqual(5);
      expect(store.search("missing").length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchAll0014 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CSHP1_1500
     * @tc.name      testSearchAll0015
     * @tc.desc      Verify empty and common prefix search for 10 contacts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSearchAll0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchAll0015 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('name-1', '13800001', 'dept-1');
      store.add('name-2', '13800002', 'dept-2');
      store.add('name-3', '13800003', 'dept-3');
      store.add('name-4', '13800004', 'dept-4');
      store.add('name-5', '13800005', 'dept-5');
      store.add('name-6', '13800006', 'dept-6');
      store.add('name-7', '13800007', 'dept-7');
      store.add('name-8', '13800008', 'dept-8');
      store.add('name-9', '13800009', 'dept-9');
      store.add('name-10', '138000010', 'dept-10');
      expect(store.search("").length).assertEqual(10);
      expect(store.search("name-").length).assertEqual(10);
      expect(store.search("missing").length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSearchAll0015 end');
    })

  })
}
