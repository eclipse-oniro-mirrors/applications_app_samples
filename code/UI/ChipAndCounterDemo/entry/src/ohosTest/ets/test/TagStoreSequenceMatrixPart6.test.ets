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

export default function TagStoreSequenceMatrixPart6Test(): void {
  describe('TagStoreSequenceMatrixPart6', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP6_20100
     * @tc.name      testTagLongSequence0201
     * @tc.desc      Verify TagStore A/T/C sequence CCTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0201 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.toggleActivated(1);
      store.add('u201_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u201_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0201 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_20200
     * @tc.name      testTagLongSequence0202
     * @tc.desc      Verify TagStore A/T/C sequence CCTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0202 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0202 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_20300
     * @tc.name      testTagLongSequence0203
     * @tc.desc      Verify TagStore A/T/C sequence CCTC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0203 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0203 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_20400
     * @tc.name      testTagLongSequence0204
     * @tc.desc      Verify TagStore A/T/C sequence CCCA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0204 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.clear();
      store.add('u204_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:u204_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0204 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_20500
     * @tc.name      testTagLongSequence0205
     * @tc.desc      Verify TagStore A/T/C sequence CCCT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0205 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0205 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_20600
     * @tc.name      testTagLongSequence0206
     * @tc.desc      Verify TagStore A/T/C sequence CCCC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagLongSequence0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0206 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.clear();
      store.clear();
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagLongSequence0206 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_20700
     * @tc.name      testTagAteSequence0207
     * @tc.desc      Verify TagStore A/T/E sequence AAAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0207 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v207_1');
      store.add('v207_2');
      store.add('v207_3');
      store.add('v207_4');
      expect(store.count()).assertEqual(4);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v207_1:0:1|2:v207_2:0:1|3:v207_3:0:1|4:v207_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0207 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_20800
     * @tc.name      testTagAteSequence0208
     * @tc.desc      Verify TagStore A/T/E sequence AAAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0208 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v208_1');
      store.add('v208_2');
      store.add('v208_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v208_1:1:1|2:v208_2:0:1|3:v208_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0208 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_20900
     * @tc.name      testTagAteSequence0209
     * @tc.desc      Verify TagStore A/T/E sequence AAAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0209 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v209_1');
      store.add('v209_2');
      store.add('v209_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v209_1:0:0|2:v209_2:0:1|3:v209_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0209 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_21000
     * @tc.name      testTagAteSequence0210
     * @tc.desc      Verify TagStore A/T/E sequence AATA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0210 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v210_1');
      store.add('v210_2');
      store.toggleActivated(1);
      store.add('v210_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v210_1:1:1|2:v210_2:0:1|3:v210_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0210 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_21100
     * @tc.name      testTagAteSequence0211
     * @tc.desc      Verify TagStore A/T/E sequence AATT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0211 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v211_1');
      store.add('v211_2');
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v211_1:0:1|2:v211_2:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0211 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_21200
     * @tc.name      testTagAteSequence0212
     * @tc.desc      Verify TagStore A/T/E sequence AATE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0212 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v212_1');
      store.add('v212_2');
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v212_1:1:0|2:v212_2:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0212 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_21300
     * @tc.name      testTagAteSequence0213
     * @tc.desc      Verify TagStore A/T/E sequence AAEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0213 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v213_1');
      store.add('v213_2');
      store.setEnabled(1, false);
      store.add('v213_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v213_1:0:0|2:v213_2:0:1|3:v213_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0213 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_21400
     * @tc.name      testTagAteSequence0214
     * @tc.desc      Verify TagStore A/T/E sequence AAET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0214 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v214_1');
      store.add('v214_2');
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v214_1:1:0|2:v214_2:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0214 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_21500
     * @tc.name      testTagAteSequence0215
     * @tc.desc      Verify TagStore A/T/E sequence AAEE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0215 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v215_1');
      store.add('v215_2');
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v215_1:0:0|2:v215_2:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0215 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_21600
     * @tc.name      testTagAteSequence0216
     * @tc.desc      Verify TagStore A/T/E sequence ATAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0216 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v216_1');
      store.toggleActivated(1);
      store.add('v216_3');
      store.add('v216_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v216_1:1:1|2:v216_3:0:1|3:v216_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0216 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_21700
     * @tc.name      testTagAteSequence0217
     * @tc.desc      Verify TagStore A/T/E sequence ATAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0217 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v217_1');
      store.toggleActivated(1);
      store.add('v217_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v217_1:0:1|2:v217_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0217 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_21800
     * @tc.name      testTagAteSequence0218
     * @tc.desc      Verify TagStore A/T/E sequence ATAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0218 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v218_1');
      store.toggleActivated(1);
      store.add('v218_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v218_1:1:0|2:v218_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0218 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_21900
     * @tc.name      testTagAteSequence0219
     * @tc.desc      Verify TagStore A/T/E sequence ATTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0219 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v219_1');
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('v219_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v219_1:0:1|2:v219_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0219 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_22000
     * @tc.name      testTagAteSequence0220
     * @tc.desc      Verify TagStore A/T/E sequence ATTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0220 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v220_1');
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v220_1:1:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0220 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_22100
     * @tc.name      testTagAteSequence0221
     * @tc.desc      Verify TagStore A/T/E sequence ATTE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0221 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v221_1');
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v221_1:0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0221 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_22200
     * @tc.name      testTagAteSequence0222
     * @tc.desc      Verify TagStore A/T/E sequence ATEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0222 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v222_1');
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.add('v222_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v222_1:1:0|2:v222_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0222 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_22300
     * @tc.name      testTagAteSequence0223
     * @tc.desc      Verify TagStore A/T/E sequence ATET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0223 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v223_1');
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v223_1:0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0223 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_22400
     * @tc.name      testTagAteSequence0224
     * @tc.desc      Verify TagStore A/T/E sequence ATEE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0224 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v224_1');
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v224_1:1:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0224 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_22500
     * @tc.name      testTagAteSequence0225
     * @tc.desc      Verify TagStore A/T/E sequence AEAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0225 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v225_1');
      store.setEnabled(1, false);
      store.add('v225_3');
      store.add('v225_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v225_1:0:0|2:v225_3:0:1|3:v225_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0225 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_22600
     * @tc.name      testTagAteSequence0226
     * @tc.desc      Verify TagStore A/T/E sequence AEAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0226 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v226_1');
      store.setEnabled(1, false);
      store.add('v226_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v226_1:1:0|2:v226_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0226 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_22700
     * @tc.name      testTagAteSequence0227
     * @tc.desc      Verify TagStore A/T/E sequence AEAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0227 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v227_1');
      store.setEnabled(1, false);
      store.add('v227_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v227_1:0:0|2:v227_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0227 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_22800
     * @tc.name      testTagAteSequence0228
     * @tc.desc      Verify TagStore A/T/E sequence AETA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0228 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v228_1');
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.add('v228_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v228_1:1:0|2:v228_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0228 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_22900
     * @tc.name      testTagAteSequence0229
     * @tc.desc      Verify TagStore A/T/E sequence AETT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0229 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v229_1');
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v229_1:0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0229 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_23000
     * @tc.name      testTagAteSequence0230
     * @tc.desc      Verify TagStore A/T/E sequence AETE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0230 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v230_1');
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v230_1:1:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0230 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_23100
     * @tc.name      testTagAteSequence0231
     * @tc.desc      Verify TagStore A/T/E sequence AEEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0231 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v231_1');
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.add('v231_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v231_1:0:0|2:v231_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0231 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_23200
     * @tc.name      testTagAteSequence0232
     * @tc.desc      Verify TagStore A/T/E sequence AEET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0232 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v232_1');
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v232_1:1:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0232 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_23300
     * @tc.name      testTagAteSequence0233
     * @tc.desc      Verify TagStore A/T/E sequence AEEE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0233 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('v233_1');
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v233_1:0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0233 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_23400
     * @tc.name      testTagAteSequence0234
     * @tc.desc      Verify TagStore A/T/E sequence TAAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0234 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('v234_2');
      store.add('v234_3');
      store.add('v234_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v234_2:0:1|2:v234_3:0:1|3:v234_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0234 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_23500
     * @tc.name      testTagAteSequence0235
     * @tc.desc      Verify TagStore A/T/E sequence TAAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0235 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('v235_2');
      store.add('v235_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v235_2:1:1|2:v235_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0235 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_23600
     * @tc.name      testTagAteSequence0236
     * @tc.desc      Verify TagStore A/T/E sequence TAAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0236 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('v236_2');
      store.add('v236_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v236_2:0:0|2:v236_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0236 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_23700
     * @tc.name      testTagAteSequence0237
     * @tc.desc      Verify TagStore A/T/E sequence TATA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0237 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('v237_2');
      store.toggleActivated(1);
      store.add('v237_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v237_2:1:1|2:v237_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0237 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_23800
     * @tc.name      testTagAteSequence0238
     * @tc.desc      Verify TagStore A/T/E sequence TATT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0238 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('v238_2');
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v238_2:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0238 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_23900
     * @tc.name      testTagAteSequence0239
     * @tc.desc      Verify TagStore A/T/E sequence TATE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0239 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('v239_2');
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v239_2:1:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0239 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP6_24000
     * @tc.name      testTagAteSequence0240
     * @tc.desc      Verify TagStore A/T/E sequence TAEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0240 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('v240_2');
      store.setEnabled(1, false);
      store.add('v240_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v240_2:0:0|2:v240_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0240 end');
    })

  })
}
