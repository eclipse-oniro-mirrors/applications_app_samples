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

export default function TagStoreSequenceMatrixPart7Test(): void {
  describe('TagStoreSequenceMatrixPart7', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP7_24100
     * @tc.name      testTagAteSequence0241
     * @tc.desc      Verify TagStore A/T/E sequence TAET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0241 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('v241_2');
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v241_2:1:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0241 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_24200
     * @tc.name      testTagAteSequence0242
     * @tc.desc      Verify TagStore A/T/E sequence TAEE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0242 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.add('v242_2');
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v242_2:0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0242 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_24300
     * @tc.name      testTagAteSequence0243
     * @tc.desc      Verify TagStore A/T/E sequence TTAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0243 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('v243_3');
      store.add('v243_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v243_3:0:1|2:v243_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0243 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_24400
     * @tc.name      testTagAteSequence0244
     * @tc.desc      Verify TagStore A/T/E sequence TTAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0244 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('v244_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v244_3:1:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0244 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_24500
     * @tc.name      testTagAteSequence0245
     * @tc.desc      Verify TagStore A/T/E sequence TTAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0245 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('v245_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v245_3:0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0245 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_24600
     * @tc.name      testTagAteSequence0246
     * @tc.desc      Verify TagStore A/T/E sequence TTTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0246 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('v246_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v246_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0246 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_24700
     * @tc.name      testTagAteSequence0247
     * @tc.desc      Verify TagStore A/T/E sequence TTTE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0247 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0247 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_24800
     * @tc.name      testTagAteSequence0248
     * @tc.desc      Verify TagStore A/T/E sequence TTEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0248 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.add('v249_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v249_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0248 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_24900
     * @tc.name      testTagAteSequence0249
     * @tc.desc      Verify TagStore A/T/E sequence TTET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0249 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0249 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_25000
     * @tc.name      testTagAteSequence0250
     * @tc.desc      Verify TagStore A/T/E sequence TTEE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0250 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0250 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_25100
     * @tc.name      testTagAteSequence0251
     * @tc.desc      Verify TagStore A/T/E sequence TEAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0251 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.add('v252_3');
      store.add('v252_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v252_3:0:1|2:v252_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0251 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_25200
     * @tc.name      testTagAteSequence0252
     * @tc.desc      Verify TagStore A/T/E sequence TEAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0252 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.add('v253_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v253_3:1:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0252 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_25300
     * @tc.name      testTagAteSequence0253
     * @tc.desc      Verify TagStore A/T/E sequence TEAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0253 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.add('v254_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v254_3:0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0253 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_25400
     * @tc.name      testTagAteSequence0254
     * @tc.desc      Verify TagStore A/T/E sequence TETA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0254 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.add('v255_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v255_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0254 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_25500
     * @tc.name      testTagAteSequence0255
     * @tc.desc      Verify TagStore A/T/E sequence TETT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0255 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0255 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_25600
     * @tc.name      testTagAteSequence0256
     * @tc.desc      Verify TagStore A/T/E sequence TETE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0256 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0256 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_25700
     * @tc.name      testTagAteSequence0257
     * @tc.desc      Verify TagStore A/T/E sequence TEEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0257 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.add('v258_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v258_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0257 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_25800
     * @tc.name      testTagAteSequence0258
     * @tc.desc      Verify TagStore A/T/E sequence TEET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0258 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0258 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_25900
     * @tc.name      testTagAteSequence0259
     * @tc.desc      Verify TagStore A/T/E sequence TEEE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0259 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0259 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_26000
     * @tc.name      testTagAteSequence0260
     * @tc.desc      Verify TagStore A/T/E sequence EAAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0260 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('v261_2');
      store.add('v261_3');
      store.add('v261_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v261_2:0:1|2:v261_3:0:1|3:v261_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0260 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_26100
     * @tc.name      testTagAteSequence0261
     * @tc.desc      Verify TagStore A/T/E sequence EAAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0261 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('v262_2');
      store.add('v262_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v262_2:1:1|2:v262_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0261 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_26200
     * @tc.name      testTagAteSequence0262
     * @tc.desc      Verify TagStore A/T/E sequence EAAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0262 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('v263_2');
      store.add('v263_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v263_2:0:0|2:v263_3:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0262 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_26300
     * @tc.name      testTagAteSequence0263
     * @tc.desc      Verify TagStore A/T/E sequence EATA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0263 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('v264_2');
      store.toggleActivated(1);
      store.add('v264_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v264_2:1:1|2:v264_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0263 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_26400
     * @tc.name      testTagAteSequence0264
     * @tc.desc      Verify TagStore A/T/E sequence EATT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0264 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('v265_2');
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v265_2:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0264 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_26500
     * @tc.name      testTagAteSequence0265
     * @tc.desc      Verify TagStore A/T/E sequence EATE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0265 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('v266_2');
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v266_2:1:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0265 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_26600
     * @tc.name      testTagAteSequence0266
     * @tc.desc      Verify TagStore A/T/E sequence EAEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0266 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('v267_2');
      store.setEnabled(1, false);
      store.add('v267_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v267_2:0:0|2:v267_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0266 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_26700
     * @tc.name      testTagAteSequence0267
     * @tc.desc      Verify TagStore A/T/E sequence EAET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0267 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('v268_2');
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v268_2:1:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0267 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_26800
     * @tc.name      testTagAteSequence0268
     * @tc.desc      Verify TagStore A/T/E sequence EAEE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0268 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('v269_2');
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v269_2:0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0268 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_26900
     * @tc.name      testTagAteSequence0269
     * @tc.desc      Verify TagStore A/T/E sequence ETAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0269 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.add('v270_3');
      store.add('v270_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v270_3:0:1|2:v270_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0269 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_27000
     * @tc.name      testTagAteSequence0270
     * @tc.desc      Verify TagStore A/T/E sequence ETAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0270 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.add('v271_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v271_3:1:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0270 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_27100
     * @tc.name      testTagAteSequence0271
     * @tc.desc      Verify TagStore A/T/E sequence ETAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0271 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.add('v272_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v272_3:0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0271 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_27200
     * @tc.name      testTagAteSequence0272
     * @tc.desc      Verify TagStore A/T/E sequence ETTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0272 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('v273_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v273_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0272 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_27300
     * @tc.name      testTagAteSequence0273
     * @tc.desc      Verify TagStore A/T/E sequence ETTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0273 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0273 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_27400
     * @tc.name      testTagAteSequence0274
     * @tc.desc      Verify TagStore A/T/E sequence ETTE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0274 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0274 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_27500
     * @tc.name      testTagAteSequence0275
     * @tc.desc      Verify TagStore A/T/E sequence ETEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0275 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.add('v276_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v276_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0275 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_27600
     * @tc.name      testTagAteSequence0276
     * @tc.desc      Verify TagStore A/T/E sequence ETET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0276 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0276 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_27700
     * @tc.name      testTagAteSequence0277
     * @tc.desc      Verify TagStore A/T/E sequence ETEE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0277 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0277 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_27800
     * @tc.name      testTagAteSequence0278
     * @tc.desc      Verify TagStore A/T/E sequence EEAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0278 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.add('v279_3');
      store.add('v279_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v279_3:0:1|2:v279_4:0:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0278 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_27900
     * @tc.name      testTagAteSequence0279
     * @tc.desc      Verify TagStore A/T/E sequence EEAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0279 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.add('v280_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v280_3:1:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0279 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP7_28000
     * @tc.name      testTagAteSequence0280
     * @tc.desc      Verify TagStore A/T/E sequence EEAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagAteSequence0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0280 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.add('v281_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:v281_3:0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagAteSequence0280 end');
    })

  })
}
