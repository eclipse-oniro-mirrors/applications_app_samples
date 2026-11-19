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

export default function TagStoreSequenceMatrixPart11Test(): void {
  describe('TagStoreSequenceMatrixPart11', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP11_40100
     * @tc.name      testTagCycleSequence0401
     * @tc.desc      Verify TagStore four-step sequence RTAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0401 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.add('w402_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w402_3:0:0');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0401 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_40200
     * @tc.name      testTagCycleSequence0402
     * @tc.desc      Verify TagStore four-step sequence RTAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0402 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.add('w403_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0402 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_40300
     * @tc.name      testTagCycleSequence0403
     * @tc.desc      Verify TagStore four-step sequence RTRA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0403 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.remove(1);
      store.add('w404_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w404_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0403 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_40400
     * @tc.name      testTagCycleSequence0404
     * @tc.desc      Verify TagStore four-step sequence RTRR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0404 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0404 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_40500
     * @tc.name      testTagCycleSequence0405
     * @tc.desc      Verify TagStore four-step sequence RTRT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0405 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0405 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_40600
     * @tc.name      testTagCycleSequence0406
     * @tc.desc      Verify TagStore four-step sequence RTRE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0406 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0406 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_40700
     * @tc.name      testTagCycleSequence0407
     * @tc.desc      Verify TagStore four-step sequence RTRC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0407 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0407 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_40800
     * @tc.name      testTagCycleSequence0408
     * @tc.desc      Verify TagStore four-step sequence RTTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0408 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.add('w409_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w409_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0408 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_40900
     * @tc.name      testTagCycleSequence0409
     * @tc.desc      Verify TagStore four-step sequence RTTR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0409 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0409 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_41000
     * @tc.name      testTagCycleSequence0410
     * @tc.desc      Verify TagStore four-step sequence RTTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0410 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0410 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_41100
     * @tc.name      testTagCycleSequence0411
     * @tc.desc      Verify TagStore four-step sequence RTTE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0411 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0411 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_41200
     * @tc.name      testTagCycleSequence0412
     * @tc.desc      Verify TagStore four-step sequence RTTC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0412 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0412 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_41300
     * @tc.name      testTagCycleSequence0413
     * @tc.desc      Verify TagStore four-step sequence RTEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0413 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.add('w414_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w414_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0413 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_41400
     * @tc.name      testTagCycleSequence0414
     * @tc.desc      Verify TagStore four-step sequence RTER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0414 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0414 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_41500
     * @tc.name      testTagCycleSequence0415
     * @tc.desc      Verify TagStore four-step sequence RTET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0415 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0415 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_41600
     * @tc.name      testTagCycleSequence0416
     * @tc.desc      Verify TagStore four-step sequence RTEE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0416 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0416 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_41700
     * @tc.name      testTagCycleSequence0417
     * @tc.desc      Verify TagStore four-step sequence RTEC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0417 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0417 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_41800
     * @tc.name      testTagCycleSequence0418
     * @tc.desc      Verify TagStore four-step sequence RTCA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0418 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.clear();
      store.add('w419_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w419_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0418 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_41900
     * @tc.name      testTagCycleSequence0419
     * @tc.desc      Verify TagStore four-step sequence RTCR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0419 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0419 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_42000
     * @tc.name      testTagCycleSequence0420
     * @tc.desc      Verify TagStore four-step sequence RTCT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0420 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.clear();
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0420 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_42100
     * @tc.name      testTagCycleSequence0421
     * @tc.desc      Verify TagStore four-step sequence RTCE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0421 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.clear();
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0421 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_42200
     * @tc.name      testTagCycleSequence0422
     * @tc.desc      Verify TagStore four-step sequence RTCC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0422 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.toggleActivated(1);
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0422 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_42300
     * @tc.name      testTagCycleSequence0423
     * @tc.desc      Verify TagStore four-step sequence REAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0423 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.add('w424_3');
      store.add('w424_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w424_3:0:1|2:w424_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0423 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_42400
     * @tc.name      testTagCycleSequence0424
     * @tc.desc      Verify TagStore four-step sequence REAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0424 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.add('w425_3');
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0424 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_42500
     * @tc.name      testTagCycleSequence0425
     * @tc.desc      Verify TagStore four-step sequence REAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0425 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.add('w426_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w426_3:1:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0425 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_42600
     * @tc.name      testTagCycleSequence0426
     * @tc.desc      Verify TagStore four-step sequence REAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0426 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.add('w427_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w427_3:0:0');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0426 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_42700
     * @tc.name      testTagCycleSequence0427
     * @tc.desc      Verify TagStore four-step sequence REAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0427 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.add('w428_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0427 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_42800
     * @tc.name      testTagCycleSequence0428
     * @tc.desc      Verify TagStore four-step sequence RERA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0428 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.remove(1);
      store.add('w429_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w429_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0428 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_42900
     * @tc.name      testTagCycleSequence0429
     * @tc.desc      Verify TagStore four-step sequence RERR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0429 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0429 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_43000
     * @tc.name      testTagCycleSequence0430
     * @tc.desc      Verify TagStore four-step sequence RERT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0430 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0430 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_43100
     * @tc.name      testTagCycleSequence0431
     * @tc.desc      Verify TagStore four-step sequence RERE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0431 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0431 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_43200
     * @tc.name      testTagCycleSequence0432
     * @tc.desc      Verify TagStore four-step sequence RERC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0432 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0432 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_43300
     * @tc.name      testTagCycleSequence0433
     * @tc.desc      Verify TagStore four-step sequence RETA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0433 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.add('w434_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w434_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0433 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_43400
     * @tc.name      testTagCycleSequence0434
     * @tc.desc      Verify TagStore four-step sequence RETR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0434 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0434 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_43500
     * @tc.name      testTagCycleSequence0435
     * @tc.desc      Verify TagStore four-step sequence RETT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0435 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0435 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_43600
     * @tc.name      testTagCycleSequence0436
     * @tc.desc      Verify TagStore four-step sequence RETE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0436 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0436 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_43700
     * @tc.name      testTagCycleSequence0437
     * @tc.desc      Verify TagStore four-step sequence RETC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0437 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0437 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_43800
     * @tc.name      testTagCycleSequence0438
     * @tc.desc      Verify TagStore four-step sequence REEA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0438 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.add('w439_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w439_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0438 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_43900
     * @tc.name      testTagCycleSequence0439
     * @tc.desc      Verify TagStore four-step sequence REER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0439 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0439 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP11_44000
     * @tc.name      testTagCycleSequence0440
     * @tc.desc      Verify TagStore four-step sequence REET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0440 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.remove(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0440 end');
    })

  })
}
