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

export default function TagStoreSequenceMatrixPart9Test(): void {
  describe('TagStoreSequenceMatrixPart9', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP9_32100
     * @tc.name      testTagCycleSequence0321
     * @tc.desc      Verify TagStore four-step sequence ATAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0321 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w322_1');
      store.toggleActivated(1);
      store.add('w322_3');
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w322_3:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0321 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_32200
     * @tc.name      testTagCycleSequence0322
     * @tc.desc      Verify TagStore four-step sequence ATRA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0322 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w323_1');
      store.toggleActivated(1);
      store.remove(1);
      store.add('w323_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w323_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0322 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_32300
     * @tc.name      testTagCycleSequence0323
     * @tc.desc      Verify TagStore four-step sequence ATRR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0323 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w324_1');
      store.toggleActivated(1);
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0323 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_32400
     * @tc.name      testTagCycleSequence0324
     * @tc.desc      Verify TagStore four-step sequence ATRT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0324 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w325_1');
      store.toggleActivated(1);
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0324 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_32500
     * @tc.name      testTagCycleSequence0325
     * @tc.desc      Verify TagStore four-step sequence ATRE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0325 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w326_1');
      store.toggleActivated(1);
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0325 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_32600
     * @tc.name      testTagCycleSequence0326
     * @tc.desc      Verify TagStore four-step sequence ATRC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0326 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w327_1');
      store.toggleActivated(1);
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0326 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_32700
     * @tc.name      testTagCycleSequence0327
     * @tc.desc      Verify TagStore four-step sequence ATTR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0327 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w328_1');
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0327 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_32800
     * @tc.name      testTagCycleSequence0328
     * @tc.desc      Verify TagStore four-step sequence ATER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0328 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w329_1');
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0328 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_32900
     * @tc.name      testTagCycleSequence0329
     * @tc.desc      Verify TagStore four-step sequence ATCR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0329 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w330_1');
      store.toggleActivated(1);
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0329 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_33000
     * @tc.name      testTagCycleSequence0330
     * @tc.desc      Verify TagStore four-step sequence AEAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0330 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w331_1');
      store.setEnabled(1, false);
      store.add('w331_3');
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w331_3:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0330 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_33100
     * @tc.name      testTagCycleSequence0331
     * @tc.desc      Verify TagStore four-step sequence AERA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0331 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w332_1');
      store.setEnabled(1, false);
      store.remove(1);
      store.add('w332_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w332_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0331 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_33200
     * @tc.name      testTagCycleSequence0332
     * @tc.desc      Verify TagStore four-step sequence AERR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0332 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w333_1');
      store.setEnabled(1, false);
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0332 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_33300
     * @tc.name      testTagCycleSequence0333
     * @tc.desc      Verify TagStore four-step sequence AERT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0333 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w334_1');
      store.setEnabled(1, false);
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0333 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_33400
     * @tc.name      testTagCycleSequence0334
     * @tc.desc      Verify TagStore four-step sequence AERE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0334 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w335_1');
      store.setEnabled(1, false);
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0334 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_33500
     * @tc.name      testTagCycleSequence0335
     * @tc.desc      Verify TagStore four-step sequence AERC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0335 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w336_1');
      store.setEnabled(1, false);
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0335 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_33600
     * @tc.name      testTagCycleSequence0336
     * @tc.desc      Verify TagStore four-step sequence AETR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0336 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w337_1');
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0336 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_33700
     * @tc.name      testTagCycleSequence0337
     * @tc.desc      Verify TagStore four-step sequence AEER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0337 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w338_1');
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0337 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_33800
     * @tc.name      testTagCycleSequence0338
     * @tc.desc      Verify TagStore four-step sequence AECR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0338 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w339_1');
      store.setEnabled(1, false);
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0338 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_33900
     * @tc.name      testTagCycleSequence0339
     * @tc.desc      Verify TagStore four-step sequence ACAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0339 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w340_1');
      store.clear();
      store.add('w340_3');
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w340_3:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0339 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_34000
     * @tc.name      testTagCycleSequence0340
     * @tc.desc      Verify TagStore four-step sequence ACRA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0340 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w341_1');
      store.clear();
      store.remove(1);
      store.add('w341_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w341_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0340 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_34100
     * @tc.name      testTagCycleSequence0341
     * @tc.desc      Verify TagStore four-step sequence ACRR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0341 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w342_1');
      store.clear();
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0341 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_34200
     * @tc.name      testTagCycleSequence0342
     * @tc.desc      Verify TagStore four-step sequence ACRT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0342 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w343_1');
      store.clear();
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0342 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_34300
     * @tc.name      testTagCycleSequence0343
     * @tc.desc      Verify TagStore four-step sequence ACRE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0343 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w344_1');
      store.clear();
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0343 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_34400
     * @tc.name      testTagCycleSequence0344
     * @tc.desc      Verify TagStore four-step sequence ACRC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0344 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w345_1');
      store.clear();
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0344 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_34500
     * @tc.name      testTagCycleSequence0345
     * @tc.desc      Verify TagStore four-step sequence ACTR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0345 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w346_1');
      store.clear();
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0345 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_34600
     * @tc.name      testTagCycleSequence0346
     * @tc.desc      Verify TagStore four-step sequence ACER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0346 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w347_1');
      store.clear();
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0346 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_34700
     * @tc.name      testTagCycleSequence0347
     * @tc.desc      Verify TagStore four-step sequence ACCR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0347 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.add('w348_1');
      store.clear();
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0347 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_34800
     * @tc.name      testTagCycleSequence0348
     * @tc.desc      Verify TagStore four-step sequence RAAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0348 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w349_2');
      store.add('w349_3');
      store.add('w349_4');
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w349_2:0:1|2:w349_3:0:1|3:w349_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0348 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_34900
     * @tc.name      testTagCycleSequence0349
     * @tc.desc      Verify TagStore four-step sequence RAAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0349 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w350_2');
      store.add('w350_3');
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w350_3:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0349 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_35000
     * @tc.name      testTagCycleSequence0350
     * @tc.desc      Verify TagStore four-step sequence RAAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0350 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w351_2');
      store.add('w351_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w351_2:1:1|2:w351_3:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0350 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_35100
     * @tc.name      testTagCycleSequence0351
     * @tc.desc      Verify TagStore four-step sequence RAAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0351 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w352_2');
      store.add('w352_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w352_2:0:0|2:w352_3:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0351 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_35200
     * @tc.name      testTagCycleSequence0352
     * @tc.desc      Verify TagStore four-step sequence RAAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0352 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w353_2');
      store.add('w353_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0352 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_35300
     * @tc.name      testTagCycleSequence0353
     * @tc.desc      Verify TagStore four-step sequence RARA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0353 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w354_2');
      store.remove(1);
      store.add('w354_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w354_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0353 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_35400
     * @tc.name      testTagCycleSequence0354
     * @tc.desc      Verify TagStore four-step sequence RARR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0354 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w355_2');
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0354 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_35500
     * @tc.name      testTagCycleSequence0355
     * @tc.desc      Verify TagStore four-step sequence RART.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0355 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w356_2');
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0355 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_35600
     * @tc.name      testTagCycleSequence0356
     * @tc.desc      Verify TagStore four-step sequence RARE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0356 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w357_2');
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0356 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_35700
     * @tc.name      testTagCycleSequence0357
     * @tc.desc      Verify TagStore four-step sequence RARC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0357 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w358_2');
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0357 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_35800
     * @tc.name      testTagCycleSequence0358
     * @tc.desc      Verify TagStore four-step sequence RATA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0358 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w359_2');
      store.toggleActivated(1);
      store.add('w359_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w359_2:1:1|2:w359_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0358 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_35900
     * @tc.name      testTagCycleSequence0359
     * @tc.desc      Verify TagStore four-step sequence RATR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0359 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w360_2');
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0359 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP9_36000
     * @tc.name      testTagCycleSequence0360
     * @tc.desc      Verify TagStore four-step sequence RATT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0360 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.add('w361_2');
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w361_2:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0360 end');
    })

  })
}
