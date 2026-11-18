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

export default function ContactInputGridMatrixPart1Test(): void {
  describe('ContactInputGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_COMPOSE_CINP1_0100
     * @tc.name      testContactInput0001
     * @tc.desc      Verify contact input '' is preserved.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactInput0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0001 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('', '', '', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('');
      expect(c.phone).assertEqual('');
      expect(c.dept).assertEqual('');
      expect(c.online).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0001 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_0200
     * @tc.name      testContactInput0002
     * @tc.desc      Verify contact input ' ' is preserved.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactInput0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0002 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add(' ', ' ', ' ', true);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual(' ');
      expect(c.phone).assertEqual(' ');
      expect(c.dept).assertEqual(' ');
      expect(c.online).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0002 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_0300
     * @tc.name      testContactInput0003
     * @tc.desc      Verify contact input '中文' is preserved.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactInput0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0003 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('中文', '13800000000', '研发', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('中文');
      expect(c.phone).assertEqual('13800000000');
      expect(c.dept).assertEqual('研发');
      expect(c.online).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0003 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_0400
     * @tc.name      testContactInput0004
     * @tc.desc      Verify contact input 'a b' is preserved.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactInput0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0004 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('a b', '1', 'd', true);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('a b');
      expect(c.phone).assertEqual('1');
      expect(c.dept).assertEqual('d');
      expect(c.online).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0004 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_0500
     * @tc.name      testContactInput0005
     * @tc.desc      Verify contact input 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' is preserved.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactInput0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0005 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2', 'y', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(c.phone).assertEqual('2');
      expect(c.dept).assertEqual('y');
      expect(c.online).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0005 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_0600
     * @tc.name      testContactInput0006
     * @tc.desc      Verify contact input 'A#B' is preserved.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactInput0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0006 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('A#B', '3', 'Z', true);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('A#B');
      expect(c.phone).assertEqual('3');
      expect(c.dept).assertEqual('Z');
      expect(c.online).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0006 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_0700
     * @tc.name      testContactInput0007
     * @tc.desc      Verify contact input 'null' is preserved.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactInput0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0007 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('null', '4', 'none', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('null');
      expect(c.phone).assertEqual('4');
      expect(c.dept).assertEqual('none');
      expect(c.online).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactInput0007 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_0800
     * @tc.name      testContactMissing0008
     * @tc.desc      Verify remove/toggle missing id 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactMissing0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactMissing0008 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('only', '1', 'd');
      expect(store.remove(0)).assertEqual(false);
      expect(store.toggleOnline(0) === null).assertTrue();
      expect(store.count()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactMissing0008 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_0900
     * @tc.name      testContactMissing0009
     * @tc.desc      Verify remove/toggle missing id -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactMissing0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactMissing0009 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('only', '1', 'd');
      expect(store.remove(-1)).assertEqual(false);
      expect(store.toggleOnline(-1) === null).assertTrue();
      expect(store.count()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactMissing0009 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_1000
     * @tc.name      testContactMissing0010
     * @tc.desc      Verify remove/toggle missing id 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactMissing0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactMissing0010 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('only', '1', 'd');
      expect(store.remove(2)).assertEqual(false);
      expect(store.toggleOnline(2) === null).assertTrue();
      expect(store.count()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactMissing0010 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_1100
     * @tc.name      testContactMissing0011
     * @tc.desc      Verify remove/toggle missing id 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactMissing0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactMissing0011 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('only', '1', 'd');
      expect(store.remove(99)).assertEqual(false);
      expect(store.toggleOnline(99) === null).assertTrue();
      expect(store.count()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactMissing0011 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_1200
     * @tc.name      testContactMissing0012
     * @tc.desc      Verify remove existing id 1 then toggle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContactMissing0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactMissing0012 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('only', '1', 'd');
      expect(store.remove(1)).assertEqual(true);
      expect(store.toggleOnline(1) === null).assertTrue();
      expect(store.count()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContactMissing0012 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_1300
     * @tc.name      testClearKeepsNextId0013
     * @tc.desc      Verify clear keeps id sequence after 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearKeepsNextId0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearKeepsNextId0013 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('e1', 'p1', 'd');
      store.clear();
      const after: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(after.id).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearKeepsNextId0013 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_1400
     * @tc.name      testClearKeepsNextId0014
     * @tc.desc      Verify clear keeps id sequence after 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearKeepsNextId0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearKeepsNextId0014 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('e1', 'p1', 'd');
      store.add('e2', 'p2', 'd');
      store.clear();
      const after: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(after.id).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearKeepsNextId0014 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_1500
     * @tc.name      testClearKeepsNextId0015
     * @tc.desc      Verify clear keeps id sequence after 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearKeepsNextId0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearKeepsNextId0015 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('e1', 'p1', 'd');
      store.add('e2', 'p2', 'd');
      store.add('e3', 'p3', 'd');
      store.add('e4', 'p4', 'd');
      store.add('e5', 'p5', 'd');
      store.clear();
      const after: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(after.id).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearKeepsNextId0015 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_1600
     * @tc.name      testClearKeepsNextId0016
     * @tc.desc      Verify clear keeps id sequence after 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearKeepsNextId0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearKeepsNextId0016 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('e1', 'p1', 'd');
      store.add('e2', 'p2', 'd');
      store.add('e3', 'p3', 'd');
      store.add('e4', 'p4', 'd');
      store.add('e5', 'p5', 'd');
      store.add('e6', 'p6', 'd');
      store.add('e7', 'p7', 'd');
      store.add('e8', 'p8', 'd');
      store.add('e9', 'p9', 'd');
      store.add('e10', 'p10', 'd');
      store.clear();
      const after: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(after.id).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearKeepsNextId0016 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CINP1_1700
     * @tc.name      testClearKeepsNextId0017
     * @tc.desc      Verify clear keeps id sequence after 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearKeepsNextId0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearKeepsNextId0017 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('e1', 'p1', 'd');
      store.add('e2', 'p2', 'd');
      store.add('e3', 'p3', 'd');
      store.add('e4', 'p4', 'd');
      store.add('e5', 'p5', 'd');
      store.add('e6', 'p6', 'd');
      store.add('e7', 'p7', 'd');
      store.add('e8', 'p8', 'd');
      store.add('e9', 'p9', 'd');
      store.add('e10', 'p10', 'd');
      store.add('e11', 'p11', 'd');
      store.add('e12', 'p12', 'd');
      store.add('e13', 'p13', 'd');
      store.add('e14', 'p14', 'd');
      store.add('e15', 'p15', 'd');
      store.add('e16', 'p16', 'd');
      store.add('e17', 'p17', 'd');
      store.add('e18', 'p18', 'd');
      store.add('e19', 'p19', 'd');
      store.add('e20', 'p20', 'd');
      store.clear();
      const after: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(after.id).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearKeepsNextId0017 end');
    })

  })
}
