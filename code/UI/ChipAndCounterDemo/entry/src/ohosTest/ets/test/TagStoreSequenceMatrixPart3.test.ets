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

export default function TagStoreSequenceMatrixPart3Test(): void {
  describe('TagStoreSequenceMatrixPart3', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP3_8100
     * @tc.name      testTagSequence0081
     * @tc.desc      Verify TagStore operations E-R-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0081 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.add('t81_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t81_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t81_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0081 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_8200
     * @tc.name      testTagSequence0082
     * @tc.desc      Verify TagStore operations E-R-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0082 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0082 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_8300
     * @tc.name      testTagSequence0083
     * @tc.desc      Verify TagStore operations E-R-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0083 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0083 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_8400
     * @tc.name      testTagSequence0084
     * @tc.desc      Verify TagStore operations E-R-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0084 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0084 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_8500
     * @tc.name      testTagSequence0085
     * @tc.desc      Verify TagStore operations E-R-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0085 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0085 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_8600
     * @tc.name      testTagSequence0086
     * @tc.desc      Verify TagStore operations E-T-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0086 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.add('t86_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t86_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t86_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0086 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_8700
     * @tc.name      testTagSequence0087
     * @tc.desc      Verify TagStore operations E-T-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0087 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0087 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_8800
     * @tc.name      testTagSequence0088
     * @tc.desc      Verify TagStore operations E-T-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0088 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0088 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_8900
     * @tc.name      testTagSequence0089
     * @tc.desc      Verify TagStore operations E-T-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0089 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0089 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_9000
     * @tc.name      testTagSequence0090
     * @tc.desc      Verify TagStore operations E-T-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0090 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0090 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_9100
     * @tc.name      testTagSequence0091
     * @tc.desc      Verify TagStore operations E-E-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0091 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.add('t91_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t91_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t91_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0091 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_9200
     * @tc.name      testTagSequence0092
     * @tc.desc      Verify TagStore operations E-E-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0092 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0092 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_9300
     * @tc.name      testTagSequence0093
     * @tc.desc      Verify TagStore operations E-E-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0093 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0093 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_9400
     * @tc.name      testTagSequence0094
     * @tc.desc      Verify TagStore operations E-E-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0094 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0094 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_9500
     * @tc.name      testTagSequence0095
     * @tc.desc      Verify TagStore operations E-E-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0095 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0095 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_9600
     * @tc.name      testTagSequence0096
     * @tc.desc      Verify TagStore operations E-C-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0096 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.clear();
      store.add('t96_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t96_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t96_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0096 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_9700
     * @tc.name      testTagSequence0097
     * @tc.desc      Verify TagStore operations E-C-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0097 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0097 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_9800
     * @tc.name      testTagSequence0098
     * @tc.desc      Verify TagStore operations E-C-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0098 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0098 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_9900
     * @tc.name      testTagSequence0099
     * @tc.desc      Verify TagStore operations E-C-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0099 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.clear();
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0099 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_10000
     * @tc.name      testTagSequence0100
     * @tc.desc      Verify TagStore operations E-C-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0100 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0100 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_10100
     * @tc.name      testTagSequence0101
     * @tc.desc      Verify TagStore operations C-A-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0101 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('t101_2');
      store.add('t101_3');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t101_2:0:1|2:t101_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t101_2');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0101 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_10200
     * @tc.name      testTagSequence0102
     * @tc.desc      Verify TagStore operations C-A-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0102 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('t102_2');
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0102 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_10300
     * @tc.name      testTagSequence0103
     * @tc.desc      Verify TagStore operations C-A-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0103 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('t103_2');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t103_2:1:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t103_2');
        expect(first.activated).assertEqual(true);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0103 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_10400
     * @tc.name      testTagSequence0104
     * @tc.desc      Verify TagStore operations C-A-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0104 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('t104_2');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t104_2:0:0');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t104_2');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0104 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_10500
     * @tc.name      testTagSequence0105
     * @tc.desc      Verify TagStore operations C-A-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0105 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('t105_2');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0105 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_10600
     * @tc.name      testTagSequence0106
     * @tc.desc      Verify TagStore operations C-R-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0106 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.remove(1);
      store.add('t106_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t106_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t106_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0106 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_10700
     * @tc.name      testTagSequence0107
     * @tc.desc      Verify TagStore operations C-R-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0107 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0107 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_10800
     * @tc.name      testTagSequence0108
     * @tc.desc      Verify TagStore operations C-R-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0108 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0108 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_10900
     * @tc.name      testTagSequence0109
     * @tc.desc      Verify TagStore operations C-R-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0109 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0109 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_11000
     * @tc.name      testTagSequence0110
     * @tc.desc      Verify TagStore operations C-R-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0110 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0110 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_11100
     * @tc.name      testTagSequence0111
     * @tc.desc      Verify TagStore operations C-T-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0111 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.add('t111_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t111_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t111_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0111 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_11200
     * @tc.name      testTagSequence0112
     * @tc.desc      Verify TagStore operations C-T-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0112 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0112 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_11300
     * @tc.name      testTagSequence0113
     * @tc.desc      Verify TagStore operations C-T-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0113 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0113 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_11400
     * @tc.name      testTagSequence0114
     * @tc.desc      Verify TagStore operations C-T-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0114 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0114 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_11500
     * @tc.name      testTagSequence0115
     * @tc.desc      Verify TagStore operations C-T-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0115 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0115 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_11600
     * @tc.name      testTagSequence0116
     * @tc.desc      Verify TagStore operations C-E-A produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0116 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.setEnabled(1, false);
      store.add('t116_3');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:t116_3:0:1');
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.text).assertEqual('t116_3');
        expect(first.activated).assertEqual(false);
        expect(first.enabled).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0116 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_11700
     * @tc.name      testTagSequence0117
     * @tc.desc      Verify TagStore operations C-E-R produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0117 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0117 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_11800
     * @tc.name      testTagSequence0118
     * @tc.desc      Verify TagStore operations C-E-T produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0118 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0118 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_11900
     * @tc.name      testTagSequence0119
     * @tc.desc      Verify TagStore operations C-E-E produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0119 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0119 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP3_12000
     * @tc.name      testTagSequence0120
     * @tc.desc      Verify TagStore operations C-E-C produce the expected state.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagSequence0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0120 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.setEnabled(1, false);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      const first: TagItem | null = store.findById(1);
      expect(first === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagSequence0120 end');
    })

  })
}
