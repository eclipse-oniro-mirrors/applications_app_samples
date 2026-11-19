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

export default function TagStoreSequenceMatrixPart5Test(): void {
  describe('TagStoreSequenceMatrixPart5', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP5_16100
     * @tc.name      testTagLongSequence0161
     * @tc.desc      Verify TagStore A/T/C sequence TACC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0161 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('u161_2');
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0161 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_16200
     * @tc.name      testTagLongSequence0162
     * @tc.desc      Verify TagStore A/T/C sequence TTAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0162 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('u162_3');
      store.add('u162_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u162_3:0:1|2:u162_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0162 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_16300
     * @tc.name      testTagLongSequence0163
     * @tc.desc      Verify TagStore A/T/C sequence TTAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0163 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('u163_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u163_3:1:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0163 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_16400
     * @tc.name      testTagLongSequence0164
     * @tc.desc      Verify TagStore A/T/C sequence TTAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0164 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('u164_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0164 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_16500
     * @tc.name      testTagLongSequence0165
     * @tc.desc      Verify TagStore A/T/C sequence TTTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0165 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('u165_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u165_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0165 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_16600
     * @tc.name      testTagLongSequence0166
     * @tc.desc      Verify TagStore A/T/C sequence TTTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0166 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0166 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_16700
     * @tc.name      testTagLongSequence0167
     * @tc.desc      Verify TagStore A/T/C sequence TTTC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0167 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0167 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_16800
     * @tc.name      testTagLongSequence0168
     * @tc.desc      Verify TagStore A/T/C sequence TTCA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0168 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.clear();
      store.add('u168_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u168_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0168 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_16900
     * @tc.name      testTagLongSequence0169
     * @tc.desc      Verify TagStore A/T/C sequence TTCT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0169 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0169 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_17000
     * @tc.name      testTagLongSequence0170
     * @tc.desc      Verify TagStore A/T/C sequence TTCC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0170 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0170 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_17100
     * @tc.name      testTagLongSequence0171
     * @tc.desc      Verify TagStore A/T/C sequence TCAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0171 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.add('u171_3');
      store.add('u171_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u171_3:0:1|2:u171_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0171 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_17200
     * @tc.name      testTagLongSequence0172
     * @tc.desc      Verify TagStore A/T/C sequence TCAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0172 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.add('u172_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u172_3:1:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0172 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_17300
     * @tc.name      testTagLongSequence0173
     * @tc.desc      Verify TagStore A/T/C sequence TCAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0173 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.add('u173_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0173 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_17400
     * @tc.name      testTagLongSequence0174
     * @tc.desc      Verify TagStore A/T/C sequence TCTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0174 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.toggleActivated(1);
      store.add('u174_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u174_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0174 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_17500
     * @tc.name      testTagLongSequence0175
     * @tc.desc      Verify TagStore A/T/C sequence TCTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0175 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0175 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_17600
     * @tc.name      testTagLongSequence0176
     * @tc.desc      Verify TagStore A/T/C sequence TCTC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0176 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0176 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_17700
     * @tc.name      testTagLongSequence0177
     * @tc.desc      Verify TagStore A/T/C sequence TCCA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0177 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.clear();
      store.add('u177_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u177_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0177 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_17800
     * @tc.name      testTagLongSequence0178
     * @tc.desc      Verify TagStore A/T/C sequence TCCT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0178 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0178 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_17900
     * @tc.name      testTagLongSequence0179
     * @tc.desc      Verify TagStore A/T/C sequence TCCC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0179 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0179 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_18000
     * @tc.name      testTagLongSequence0180
     * @tc.desc      Verify TagStore A/T/C sequence CAAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0180 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('u180_2');
      store.add('u180_3');
      store.add('u180_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u180_2:0:1|2:u180_3:0:1|3:u180_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0180 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_18100
     * @tc.name      testTagLongSequence0181
     * @tc.desc      Verify TagStore A/T/C sequence CAAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0181 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('u181_2');
      store.add('u181_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u181_2:1:1|2:u181_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0181 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_18200
     * @tc.name      testTagLongSequence0182
     * @tc.desc      Verify TagStore A/T/C sequence CAAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0182 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('u182_2');
      store.add('u182_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0182 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_18300
     * @tc.name      testTagLongSequence0183
     * @tc.desc      Verify TagStore A/T/C sequence CATA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0183 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('u183_2');
      store.toggleActivated(1);
      store.add('u183_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u183_2:1:1|2:u183_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0183 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_18400
     * @tc.name      testTagLongSequence0184
     * @tc.desc      Verify TagStore A/T/C sequence CATT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0184 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('u184_2');
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u184_2:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0184 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_18500
     * @tc.name      testTagLongSequence0185
     * @tc.desc      Verify TagStore A/T/C sequence CATC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0185 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('u185_2');
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0185 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_18600
     * @tc.name      testTagLongSequence0186
     * @tc.desc      Verify TagStore A/T/C sequence CACA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0186 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('u186_2');
      store.clear();
      store.add('u186_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:u186_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0186 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_18700
     * @tc.name      testTagLongSequence0187
     * @tc.desc      Verify TagStore A/T/C sequence CACT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0187 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('u187_2');
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0187 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_18800
     * @tc.name      testTagLongSequence0188
     * @tc.desc      Verify TagStore A/T/C sequence CACC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0188 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.add('u188_2');
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0188 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_18900
     * @tc.name      testTagLongSequence0189
     * @tc.desc      Verify TagStore A/T/C sequence CTAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0189 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.add('u189_3');
      store.add('u189_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u189_3:0:1|2:u189_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0189 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_19000
     * @tc.name      testTagLongSequence0190
     * @tc.desc      Verify TagStore A/T/C sequence CTAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0190 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.add('u190_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u190_3:1:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0190 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_19100
     * @tc.name      testTagLongSequence0191
     * @tc.desc      Verify TagStore A/T/C sequence CTAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0191 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.add('u191_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0191 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_19200
     * @tc.name      testTagLongSequence0192
     * @tc.desc      Verify TagStore A/T/C sequence CTTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0192 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('u192_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u192_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0192 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_19300
     * @tc.name      testTagLongSequence0193
     * @tc.desc      Verify TagStore A/T/C sequence CTTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0193 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0193 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_19400
     * @tc.name      testTagLongSequence0194
     * @tc.desc      Verify TagStore A/T/C sequence CTTC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0194 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0194 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_19500
     * @tc.name      testTagLongSequence0195
     * @tc.desc      Verify TagStore A/T/C sequence CTCA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0195 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.clear();
      store.add('u195_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u195_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0195 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_19600
     * @tc.name      testTagLongSequence0196
     * @tc.desc      Verify TagStore A/T/C sequence CTCT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0196 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0196 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_19700
     * @tc.name      testTagLongSequence0197
     * @tc.desc      Verify TagStore A/T/C sequence CTCC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0197 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.toggleActivated(1);
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0197 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_19800
     * @tc.name      testTagLongSequence0198
     * @tc.desc      Verify TagStore A/T/C sequence CCAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0198 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.add('u198_3');
      store.add('u198_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u198_3:0:1|2:u198_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0198 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_19900
     * @tc.name      testTagLongSequence0199
     * @tc.desc      Verify TagStore A/T/C sequence CCAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0199 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.add('u199_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u199_3:1:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0199 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP5_20000
     * @tc.name      testTagLongSequence0200
     * @tc.desc      Verify TagStore A/T/C sequence CCAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0200 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.add('u200_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0200 end');
    })

  })
}
