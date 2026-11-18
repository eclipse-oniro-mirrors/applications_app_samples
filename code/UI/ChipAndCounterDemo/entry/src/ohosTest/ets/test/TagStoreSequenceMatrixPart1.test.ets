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
import { TagStore, TagItem } from '../../../main/ets/model/ChipModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF818;
const TAG: string = '[Sample_ChipCounter]';

export default function TagStoreSequenceMatrixPart1Test(): void {
  describe('TagStoreSequenceMatrixPart1', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP1_0100
     * @tc.name      testTagSequence0001
     * @tc.desc      Verify TagStore operations A-A-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0001 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t1_1');
      store.add('t1_2');
      store.add('t1_3');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t1_1:0:1|2:t1_2:0:1|3:t1_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t1_1');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0001 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_0200
     * @tc.name      testTagSequence0002
     * @tc.desc      Verify TagStore operations A-A-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0002 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t2_1');
      store.add('t2_2');
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:t2_2:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0002 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_0300
     * @tc.name      testTagSequence0003
     * @tc.desc      Verify TagStore operations A-A-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0003 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t3_1');
      store.add('t3_2');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t3_1:1:1|2:t3_2:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t3_1');
        expect(first.activated).assertEqual(true);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0003 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_0400
     * @tc.name      testTagSequence0004
     * @tc.desc      Verify TagStore operations A-A-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0004 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t4_1');
      store.add('t4_2');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t4_1:0:0|2:t4_2:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t4_1');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0004 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_0500
     * @tc.name      testTagSequence0005
     * @tc.desc      Verify TagStore operations A-A-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0005 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t5_1');
      store.add('t5_2');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0005 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_0600
     * @tc.name      testTagSequence0006
     * @tc.desc      Verify TagStore operations A-R-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0006 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t6_1');
      store.remove(1);
      store.add('t6_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:t6_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0006 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_0700
     * @tc.name      testTagSequence0007
     * @tc.desc      Verify TagStore operations A-R-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0007 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t7_1');
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0007 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_0800
     * @tc.name      testTagSequence0008
     * @tc.desc      Verify TagStore operations A-R-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0008 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t8_1');
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0008 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_0900
     * @tc.name      testTagSequence0009
     * @tc.desc      Verify TagStore operations A-R-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0009 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t9_1');
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0009 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_1000
     * @tc.name      testTagSequence0010
     * @tc.desc      Verify TagStore operations A-R-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0010 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t10_1');
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0010 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_1100
     * @tc.name      testTagSequence0011
     * @tc.desc      Verify TagStore operations A-T-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0011 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t11_1');
      store.toggleActivated(1);
      store.add('t11_3');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t11_1:1:1|2:t11_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t11_1');
        expect(first.activated).assertEqual(true);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0011 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_1200
     * @tc.name      testTagSequence0012
     * @tc.desc      Verify TagStore operations A-T-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0012 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t12_1');
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0012 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_1300
     * @tc.name      testTagSequence0013
     * @tc.desc      Verify TagStore operations A-T-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0013 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t13_1');
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t13_1:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t13_1');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0013 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_1400
     * @tc.name      testTagSequence0014
     * @tc.desc      Verify TagStore operations A-T-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0014 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t14_1');
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t14_1:1:0');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t14_1');
        expect(first.activated).assertEqual(true);
        expect(first.enabled).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0014 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_1500
     * @tc.name      testTagSequence0015
     * @tc.desc      Verify TagStore operations A-T-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0015 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t15_1');
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0015 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_1600
     * @tc.name      testTagSequence0016
     * @tc.desc      Verify TagStore operations A-E-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0016 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t16_1');
      store.setEnabled(1, false);
      store.add('t16_3');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t16_1:0:0|2:t16_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t16_1');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0016 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_1700
     * @tc.name      testTagSequence0017
     * @tc.desc      Verify TagStore operations A-E-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0017 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t17_1');
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0017 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_1800
     * @tc.name      testTagSequence0018
     * @tc.desc      Verify TagStore operations A-E-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0018 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t18_1');
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t18_1:1:0');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t18_1');
        expect(first.activated).assertEqual(true);
        expect(first.enabled).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0018 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_1900
     * @tc.name      testTagSequence0019
     * @tc.desc      Verify TagStore operations A-E-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0019 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t19_1');
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t19_1:0:0');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t19_1');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0019 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_2000
     * @tc.name      testTagSequence0020
     * @tc.desc      Verify TagStore operations A-E-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0020 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t20_1');
      store.setEnabled(1, false);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0020 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_2100
     * @tc.name      testTagSequence0021
     * @tc.desc      Verify TagStore operations A-C-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0021 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t21_1');
      store.clear();
      store.add('t21_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:t21_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0021 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_2200
     * @tc.name      testTagSequence0022
     * @tc.desc      Verify TagStore operations A-C-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0022 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t22_1');
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0022 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_2300
     * @tc.name      testTagSequence0023
     * @tc.desc      Verify TagStore operations A-C-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0023 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t23_1');
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0023 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_2400
     * @tc.name      testTagSequence0024
     * @tc.desc      Verify TagStore operations A-C-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0024 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t24_1');
      store.clear();
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0024 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_2500
     * @tc.name      testTagSequence0025
     * @tc.desc      Verify TagStore operations A-C-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0025 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('t25_1');
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0025 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_2600
     * @tc.name      testTagSequence0026
     * @tc.desc      Verify TagStore operations R-A-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0026 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('t26_2');
      store.add('t26_3');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t26_2:0:1|2:t26_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t26_2');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0026 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_2700
     * @tc.name      testTagSequence0027
     * @tc.desc      Verify TagStore operations R-A-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0027 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('t27_2');
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0027 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_2800
     * @tc.name      testTagSequence0028
     * @tc.desc      Verify TagStore operations R-A-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0028 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('t28_2');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t28_2:1:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t28_2');
        expect(first.activated).assertEqual(true);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0028 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_2900
     * @tc.name      testTagSequence0029
     * @tc.desc      Verify TagStore operations R-A-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0029 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('t29_2');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t29_2:0:0');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t29_2');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0029 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_3000
     * @tc.name      testTagSequence0030
     * @tc.desc      Verify TagStore operations R-A-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0030 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('t30_2');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0030 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_3100
     * @tc.name      testTagSequence0031
     * @tc.desc      Verify TagStore operations R-R-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0031 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.remove(1);
      store.add('t31_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t31_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t31_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0031 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_3200
     * @tc.name      testTagSequence0032
     * @tc.desc      Verify TagStore operations R-R-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0032 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0032 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_3300
     * @tc.name      testTagSequence0033
     * @tc.desc      Verify TagStore operations R-R-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0033 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0033 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_3400
     * @tc.name      testTagSequence0034
     * @tc.desc      Verify TagStore operations R-R-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0034 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0034 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_3500
     * @tc.name      testTagSequence0035
     * @tc.desc      Verify TagStore operations R-R-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0035 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0035 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_3600
     * @tc.name      testTagSequence0036
     * @tc.desc      Verify TagStore operations R-T-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0036 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.add('t36_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t36_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t36_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0036 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_3700
     * @tc.name      testTagSequence0037
     * @tc.desc      Verify TagStore operations R-T-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0037 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0037 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_3800
     * @tc.name      testTagSequence0038
     * @tc.desc      Verify TagStore operations R-T-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0038 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0038 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_3900
     * @tc.name      testTagSequence0039
     * @tc.desc      Verify TagStore operations R-T-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0039 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0039 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP1_4000
     * @tc.name      testTagSequence0040
     * @tc.desc      Verify TagStore operations R-T-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0040 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0040 end');
    })

  })
}
