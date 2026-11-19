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

export default function TagStoreSequenceMatrixPart14Test(): void {
  describe('TagStoreSequenceMatrixPart14', () => {

    /**
     * @tc.number    SUB_CHIP_TSSP14_52100
     * @tc.name      testTagCycleSequence0521
     * @tc.desc      Verify TagStore four-step sequence TERC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0521 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0521 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_52200
     * @tc.name      testTagCycleSequence0522
     * @tc.desc      Verify TagStore four-step sequence TETR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0522 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0522 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_52300
     * @tc.name      testTagCycleSequence0523
     * @tc.desc      Verify TagStore four-step sequence TEER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0523 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0523 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_52400
     * @tc.name      testTagCycleSequence0524
     * @tc.desc      Verify TagStore four-step sequence TECR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0524 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.setEnabled(1, false);
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0524 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_52500
     * @tc.name      testTagCycleSequence0525
     * @tc.desc      Verify TagStore four-step sequence TCAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0525 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.add('w526_3');
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0525 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_52600
     * @tc.name      testTagCycleSequence0526
     * @tc.desc      Verify TagStore four-step sequence TCRA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0526 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.remove(1);
      store.add('w527_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w527_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0526 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_52700
     * @tc.name      testTagCycleSequence0527
     * @tc.desc      Verify TagStore four-step sequence TCRR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0527 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0527 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_52800
     * @tc.name      testTagCycleSequence0528
     * @tc.desc      Verify TagStore four-step sequence TCRT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0528 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0528 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_52900
     * @tc.name      testTagCycleSequence0529
     * @tc.desc      Verify TagStore four-step sequence TCRE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0529 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0529 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_53000
     * @tc.name      testTagCycleSequence0530
     * @tc.desc      Verify TagStore four-step sequence TCRC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0530 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0530 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_53100
     * @tc.name      testTagCycleSequence0531
     * @tc.desc      Verify TagStore four-step sequence TCTR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0531 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0531 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_53200
     * @tc.name      testTagCycleSequence0532
     * @tc.desc      Verify TagStore four-step sequence TCER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0532 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0532 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_53300
     * @tc.name      testTagCycleSequence0533
     * @tc.desc      Verify TagStore four-step sequence TCCR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0533 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.toggleActivated(1);
      store.clear();
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0533 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_53400
     * @tc.name      testTagCycleSequence0534
     * @tc.desc      Verify TagStore four-step sequence EAAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0534 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('w535_2');
      store.add('w535_3');
      store.remove(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w535_3:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0534 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_53500
     * @tc.name      testTagCycleSequence0535
     * @tc.desc      Verify TagStore four-step sequence EARA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0535 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('w536_2');
      store.remove(1);
      store.add('w536_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('2:w536_4:0:1');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0535 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_53600
     * @tc.name      testTagCycleSequence0536
     * @tc.desc      Verify TagStore four-step sequence EARR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0536 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('w537_2');
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0536 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_53700
     * @tc.name      testTagCycleSequence0537
     * @tc.desc      Verify TagStore four-step sequence EART.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0537 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('w538_2');
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0537 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_53800
     * @tc.name      testTagCycleSequence0538
     * @tc.desc      Verify TagStore four-step sequence EARE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0538 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('w539_2');
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0538 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_53900
     * @tc.name      testTagCycleSequence0539
     * @tc.desc      Verify TagStore four-step sequence EARC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0539 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('w540_2');
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0539 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_54000
     * @tc.name      testTagCycleSequence0540
     * @tc.desc      Verify TagStore four-step sequence EATR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0540 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('w541_2');
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0540 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_54100
     * @tc.name      testTagCycleSequence0541
     * @tc.desc      Verify TagStore four-step sequence EAER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0541 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('w542_2');
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0541 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_54200
     * @tc.name      testTagCycleSequence0542
     * @tc.desc      Verify TagStore four-step sequence EACR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0542 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.add('w543_2');
      store.clear();
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0542 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_54300
     * @tc.name      testTagCycleSequence0543
     * @tc.desc      Verify TagStore four-step sequence ERAA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0543 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.add('w544_3');
      store.add('w544_4');
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w544_3:0:1|2:w544_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0543 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_54400
     * @tc.name      testTagCycleSequence0544
     * @tc.desc      Verify TagStore four-step sequence ERAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0544 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.add('w545_3');
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0544 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_54500
     * @tc.name      testTagCycleSequence0545
     * @tc.desc      Verify TagStore four-step sequence ERAT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0545 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.add('w546_3');
      store.toggleActivated(1);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(1);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w546_3:1:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0545 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_54600
     * @tc.name      testTagCycleSequence0546
     * @tc.desc      Verify TagStore four-step sequence ERAE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0546 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.add('w547_3');
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w547_3:0:0');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0546 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_54700
     * @tc.name      testTagCycleSequence0547
     * @tc.desc      Verify TagStore four-step sequence ERAC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0547 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.add('w548_3');
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0547 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_54800
     * @tc.name      testTagCycleSequence0548
     * @tc.desc      Verify TagStore four-step sequence ERRA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0548 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.remove(1);
      store.add('w549_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w549_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0548 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_54900
     * @tc.name      testTagCycleSequence0549
     * @tc.desc      Verify TagStore four-step sequence ERRR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0549 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.remove(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0549 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_55000
     * @tc.name      testTagCycleSequence0550
     * @tc.desc      Verify TagStore four-step sequence ERRT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0550 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.remove(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0550 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_55100
     * @tc.name      testTagCycleSequence0551
     * @tc.desc      Verify TagStore four-step sequence ERRE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0551 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.remove(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0551 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_55200
     * @tc.name      testTagCycleSequence0552
     * @tc.desc      Verify TagStore four-step sequence ERRC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0552 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.remove(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0552 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_55300
     * @tc.name      testTagCycleSequence0553
     * @tc.desc      Verify TagStore four-step sequence ERTA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0553 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.toggleActivated(1);
      store.add('w554_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w554_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0553 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_55400
     * @tc.name      testTagCycleSequence0554
     * @tc.desc      Verify TagStore four-step sequence ERTR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0554 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.toggleActivated(1);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0554 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_55500
     * @tc.name      testTagCycleSequence0555
     * @tc.desc      Verify TagStore four-step sequence ERTT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0555 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.toggleActivated(1);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0555 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_55600
     * @tc.name      testTagCycleSequence0556
     * @tc.desc      Verify TagStore four-step sequence ERTE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0556 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.toggleActivated(1);
      store.setEnabled(1, false);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0556 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_55700
     * @tc.name      testTagCycleSequence0557
     * @tc.desc      Verify TagStore four-step sequence ERTC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0557 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.toggleActivated(1);
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0557 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_55800
     * @tc.name      testTagCycleSequence0558
     * @tc.desc      Verify TagStore four-step sequence EREA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0558 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.setEnabled(1, false);
      store.add('w559_4');
      expect(store.count()).assertEqual(1);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('1:w559_4:0:1');
      expect(store.findById(1) === null).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0558 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_55900
     * @tc.name      testTagCycleSequence0559
     * @tc.desc      Verify TagStore four-step sequence ERER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0559 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.setEnabled(1, false);
      store.remove(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0559 end');
    })

    /**
     * @tc.number    SUB_CHIP_TSSP14_56000
     * @tc.name      testTagCycleSequence0560
     * @tc.desc      Verify TagStore four-step sequence ERET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCycleSequence0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0560 begin');
      await delayTick();
      const store: TagStore = new TagStore();
      store.setEnabled(1, false);
      store.remove(1);
      store.setEnabled(1, false);
      store.toggleActivated(1);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      const snapshot: string = store.getAll().map((item: TagItem) => item.id + ':' + item.text + ':' + (item.activated ? '1' : '0') + ':' + (item.enabled ? '1' : '0')).join('|');
      expect(snapshot).assertEqual('');
      expect(store.findById(1) === null).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCycleSequence0560 end');
    })

  })
}
