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

export default function TagStoreSequenceMatrixPart4Test(): void {
  describe('TagStoreSequenceMatrixPart4', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP4_12100
     * @tc.name      testTagSequence0121
     * @tc.desc      Verify TagStore operations C-C-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0121 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.add('t121_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t121_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t121_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0121 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_12200
     * @tc.name      testTagSequence0122
     * @tc.desc      Verify TagStore operations C-C-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0122 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0122 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_12300
     * @tc.name      testTagSequence0123
     * @tc.desc      Verify TagStore operations C-C-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0123 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0123 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_12400
     * @tc.name      testTagSequence0124
     * @tc.desc      Verify TagStore operations C-C-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0124 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0124 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_12500
     * @tc.name      testTagSequence0125
     * @tc.desc      Verify TagStore operations C-C-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0125 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0125 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_12600
     * @tc.name      testTagLongSequence0126
     * @tc.desc      Verify TagStore A/T/C sequence AAAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0126 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u126_1');
      store.add('u126_2');
      store.add('u126_3');
      store.add('u126_4');
      expect(store.count()).assertEqual(4);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u126_1:0:1|2:u126_2:0:1|3:u126_3:0:1|4:u126_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0126 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_12700
     * @tc.name      testTagLongSequence0127
     * @tc.desc      Verify TagStore A/T/C sequence AAAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0127 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u127_1');
      store.add('u127_2');
      store.add('u127_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u127_1:1:1|2:u127_2:0:1|3:u127_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0127 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_12800
     * @tc.name      testTagLongSequence0128
     * @tc.desc      Verify TagStore A/T/C sequence AAAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0128 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u128_1');
      store.add('u128_2');
      store.add('u128_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0128 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_12900
     * @tc.name      testTagLongSequence0129
     * @tc.desc      Verify TagStore A/T/C sequence AATA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0129 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u129_1');
      store.add('u129_2');
      store.toggleActivated(1);
      store.add('u129_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u129_1:1:1|2:u129_2:0:1|3:u129_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0129 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_13000
     * @tc.name      testTagLongSequence0130
     * @tc.desc      Verify TagStore A/T/C sequence AATT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0130 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u130_1');
      store.add('u130_2');
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u130_1:0:1|2:u130_2:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0130 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_13100
     * @tc.name      testTagLongSequence0131
     * @tc.desc      Verify TagStore A/T/C sequence AATC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0131 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u131_1');
      store.add('u131_2');
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0131 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_13200
     * @tc.name      testTagLongSequence0132
     * @tc.desc      Verify TagStore A/T/C sequence AACA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0132 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u132_1');
      store.add('u132_2');
      store.clear();
      store.add('u132_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('3:u132_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0132 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_13300
     * @tc.name      testTagLongSequence0133
     * @tc.desc      Verify TagStore A/T/C sequence AACT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0133 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u133_1');
      store.add('u133_2');
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0133 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_13400
     * @tc.name      testTagLongSequence0134
     * @tc.desc      Verify TagStore A/T/C sequence AACC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0134 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u134_1');
      store.add('u134_2');
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0134 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_13500
     * @tc.name      testTagLongSequence0135
     * @tc.desc      Verify TagStore A/T/C sequence ATAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0135 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u135_1');
      store.toggleActivated(1);
      store.add('u135_3');
      store.add('u135_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u135_1:1:1|2:u135_3:0:1|3:u135_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0135 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_13600
     * @tc.name      testTagLongSequence0136
     * @tc.desc      Verify TagStore A/T/C sequence ATAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0136 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u136_1');
      store.toggleActivated(1);
      store.add('u136_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u136_1:0:1|2:u136_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0136 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_13700
     * @tc.name      testTagLongSequence0137
     * @tc.desc      Verify TagStore A/T/C sequence ATAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0137 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u137_1');
      store.toggleActivated(1);
      store.add('u137_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0137 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_13800
     * @tc.name      testTagLongSequence0138
     * @tc.desc      Verify TagStore A/T/C sequence ATTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0138 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u138_1');
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('u138_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u138_1:0:1|2:u138_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0138 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_13900
     * @tc.name      testTagLongSequence0139
     * @tc.desc      Verify TagStore A/T/C sequence ATTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0139 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u139_1');
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u139_1:1:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0139 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_14000
     * @tc.name      testTagLongSequence0140
     * @tc.desc      Verify TagStore A/T/C sequence ATTC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0140 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u140_1');
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0140 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_14100
     * @tc.name      testTagLongSequence0141
     * @tc.desc      Verify TagStore A/T/C sequence ATCA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0141 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u141_1');
      store.toggleActivated(1);
      store.clear();
      store.add('u141_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:u141_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0141 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_14200
     * @tc.name      testTagLongSequence0142
     * @tc.desc      Verify TagStore A/T/C sequence ATCT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0142 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u142_1');
      store.toggleActivated(1);
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0142 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_14300
     * @tc.name      testTagLongSequence0143
     * @tc.desc      Verify TagStore A/T/C sequence ATCC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0143 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u143_1');
      store.toggleActivated(1);
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0143 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_14400
     * @tc.name      testTagLongSequence0144
     * @tc.desc      Verify TagStore A/T/C sequence ACAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0144 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u144_1');
      store.clear();
      store.add('u144_3');
      store.add('u144_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:u144_3:0:1|3:u144_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0144 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_14500
     * @tc.name      testTagLongSequence0145
     * @tc.desc      Verify TagStore A/T/C sequence ACAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0145 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u145_1');
      store.clear();
      store.add('u145_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:u145_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0145 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_14600
     * @tc.name      testTagLongSequence0146
     * @tc.desc      Verify TagStore A/T/C sequence ACAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0146 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u146_1');
      store.clear();
      store.add('u146_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0146 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_14700
     * @tc.name      testTagLongSequence0147
     * @tc.desc      Verify TagStore A/T/C sequence ACTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0147 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u147_1');
      store.clear();
      store.toggleActivated(1);
      store.add('u147_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:u147_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0147 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_14800
     * @tc.name      testTagLongSequence0148
     * @tc.desc      Verify TagStore A/T/C sequence ACTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0148 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u148_1');
      store.clear();
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0148 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_14900
     * @tc.name      testTagLongSequence0149
     * @tc.desc      Verify TagStore A/T/C sequence ACTC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0149 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u149_1');
      store.clear();
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0149 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_15000
     * @tc.name      testTagLongSequence0150
     * @tc.desc      Verify TagStore A/T/C sequence ACCA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0150 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u150_1');
      store.clear();
      store.clear();
      store.add('u150_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:u150_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0150 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_15100
     * @tc.name      testTagLongSequence0151
     * @tc.desc      Verify TagStore A/T/C sequence ACCT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0151 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u151_1');
      store.clear();
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0151 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_15200
     * @tc.name      testTagLongSequence0152
     * @tc.desc      Verify TagStore A/T/C sequence ACCC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0152 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('u152_1');
      store.clear();
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0152 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_15300
     * @tc.name      testTagLongSequence0153
     * @tc.desc      Verify TagStore A/T/C sequence TAAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0153 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('u153_2');
      store.add('u153_3');
      store.add('u153_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u153_2:0:1|2:u153_3:0:1|3:u153_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0153 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_15400
     * @tc.name      testTagLongSequence0154
     * @tc.desc      Verify TagStore A/T/C sequence TAAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0154 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('u154_2');
      store.add('u154_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u154_2:1:1|2:u154_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0154 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_15500
     * @tc.name      testTagLongSequence0155
     * @tc.desc      Verify TagStore A/T/C sequence TAAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0155 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('u155_2');
      store.add('u155_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0155 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_15600
     * @tc.name      testTagLongSequence0156
     * @tc.desc      Verify TagStore A/T/C sequence TATA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0156 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('u156_2');
      store.toggleActivated(1);
      store.add('u156_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u156_2:1:1|2:u156_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0156 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_15700
     * @tc.name      testTagLongSequence0157
     * @tc.desc      Verify TagStore A/T/C sequence TATT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0157 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('u157_2');
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u157_2:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0157 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_15800
     * @tc.name      testTagLongSequence0158
     * @tc.desc      Verify TagStore A/T/C sequence TATC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0158 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('u158_2');
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0158 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_15900
     * @tc.name      testTagLongSequence0159
     * @tc.desc      Verify TagStore A/T/C sequence TACA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0159 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('u159_2');
      store.clear();
      store.add('u159_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:u159_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0159 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP4_16000
     * @tc.name      testTagLongSequence0160
     * @tc.desc      Verify TagStore A/T/C sequence TACT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0160 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('u160_2');
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0160 end');
    })

  })
}
