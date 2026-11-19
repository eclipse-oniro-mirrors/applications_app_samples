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

export default function TagStoreSequenceMatrixPart8Test(): void {
  describe('TagStoreSequenceMatrixPart8', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP8_28100
     * @tc.name      testTagAteSequence0281
     * @tc.desc      Verify TagStore A/T/E sequence EETA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0281 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.add('v282_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v282_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0281 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_28200
     * @tc.name      testTagAteSequence0282
     * @tc.desc      Verify TagStore A/T/E sequence EETT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0282 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0282 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_28300
     * @tc.name      testTagAteSequence0283
     * @tc.desc      Verify TagStore A/T/E sequence EETE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0283 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0283 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_28400
     * @tc.name      testTagAteSequence0284
     * @tc.desc      Verify TagStore A/T/E sequence EEEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0284 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.add('v285_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v285_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0284 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_28500
     * @tc.name      testTagAteSequence0285
     * @tc.desc      Verify TagStore A/T/E sequence EEET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0285 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0285 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_28600
     * @tc.name      testTagAteSequence0286
     * @tc.desc      Verify TagStore A/T/E sequence EEEE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0286 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0286 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_28700
     * @tc.name      testTagCycleSequence0287
     * @tc.desc      Verify TagStore four-step sequence AAAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0287 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w288_1');
      store.add('w288_2');
      store.add('w288_3');
      store.remove(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w288_2:0:1|3:w288_3:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0287 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_28800
     * @tc.name      testTagCycleSequence0288
     * @tc.desc      Verify TagStore four-step sequence AARA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0288 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w289_1');
      store.add('w289_2');
      store.remove(1);
      store.add('w289_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w289_2:0:1|3:w289_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0288 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_28900
     * @tc.name      testTagCycleSequence0289
     * @tc.desc      Verify TagStore four-step sequence AARR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0289 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w290_1');
      store.add('w290_2');
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w290_2:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0289 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_29000
     * @tc.name      testTagCycleSequence0290
     * @tc.desc      Verify TagStore four-step sequence AART.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0290 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w291_1');
      store.add('w291_2');
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w291_2:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0290 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_29100
     * @tc.name      testTagCycleSequence0291
     * @tc.desc      Verify TagStore four-step sequence AARE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0291 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w292_1');
      store.add('w292_2');
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w292_2:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0291 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_29200
     * @tc.name      testTagCycleSequence0292
     * @tc.desc      Verify TagStore four-step sequence AARC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0292 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w293_1');
      store.add('w293_2');
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0292 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_29300
     * @tc.name      testTagCycleSequence0293
     * @tc.desc      Verify TagStore four-step sequence AATR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0293 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w294_1');
      store.add('w294_2');
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w294_2:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0293 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_29400
     * @tc.name      testTagCycleSequence0294
     * @tc.desc      Verify TagStore four-step sequence AAER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0294 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w295_1');
      store.add('w295_2');
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w295_2:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0294 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_29500
     * @tc.name      testTagCycleSequence0295
     * @tc.desc      Verify TagStore four-step sequence AACR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0295 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w296_1');
      store.add('w296_2');
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0295 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_29600
     * @tc.name      testTagCycleSequence0296
     * @tc.desc      Verify TagStore four-step sequence ARAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0296 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w297_1');
      store.remove(1);
      store.add('w297_3');
      store.add('w297_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w297_3:0:1|3:w297_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0296 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_29700
     * @tc.name      testTagCycleSequence0297
     * @tc.desc      Verify TagStore four-step sequence ARAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0297 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w298_1');
      store.remove(1);
      store.add('w298_3');
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w298_3:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0297 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_29800
     * @tc.name      testTagCycleSequence0298
     * @tc.desc      Verify TagStore four-step sequence ARAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0298 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w299_1');
      store.remove(1);
      store.add('w299_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w299_3:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0298 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_29900
     * @tc.name      testTagCycleSequence0299
     * @tc.desc      Verify TagStore four-step sequence ARAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0299 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w300_1');
      store.remove(1);
      store.add('w300_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w300_3:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0299 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_30000
     * @tc.name      testTagCycleSequence0300
     * @tc.desc      Verify TagStore four-step sequence ARAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0300 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w301_1');
      store.remove(1);
      store.add('w301_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0300 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_30100
     * @tc.name      testTagCycleSequence0301
     * @tc.desc      Verify TagStore four-step sequence ARRA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0301 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w302_1');
      store.remove(1);
      store.remove(1);
      store.add('w302_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w302_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0301 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_30200
     * @tc.name      testTagCycleSequence0302
     * @tc.desc      Verify TagStore four-step sequence ARRR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0302 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w303_1');
      store.remove(1);
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0302 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_30300
     * @tc.name      testTagCycleSequence0303
     * @tc.desc      Verify TagStore four-step sequence ARRT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0303 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w304_1');
      store.remove(1);
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0303 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_30400
     * @tc.name      testTagCycleSequence0304
     * @tc.desc      Verify TagStore four-step sequence ARRE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0304 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w305_1');
      store.remove(1);
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0304 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_30500
     * @tc.name      testTagCycleSequence0305
     * @tc.desc      Verify TagStore four-step sequence ARRC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0305 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w306_1');
      store.remove(1);
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0305 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_30600
     * @tc.name      testTagCycleSequence0306
     * @tc.desc      Verify TagStore four-step sequence ARTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0306 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w307_1');
      store.remove(1);
      store.toggleActivated(1);
      store.add('w307_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w307_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0306 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_30700
     * @tc.name      testTagCycleSequence0307
     * @tc.desc      Verify TagStore four-step sequence ARTR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0307 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w308_1');
      store.remove(1);
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0307 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_30800
     * @tc.name      testTagCycleSequence0308
     * @tc.desc      Verify TagStore four-step sequence ARTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0308 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w309_1');
      store.remove(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0308 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_30900
     * @tc.name      testTagCycleSequence0309
     * @tc.desc      Verify TagStore four-step sequence ARTE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0309 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w310_1');
      store.remove(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0309 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_31000
     * @tc.name      testTagCycleSequence0310
     * @tc.desc      Verify TagStore four-step sequence ARTC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0310 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w311_1');
      store.remove(1);
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0310 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_31100
     * @tc.name      testTagCycleSequence0311
     * @tc.desc      Verify TagStore four-step sequence AREA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0311 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w312_1');
      store.remove(1);
      store.setEnabled(1, false);
      store.add('w312_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w312_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0311 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_31200
     * @tc.name      testTagCycleSequence0312
     * @tc.desc      Verify TagStore four-step sequence ARER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0312 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w313_1');
      store.remove(1);
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0312 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_31300
     * @tc.name      testTagCycleSequence0313
     * @tc.desc      Verify TagStore four-step sequence ARET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0313 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w314_1');
      store.remove(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0313 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_31400
     * @tc.name      testTagCycleSequence0314
     * @tc.desc      Verify TagStore four-step sequence AREE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0314 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w315_1');
      store.remove(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0314 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_31500
     * @tc.name      testTagCycleSequence0315
     * @tc.desc      Verify TagStore four-step sequence AREC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0315 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w316_1');
      store.remove(1);
      store.setEnabled(1, false);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0315 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_31600
     * @tc.name      testTagCycleSequence0316
     * @tc.desc      Verify TagStore four-step sequence ARCA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0316 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w317_1');
      store.remove(1);
      store.clear();
      store.add('w317_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w317_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0316 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_31700
     * @tc.name      testTagCycleSequence0317
     * @tc.desc      Verify TagStore four-step sequence ARCR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0317 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w318_1');
      store.remove(1);
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0317 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_31800
     * @tc.name      testTagCycleSequence0318
     * @tc.desc      Verify TagStore four-step sequence ARCT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0318 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w319_1');
      store.remove(1);
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0318 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_31900
     * @tc.name      testTagCycleSequence0319
     * @tc.desc      Verify TagStore four-step sequence ARCE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0319 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w320_1');
      store.remove(1);
      store.clear();
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0319 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP8_32000
     * @tc.name      testTagCycleSequence0320
     * @tc.desc      Verify TagStore four-step sequence ARCC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0320 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w321_1');
      store.remove(1);
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0320 end');
    })

  })
}
