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

export default function TagStoreSequenceMatrixPart2Test(): void {
  describe('TagStoreSequenceMatrixPart2', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP2_4100
     * @tc.name      testTagSequence0041
     * @tc.desc      Verify TagStore operations R-E-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0041 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.add('t41_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t41_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t41_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0041 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_4200
     * @tc.name      testTagSequence0042
     * @tc.desc      Verify TagStore operations R-E-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0042 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0042 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_4300
     * @tc.name      testTagSequence0043
     * @tc.desc      Verify TagStore operations R-E-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0043 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0043 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_4400
     * @tc.name      testTagSequence0044
     * @tc.desc      Verify TagStore operations R-E-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0044 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0044 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_4500
     * @tc.name      testTagSequence0045
     * @tc.desc      Verify TagStore operations R-E-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0045 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0045 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_4600
     * @tc.name      testTagSequence0046
     * @tc.desc      Verify TagStore operations R-C-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0046 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.clear();
      store.add('t46_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t46_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t46_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0046 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_4700
     * @tc.name      testTagSequence0047
     * @tc.desc      Verify TagStore operations R-C-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0047 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0047 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_4800
     * @tc.name      testTagSequence0048
     * @tc.desc      Verify TagStore operations R-C-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0048 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0048 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_4900
     * @tc.name      testTagSequence0049
     * @tc.desc      Verify TagStore operations R-C-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0049 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.clear();
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0049 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_5000
     * @tc.name      testTagSequence0050
     * @tc.desc      Verify TagStore operations R-C-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0050 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0050 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_5100
     * @tc.name      testTagSequence0051
     * @tc.desc      Verify TagStore operations T-A-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0051 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('t51_2');
      store.add('t51_3');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t51_2:0:1|2:t51_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t51_2');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0051 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_5200
     * @tc.name      testTagSequence0052
     * @tc.desc      Verify TagStore operations T-A-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0052 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('t52_2');
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0052 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_5300
     * @tc.name      testTagSequence0053
     * @tc.desc      Verify TagStore operations T-A-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0053 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('t53_2');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t53_2:1:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t53_2');
        expect(first.activated).assertEqual(true);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0053 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_5400
     * @tc.name      testTagSequence0054
     * @tc.desc      Verify TagStore operations T-A-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0054 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('t54_2');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t54_2:0:0');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t54_2');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0054 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_5500
     * @tc.name      testTagSequence0055
     * @tc.desc      Verify TagStore operations T-A-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0055 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('t55_2');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0055 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_5600
     * @tc.name      testTagSequence0056
     * @tc.desc      Verify TagStore operations T-R-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0056 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.remove(1);
      store.add('t56_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t56_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t56_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0056 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_5700
     * @tc.name      testTagSequence0057
     * @tc.desc      Verify TagStore operations T-R-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0057 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0057 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_5800
     * @tc.name      testTagSequence0058
     * @tc.desc      Verify TagStore operations T-R-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0058 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0058 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_5900
     * @tc.name      testTagSequence0059
     * @tc.desc      Verify TagStore operations T-R-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0059 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0059 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_6000
     * @tc.name      testTagSequence0060
     * @tc.desc      Verify TagStore operations T-R-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0060 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0060 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_6100
     * @tc.name      testTagSequence0061
     * @tc.desc      Verify TagStore operations T-T-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0061 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('t61_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t61_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t61_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0061 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_6200
     * @tc.name      testTagSequence0062
     * @tc.desc      Verify TagStore operations T-T-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0062 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0062 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_6300
     * @tc.name      testTagSequence0063
     * @tc.desc      Verify TagStore operations T-T-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0063 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0063 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_6400
     * @tc.name      testTagSequence0064
     * @tc.desc      Verify TagStore operations T-T-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0064 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0064 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_6500
     * @tc.name      testTagSequence0065
     * @tc.desc      Verify TagStore operations T-T-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0065 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0065 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_6600
     * @tc.name      testTagSequence0066
     * @tc.desc      Verify TagStore operations T-E-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0066 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.add('t66_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t66_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t66_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0066 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_6700
     * @tc.name      testTagSequence0067
     * @tc.desc      Verify TagStore operations T-E-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0067 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0067 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_6800
     * @tc.name      testTagSequence0068
     * @tc.desc      Verify TagStore operations T-E-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0068 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0068 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_6900
     * @tc.name      testTagSequence0069
     * @tc.desc      Verify TagStore operations T-E-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0069 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0069 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_7000
     * @tc.name      testTagSequence0070
     * @tc.desc      Verify TagStore operations T-E-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0070 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0070 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_7100
     * @tc.name      testTagSequence0071
     * @tc.desc      Verify TagStore operations T-C-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0071 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.add('t71_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t71_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t71_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0071 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_7200
     * @tc.name      testTagSequence0072
     * @tc.desc      Verify TagStore operations T-C-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0072 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0072 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_7300
     * @tc.name      testTagSequence0073
     * @tc.desc      Verify TagStore operations T-C-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0073 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0073 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_7400
     * @tc.name      testTagSequence0074
     * @tc.desc      Verify TagStore operations T-C-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0074 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0074 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_7500
     * @tc.name      testTagSequence0075
     * @tc.desc      Verify TagStore operations T-C-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0075 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0075 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_7600
     * @tc.name      testTagSequence0076
     * @tc.desc      Verify TagStore operations E-A-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0076 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('t76_2');
      store.add('t76_3');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t76_2:0:1|2:t76_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t76_2');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0076 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_7700
     * @tc.name      testTagSequence0077
     * @tc.desc      Verify TagStore operations E-A-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0077 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('t77_2');
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0077 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_7800
     * @tc.name      testTagSequence0078
     * @tc.desc      Verify TagStore operations E-A-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0078 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('t78_2');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t78_2:1:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t78_2');
        expect(first.activated).assertEqual(true);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0078 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_7900
     * @tc.name      testTagSequence0079
     * @tc.desc      Verify TagStore operations E-A-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0079 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('t79_2');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t79_2:0:0');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t79_2');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0079 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP2_8000
     * @tc.name      testTagSequence0080
     * @tc.desc      Verify TagStore operations E-A-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0080 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('t80_2');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0080 end');
    })

  })
}
