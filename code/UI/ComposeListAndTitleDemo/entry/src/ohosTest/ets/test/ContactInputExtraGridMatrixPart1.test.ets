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

export default function ContactInputExtraGridMatrixPart1Test(): void {
  describe('ContactInputExtraGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_0100
     * @tc.name      testInputExtra0001
     * @tc.desc      Verify input record 1 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0001 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('', '', '', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('');
      expect(c.phone).assertEqual('');
      expect(c.dept).assertEqual('');
      expect(c.online).assertEqual(false);
      expect(store.onlineCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0001 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_0200
     * @tc.name      testInputExtra0002
     * @tc.desc      Verify input record 2 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0002 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add(' ', ' ', ' ', true);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual(' ');
      expect(c.phone).assertEqual(' ');
      expect(c.dept).assertEqual(' ');
      expect(c.online).assertEqual(true);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0002 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_0300
     * @tc.name      testInputExtra0003
     * @tc.desc      Verify input record 3 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0003 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('A', '1', 'D', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('A');
      expect(c.phone).assertEqual('1');
      expect(c.dept).assertEqual('D');
      expect(c.online).assertEqual(false);
      expect(store.onlineCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0003 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_0400
     * @tc.name      testInputExtra0004
     * @tc.desc      Verify input record 4 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0004 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('中文', '138', '研发', true);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('中文');
      expect(c.phone).assertEqual('138');
      expect(c.dept).assertEqual('研发');
      expect(c.online).assertEqual(true);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0004 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_0500
     * @tc.name      testInputExtra0005
     * @tc.desc      Verify input record 5 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0005 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('a b', '000', 'd e', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('a b');
      expect(c.phone).assertEqual('000');
      expect(c.dept).assertEqual('d e');
      expect(c.online).assertEqual(false);
      expect(store.onlineCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0005 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_0600
     * @tc.name      testInputExtra0006
     * @tc.desc      Verify input record 6 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0006 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('xxxxxxxxxxxxxxxxxxxx', '9999999999', 'long', true);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('xxxxxxxxxxxxxxxxxxxx');
      expect(c.phone).assertEqual('9999999999');
      expect(c.dept).assertEqual('long');
      expect(c.online).assertEqual(true);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0006 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_0700
     * @tc.name      testInputExtra0007
     * @tc.desc      Verify input record 7 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0007 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('#1', '2', '#', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('#1');
      expect(c.phone).assertEqual('2');
      expect(c.dept).assertEqual('#');
      expect(c.online).assertEqual(false);
      expect(store.onlineCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0007 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_0800
     * @tc.name      testInputExtra0008
     * @tc.desc      Verify input record 8 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0008 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('tab	name', '3', 'tab	dept', true);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('tab	name');
      expect(c.phone).assertEqual('3');
      expect(c.dept).assertEqual('tab	dept');
      expect(c.online).assertEqual(true);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0008 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_0900
     * @tc.name      testInputExtra0009
     * @tc.desc      Verify input record 9 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0009 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('line\nname', '4', 'line\ndept', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('line\nname');
      expect(c.phone).assertEqual('4');
      expect(c.dept).assertEqual('line\ndept');
      expect(c.online).assertEqual(false);
      expect(store.onlineCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0009 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_1000
     * @tc.name      testInputExtra0010
     * @tc.desc      Verify input record 10 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0010 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('MixedCase', '5', 'MiXeD', true);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('MixedCase');
      expect(c.phone).assertEqual('5');
      expect(c.dept).assertEqual('MiXeD');
      expect(c.online).assertEqual(true);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0010 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_1100
     * @tc.name      testInputExtra0011
     * @tc.desc      Verify input record 11 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0011 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('null', '6', 'none', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('null');
      expect(c.phone).assertEqual('6');
      expect(c.dept).assertEqual('none');
      expect(c.online).assertEqual(false);
      expect(store.onlineCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0011 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_1200
     * @tc.name      testInputExtra0012
     * @tc.desc      Verify input record 12 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0012 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('undefined', '7', 'none', true);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('undefined');
      expect(c.phone).assertEqual('7');
      expect(c.dept).assertEqual('none');
      expect(c.online).assertEqual(true);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0012 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_1300
     * @tc.name      testInputExtra0013
     * @tc.desc      Verify input record 13 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0013 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('emoji🙂', '8', '国际', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('emoji🙂');
      expect(c.phone).assertEqual('8');
      expect(c.dept).assertEqual('国际');
      expect(c.online).assertEqual(false);
      expect(store.onlineCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0013 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_1400
     * @tc.name      testInputExtra0014
     * @tc.desc      Verify input record 14 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0014 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('-', '-', '-', true);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('-');
      expect(c.phone).assertEqual('-');
      expect(c.dept).assertEqual('-');
      expect(c.online).assertEqual(true);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0014 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_1500
     * @tc.name      testInputExtra0015
     * @tc.desc      Verify input record 15 fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputExtra0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0015 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      const c: ContactItem = store.add('0', '0', '0', false);
      expect(c.id).assertEqual(1);
      expect(c.name).assertEqual('0');
      expect(c.phone).assertEqual('0');
      expect(c.dept).assertEqual('0');
      expect(c.online).assertEqual(false);
      expect(store.onlineCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputExtra0015 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_1600
     * @tc.name      testMissingExtra0016
     * @tc.desc      Verify missing id -5 operations.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMissingExtra0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0016 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('one', '1', 'd', true);
      expect(store.remove(-5)).assertEqual(false);
      expect(store.toggleOnline(-5) === null).assertTrue();
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0016 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_1700
     * @tc.name      testMissingExtra0017
     * @tc.desc      Verify missing id -1 operations.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMissingExtra0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0017 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('one', '1', 'd', true);
      expect(store.remove(-1)).assertEqual(false);
      expect(store.toggleOnline(-1) === null).assertTrue();
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0017 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_1800
     * @tc.name      testMissingExtra0018
     * @tc.desc      Verify missing id 0 operations.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMissingExtra0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0018 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('one', '1', 'd', true);
      expect(store.remove(0)).assertEqual(false);
      expect(store.toggleOnline(0) === null).assertTrue();
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0018 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_1900
     * @tc.name      testMissingExtra0019
     * @tc.desc      Verify missing id 2 operations.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMissingExtra0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0019 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('one', '1', 'd', true);
      expect(store.remove(2)).assertEqual(false);
      expect(store.toggleOnline(2) === null).assertTrue();
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0019 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_2000
     * @tc.name      testMissingExtra0020
     * @tc.desc      Verify missing id 7 operations.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMissingExtra0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0020 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('one', '1', 'd', true);
      expect(store.remove(7)).assertEqual(false);
      expect(store.toggleOnline(7) === null).assertTrue();
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0020 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_2100
     * @tc.name      testMissingExtra0021
     * @tc.desc      Verify missing id 99 operations.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMissingExtra0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0021 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('one', '1', 'd', true);
      expect(store.remove(99)).assertEqual(false);
      expect(store.toggleOnline(99) === null).assertTrue();
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingExtra0021 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_2200
     * @tc.name      testClearExtra0022
     * @tc.desc      Verify clear after 1 keeps next id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearExtra0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0022 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('seed-1', 'p1', 'd');
      store.clear();
      const c: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(c.id).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0022 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_2300
     * @tc.name      testClearExtra0023
     * @tc.desc      Verify clear after 2 keeps next id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearExtra0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0023 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('seed-1', 'p1', 'd');
      store.add('seed-2', 'p2', 'd');
      store.clear();
      const c: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(c.id).assertEqual(3);
      expect(store.findById(1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0023 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_2400
     * @tc.name      testClearExtra0024
     * @tc.desc      Verify clear after 3 keeps next id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearExtra0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0024 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('seed-1', 'p1', 'd');
      store.add('seed-2', 'p2', 'd');
      store.add('seed-3', 'p3', 'd');
      store.clear();
      const c: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(c.id).assertEqual(4);
      expect(store.findById(1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0024 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_2500
     * @tc.name      testClearExtra0025
     * @tc.desc      Verify clear after 5 keeps next id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearExtra0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0025 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('seed-1', 'p1', 'd');
      store.add('seed-2', 'p2', 'd');
      store.add('seed-3', 'p3', 'd');
      store.add('seed-4', 'p4', 'd');
      store.add('seed-5', 'p5', 'd');
      store.clear();
      const c: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(c.id).assertEqual(6);
      expect(store.findById(1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0025 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_2600
     * @tc.name      testClearExtra0026
     * @tc.desc      Verify clear after 8 keeps next id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearExtra0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0026 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('seed-1', 'p1', 'd');
      store.add('seed-2', 'p2', 'd');
      store.add('seed-3', 'p3', 'd');
      store.add('seed-4', 'p4', 'd');
      store.add('seed-5', 'p5', 'd');
      store.add('seed-6', 'p6', 'd');
      store.add('seed-7', 'p7', 'd');
      store.add('seed-8', 'p8', 'd');
      store.clear();
      const c: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(c.id).assertEqual(9);
      expect(store.findById(1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0026 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CIXP1_2700
     * @tc.name      testClearExtra0027
     * @tc.desc      Verify clear after 10 keeps next id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearExtra0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0027 begin');
      await delayTick();
      const store: ContactStore = new ContactStore();
      store.add('seed-1', 'p1', 'd');
      store.add('seed-2', 'p2', 'd');
      store.add('seed-3', 'p3', 'd');
      store.add('seed-4', 'p4', 'd');
      store.add('seed-5', 'p5', 'd');
      store.add('seed-6', 'p6', 'd');
      store.add('seed-7', 'p7', 'd');
      store.add('seed-8', 'p8', 'd');
      store.add('seed-9', 'p9', 'd');
      store.add('seed-10', 'p10', 'd');
      store.clear();
      const c: ContactItem = store.add('after', 'p', 'd');
      expect(store.count()).assertEqual(1);
      expect(c.id).assertEqual(11);
      expect(store.findById(1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearExtra0027 end');
    })

  })
}
