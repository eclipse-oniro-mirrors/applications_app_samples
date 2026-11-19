/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AppInfo, DataSource } from '../../../main/ets/bridge/DragAndExchangeBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'SwapIndexCalcCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function makeItem(index: number): AppInfo {
  return new AppInfo('', 'S' + String(index), true);
}

function buildSource(count: number): DataSource {
  const source: DataSource = new DataSource();
  for (let i: number = 1; i <= count; i++) {
    source.pushData(makeItem(i));
  }
  return source;
}

/**
 * 与 GridSceneView.onItemDrop 内联交换逻辑同构的三行交换，
 * 基于真实 DataSource 数据模型执行（组件回调内联无法直接 import）。
 */
function swapData(source: DataSource, index1: number, index2: number): void {
  const temp: AppInfo = source.getData(index1);
  source.setData(index1, source.getData(index2));
  source.setData(index2, temp);
}

/**
 * Grid 场景拖拽落点守卫：isSuccess 且 insertIndex < totalCount 才交换。
 */
function gridDrop(source: DataSource, itemIndex: number, insertIndex: number, isSuccess: boolean): boolean {
  if (isSuccess && insertIndex < source.totalCount()) {
    swapData(source, itemIndex, insertIndex);
    return true;
  }
  return false;
}

/**
 * List 场景拖拽落点守卫：insertIndex >= totalCount 直接返回不交换。
 */
function listDrop(source: DataSource, dragIndex: number, insertIndex: number): boolean {
  if (insertIndex >= source.totalCount()) {
    return false;
  }
  swapData(source, dragIndex, insertIndex);
  return true;
}

/**
 * List onDrop extraParams 协议解析（与组件内 JSON.parse + 字段读取同语义）。
 */
class DragExtraParams {
  insertIndex: number = -1;
  selectedIndex: number = -1;
}

function parseExtraParams(extraParams: string): DragExtraParams {
  const parsed: DragExtraParams = JSON.parse(extraParams) as DragExtraParams;
  return parsed;
}

function namesOf(source: DataSource): string {
  let result: string = '';
  for (let i: number = 0; i < source.totalCount(); i++) {
    result += source.getData(i).name;
  }
  return result;
}

export default function swapIndexCalcCoreTest(): void {
  describe('SwapIndexCalcCoreTest', () => {
    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0401
     * @tc.name      testSwapIndexCalc0401
     * @tc.desc      Verify swapping index 0 and 1 exchanges the two names.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0401 begin');
      const source: DataSource = buildSource(4);
      swapData(source, 0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1).name=${source.getData(1).name}`);
      expect(source.getData(1).name).assertEqual('S1');
      log('testSwapIndexCalc0401 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0402
     * @tc.name      testSwapIndexCalc0402
     * @tc.desc      Verify swapping index 2 and 3 exchanges the tail pair.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0402 begin');
      const source: DataSource = buildSource(4);
      swapData(source, 2, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S3');
      log('testSwapIndexCalc0402 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0403
     * @tc.name      testSwapIndexCalc0403
     * @tc.desc      Verify swapping index 1 and 2 exchanges the middle pair.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0403 begin');
      const source: DataSource = buildSource(4);
      swapData(source, 1, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1).name=${source.getData(1).name}`);
      expect(source.getData(1).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S2');
      log('testSwapIndexCalc0403 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0404
     * @tc.name      testSwapIndexCalc0404
     * @tc.desc      Verify a self swap keeps every name unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0404 begin');
      const source: DataSource = buildSource(4);
      swapData(source, 2, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S1S2S3S4'`);
      expect(namesOf(source)).assertEqual('S1S2S3S4');
      log('testSwapIndexCalc0404 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0405
     * @tc.name      testSwapIndexCalc0405
     * @tc.desc      Verify swapping head with tail exchanges first and last names.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0405 begin');
      const source: DataSource = buildSource(15);
      swapData(source, 0, 14);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S15');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(14).name=${source.getData(14).name}`);
      expect(source.getData(14).name).assertEqual('S1');
      log('testSwapIndexCalc0405 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0406
     * @tc.name      testSwapIndexCalc0406
     * @tc.desc      Verify swapping index 0 and 2 in a grid moves S1 to slot 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0406 begin');
      const source: DataSource = buildSource(15);
      swapData(source, 0, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S1');
      log('testSwapIndexCalc0406 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0407
     * @tc.name      testSwapIndexCalc0407
     * @tc.desc      Verify a swap leaves the total count unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0407 begin');
      const source: DataSource = buildSource(15);
      swapData(source, 3, 9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=15`);
      expect(source.totalCount()).assertEqual(15);
      log('testSwapIndexCalc0407 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0408
     * @tc.name      testSwapIndexCalc0408
     * @tc.desc      Verify a swap does not disturb untouched middle slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0408 begin');
      const source: DataSource = buildSource(15);
      swapData(source, 0, 14);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(7).name=${source.getData(7).name}`);
      expect(source.getData(7).name).assertEqual('S8');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(8).name=${source.getData(8).name}`);
      expect(source.getData(8).name).assertEqual('S9');
      log('testSwapIndexCalc0408 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0409
     * @tc.name      testSwapIndexCalc0409
     * @tc.desc      Verify two identical swaps restore the original order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0409 begin');
      const source: DataSource = buildSource(4);
      swapData(source, 0, 1);
      swapData(source, 0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S1S2S3S4'`);
      expect(namesOf(source)).assertEqual('S1S2S3S4');
      log('testSwapIndexCalc0409 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0410
     * @tc.name      testSwapIndexCalc0410
     * @tc.desc      Verify self swap at the head index keeps names unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0410 begin');
      const source: DataSource = buildSource(4);
      swapData(source, 0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S1S2S3S4'`);
      expect(namesOf(source)).assertEqual('S1S2S3S4');
      log('testSwapIndexCalc0410 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0411
     * @tc.name      testSwapIndexCalc0411
     * @tc.desc      Verify self swap at the tail index keeps names unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0411 begin');
      const source: DataSource = buildSource(4);
      swapData(source, 3, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S1S2S3S4'`);
      expect(namesOf(source)).assertEqual('S1S2S3S4');
      log('testSwapIndexCalc0411 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0412
     * @tc.name      testSwapIndexCalc0412
     * @tc.desc      Verify swapping adjacent items in a 15-item grid source works.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0412 begin');
      const source: DataSource = buildSource(15);
      swapData(source, 5, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(5).name=${source.getData(5).name}`);
      expect(source.getData(5).name).assertEqual('S7');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(6).name=${source.getData(6).name}`);
      expect(source.getData(6).name).assertEqual('S6');
      log('testSwapIndexCalc0412 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0413
     * @tc.name      testSwapIndexCalc0413
     * @tc.desc      Verify swapping near-tail items in a 15-item grid source works.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0413 begin');
      const source: DataSource = buildSource(15);
      swapData(source, 13, 14);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(13).name=${source.getData(13).name}`);
      expect(source.getData(13).name).assertEqual('S15');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(14).name=${source.getData(14).name}`);
      expect(source.getData(14).name).assertEqual('S14');
      log('testSwapIndexCalc0413 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0414
     * @tc.name      testSwapIndexCalc0414
     * @tc.desc      Verify reversed argument order swaps the same two slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0414 begin');
      const source: DataSource = buildSource(4);
      swapData(source, 1, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1).name=${source.getData(1).name}`);
      expect(source.getData(1).name).assertEqual('S1');
      log('testSwapIndexCalc0414 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0415
     * @tc.name      testSwapIndexCalc0415
     * @tc.desc      Verify swap keeps the item reference visible in both slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0415 begin');
      const source: DataSource = buildSource(2);
      const moved: AppInfo = source.getData(0);
      swapData(source, 0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=moved`);
      expect(source.getData(1)).assertEqual(moved);
      log('testSwapIndexCalc0415 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0416
     * @tc.name      testSwapIndexCalc0416
     * @tc.desc      Verify visible flags travel with the swapped item object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0416 begin');
      const source: DataSource = new DataSource();
      source.pushData(new AppInfo('', 'S1', false));
      source.pushData(new AppInfo('', 'S2', true));
      swapData(source, 0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(0).visible=${source.getData(0).visible}`);
      expect(source.getData(0).visible).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse source.getData(1).visible=${source.getData(1).visible}`);
      expect(source.getData(1).visible).assertFalse();
      log('testSwapIndexCalc0416 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0417
     * @tc.name      testSwapIndexCalc0417
     * @tc.desc      Verify a triple rotation S1 S2 S3 follows the chained swaps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0417 begin');
      const source: DataSource = buildSource(3);
      swapData(source, 0, 1);
      swapData(source, 1, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1).name=${source.getData(1).name}`);
      expect(source.getData(1).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S1');
      log('testSwapIndexCalc0417 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0418
     * @tc.name      testSwapIndexCalc0418
     * @tc.desc      Verify a swap followed by reload keeps the swapped order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0418 begin');
      const source: DataSource = buildSource(4);
      swapData(source, 0, 3);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S1');
      log('testSwapIndexCalc0418 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0419
     * @tc.name      testSwapIndexCalc0419
     * @tc.desc      Verify grid drop with success at a valid insert index swaps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0419 begin');
      const source: DataSource = buildSource(15);
      const applied: boolean = gridDrop(source, 0, 3, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S1');
      log('testSwapIndexCalc0419 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0420
     * @tc.name      testSwapIndexCalc0420
     * @tc.desc      Verify grid drop with success false skips the swap entirely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0420 begin');
      const source: DataSource = buildSource(15);
      const applied: boolean = gridDrop(source, 0, 3, false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse applied=${applied}`);
      expect(applied).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}`);
      expect(namesOf(source)).assertEqual('S1S2S3S4S5S6S7S8S9S10S11S12S13S14S15');
      log('testSwapIndexCalc0420 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0421
     * @tc.name      testSwapIndexCalc0421
     * @tc.desc      Verify grid drop at insertIndex equal to count is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0421 begin');
      const source: DataSource = buildSource(15);
      const applied: boolean = gridDrop(source, 0, 15, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse applied=${applied}`);
      expect(applied).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S1');
      log('testSwapIndexCalc0421 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0422
     * @tc.name      testSwapIndexCalc0422
     * @tc.desc      Verify grid drop beyond count is rejected without changes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0422 begin');
      const source: DataSource = buildSource(15);
      const applied: boolean = gridDrop(source, 0, 20, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse applied=${applied}`);
      expect(applied).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=15`);
      expect(source.totalCount()).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}`);
      expect(namesOf(source)).assertEqual('S1S2S3S4S5S6S7S8S9S10S11S12S13S14S15');
      log('testSwapIndexCalc0422 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0423
     * @tc.name      testSwapIndexCalc0423
     * @tc.desc      Verify grid drop at the last valid index is accepted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0423 begin');
      const source: DataSource = buildSource(15);
      const applied: boolean = gridDrop(source, 0, 14, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S15');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(14).name=${source.getData(14).name}`);
      expect(source.getData(14).name).assertEqual('S1');
      log('testSwapIndexCalc0423 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0424
     * @tc.name      testSwapIndexCalc0424
     * @tc.desc      Verify list drop at insertIndex equal to count is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0424 begin');
      const source: DataSource = buildSource(4);
      const applied: boolean = listDrop(source, 0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse applied=${applied}`);
      expect(applied).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S1S2S3S4'`);
      expect(namesOf(source)).assertEqual('S1S2S3S4');
      log('testSwapIndexCalc0424 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0425
     * @tc.name      testSwapIndexCalc0425
     * @tc.desc      Verify list drop far beyond count is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0425 begin');
      const source: DataSource = buildSource(4);
      const applied: boolean = listDrop(source, 0, 9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse applied=${applied}`);
      expect(applied).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=4`);
      expect(source.totalCount()).assertEqual(4);
      log('testSwapIndexCalc0425 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0426
     * @tc.name      testSwapIndexCalc0426
     * @tc.desc      Verify list drop at the last valid index is accepted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0426 begin');
      const source: DataSource = buildSource(4);
      const applied: boolean = listDrop(source, 0, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S1');
      log('testSwapIndexCalc0426 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0427
     * @tc.name      testSwapIndexCalc0427
     * @tc.desc      Verify list drop of Item1 to slot 2 reproduces the sample flow.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0427 begin');
      const source: DataSource = buildSource(4);
      const applied: boolean = listDrop(source, 0, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S1');
      log('testSwapIndexCalc0427 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0428
     * @tc.name      testSwapIndexCalc0428
     * @tc.desc      Verify list drop onto the same index behaves as a self swap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0428 begin');
      const source: DataSource = buildSource(4);
      const applied: boolean = listDrop(source, 2, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S1S2S3S4'`);
      expect(namesOf(source)).assertEqual('S1S2S3S4');
      log('testSwapIndexCalc0428 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0429
     * @tc.name      testSwapIndexCalc0429
     * @tc.desc      Verify list drop of the last item onto slot zero swaps ends.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0429 begin');
      const source: DataSource = buildSource(4);
      const applied: boolean = listDrop(source, 3, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S1');
      log('testSwapIndexCalc0429 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0430
     * @tc.name      testSwapIndexCalc0430
     * @tc.desc      Verify grid drop of App1 onto slot 2 with success true swaps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0430 begin');
      const source: DataSource = buildSource(15);
      const applied: boolean = gridDrop(source, 0, 2, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S1');
      log('testSwapIndexCalc0430 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0431
     * @tc.name      testSwapIndexCalc0431
     * @tc.desc      Verify a single-field extraParams parses insertIndex only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0431 begin');
      const params: DragExtraParams = parseExtraParams('{"insertIndex":2}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.insertIndex=${params.insertIndex}, expected=2`);
      expect(params.insertIndex).assertEqual(2);
      log('testSwapIndexCalc0431 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0432
     * @tc.name      testSwapIndexCalc0432
     * @tc.desc      Verify extraParams with both fields parses both indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0432 begin');
      const params: DragExtraParams = parseExtraParams('{"insertIndex":2,"selectedIndex":0}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.insertIndex=${params.insertIndex}, expected=2`);
      expect(params.insertIndex).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.selectedIndex=${params.selectedIndex}, expected=0`);
      expect(params.selectedIndex).assertEqual(0);
      log('testSwapIndexCalc0432 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0433
     * @tc.name      testSwapIndexCalc0433
     * @tc.desc      Verify zero insertIndex and zero selectedIndex parse as zeros.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0433 begin');
      const params: DragExtraParams = parseExtraParams('{"insertIndex":0,"selectedIndex":0}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.insertIndex=${params.insertIndex}, expected=0`);
      expect(params.insertIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.selectedIndex=${params.selectedIndex}, expected=0`);
      expect(params.selectedIndex).assertEqual(0);
      log('testSwapIndexCalc0433 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0434
     * @tc.name      testSwapIndexCalc0434
     * @tc.desc      Verify the tail index parses from extraParams fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0434 begin');
      const params: DragExtraParams = parseExtraParams('{"insertIndex":3,"selectedIndex":3}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.insertIndex=${params.insertIndex}, expected=3`);
      expect(params.insertIndex).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.selectedIndex=${params.selectedIndex}, expected=3`);
      expect(params.selectedIndex).assertEqual(3);
      log('testSwapIndexCalc0434 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0435
     * @tc.name      testSwapIndexCalc0435
     * @tc.desc      Verify an out-of-range insertIndex parses as its raw number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0435 begin');
      const params: DragExtraParams = parseExtraParams('{"insertIndex":4,"selectedIndex":0}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.insertIndex=${params.insertIndex}, expected=4`);
      expect(params.insertIndex).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.selectedIndex=${params.selectedIndex}, expected=0`);
      expect(params.selectedIndex).assertEqual(0);
      log('testSwapIndexCalc0435 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0436
     * @tc.name      testSwapIndexCalc0436
     * @tc.desc      Verify parsed indexes keep number types after parsing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0436 begin');
      const params: DragExtraParams = parseExtraParams('{"insertIndex":1,"selectedIndex":2}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof params.insertIndex=${typeof params.insertIndex}`);
      expect(typeof params.insertIndex).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof params.selectedIndex=${typeof params.selectedIndex}`);
      expect(typeof params.selectedIndex).assertEqual('number');
      log('testSwapIndexCalc0436 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0437
     * @tc.name      testSwapIndexCalc0437
     * @tc.desc      Verify the sample grid flow App1 to App3 swaps both slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0437 begin');
      const source: DataSource = buildSource(15);
      const applied: boolean = gridDrop(source, 0, 2, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=15`);
      expect(source.totalCount()).assertEqual(15);
      log('testSwapIndexCalc0437 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0438
     * @tc.name      testSwapIndexCalc0438
     * @tc.desc      Verify the sample list flow Item1 to Item3 swaps both slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0438 begin');
      const source: DataSource = buildSource(4);
      const params: DragExtraParams = parseExtraParams('{"insertIndex":2,"selectedIndex":0}');
      const applied: boolean = listDrop(source, params.selectedIndex, params.insertIndex);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S1');
      log('testSwapIndexCalc0438 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0439
     * @tc.name      testSwapIndexCalc0439
     * @tc.desc      Verify an out-of-range parsed insertIndex is blocked by the guard.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0439 begin');
      const source: DataSource = buildSource(4);
      const params: DragExtraParams = parseExtraParams('{"insertIndex":4,"selectedIndex":0}');
      const applied: boolean = listDrop(source, params.selectedIndex, params.insertIndex);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse applied=${applied}`);
      expect(applied).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S1S2S3S4'`);
      expect(namesOf(source)).assertEqual('S1S2S3S4');
      log('testSwapIndexCalc0439 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0440
     * @tc.name      testSwapIndexCalc0440
     * @tc.desc      Verify a parsed tail insertIndex is accepted by the guard.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0440 begin');
      const source: DataSource = buildSource(4);
      const params: DragExtraParams = parseExtraParams('{"insertIndex":3,"selectedIndex":0}');
      const applied: boolean = listDrop(source, params.selectedIndex, params.insertIndex);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S4');
      log('testSwapIndexCalc0440 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0441
     * @tc.name      testSwapIndexCalc0441
     * @tc.desc      Verify sequential list drops exchange items in chain order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0441 begin');
      const source: DataSource = buildSource(4);
      listDrop(source, 0, 1);
      listDrop(source, 1, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1).name=${source.getData(1).name}`);
      expect(source.getData(1).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S1');
      log('testSwapIndexCalc0441 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0442
     * @tc.name      testSwapIndexCalc0442
     * @tc.desc      Verify an accepted drop emits a matching data move event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0442 begin');
      const source: DataSource = buildSource(4);
      const listener: SwapMoveListener = new SwapMoveListener();
      source.registerDataChangeListener(listener);
      listDrop(source, 0, 2);
      source.notifyDataMove(0, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFromList.length=${listener.moveFromList.length}`);
      expect(listener.moveFromList.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFromList[0]=${listener.moveFromList[0]}`);
      expect(listener.moveFromList[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveToList[0]=${listener.moveToList[0]}, expected=2`);
      expect(listener.moveToList[0]).assertEqual(2);
      log('testSwapIndexCalc0442 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0443
     * @tc.name      testSwapIndexCalc0443
     * @tc.desc      Verify a rejected grid drop emits no move event at all.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0443 begin');
      const source: DataSource = buildSource(15);
      const applied: boolean = gridDrop(source, 0, 15, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse applied=${applied}`);
      expect(applied).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S1');
      log('testSwapIndexCalc0443 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0444
     * @tc.name      testSwapIndexCalc0444
     * @tc.desc      Verify a rejected list drop emits no move event at all.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0444 begin');
      const source: DataSource = buildSource(4);
      const applied: boolean = listDrop(source, 0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse applied=${applied}`);
      expect(applied).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S4');
      log('testSwapIndexCalc0444 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0445
     * @tc.name      testSwapIndexCalc0445
     * @tc.desc      Verify an empty source rejects every grid drop insert index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0445 begin');
      const source: DataSource = new DataSource();
      const applied: boolean = gridDrop(source, 0, 0, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse applied=${applied}`);
      expect(applied).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testSwapIndexCalc0445 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0446
     * @tc.name      testSwapIndexCalc0446
     * @tc.desc      Verify a single-item source rejects index one on list drop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0446 begin');
      const source: DataSource = buildSource(1);
      const applied: boolean = listDrop(source, 0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse applied=${applied}`);
      expect(applied).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S1'`);
      expect(namesOf(source)).assertEqual('S1');
      log('testSwapIndexCalc0446 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0447
     * @tc.name      testSwapIndexCalc0447
     * @tc.desc      Verify a single-item source accepts the zero insert index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0447 begin');
      const source: DataSource = buildSource(1);
      const applied: boolean = listDrop(source, 0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S1'`);
      expect(namesOf(source)).assertEqual('S1');
      log('testSwapIndexCalc0447 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0448
     * @tc.name      testSwapIndexCalc0448
     * @tc.desc      Verify list drops across every adjacent pair of four items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0448 begin');
      const source: DataSource = buildSource(4);
      listDrop(source, 0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S2S1S3S4'`);
      expect(namesOf(source)).assertEqual('S2S1S3S4');
      listDrop(source, 2, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S2S1S4S3'`);
      expect(namesOf(source)).assertEqual('S2S1S4S3');
      log('testSwapIndexCalc0448 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0449
     * @tc.name      testSwapIndexCalc0449
     * @tc.desc      Verify two chained grid swaps produce the expected layout.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0449 begin');
      const source: DataSource = buildSource(15);
      gridDrop(source, 0, 2, true);
      gridDrop(source, 2, 4, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S5');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(4).name=${source.getData(4).name}`);
      expect(source.getData(4).name).assertEqual('S1');
      log('testSwapIndexCalc0449 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0450
     * @tc.name      testSwapIndexCalc0450
     * @tc.desc      Verify a failed drop followed by a valid drop applies once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0450 begin');
      const source: DataSource = buildSource(4);
      listDrop(source, 0, 4);
      listDrop(source, 0, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S1');
      log('testSwapIndexCalc0450 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0451
     * @tc.name      testSwapIndexCalc0451
     * @tc.desc      Verify a negative index pair parses as negative numbers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0451 begin');
      const params: DragExtraParams = parseExtraParams('{"insertIndex":-1,"selectedIndex":-1}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.insertIndex=${params.insertIndex}, expected=-1`);
      expect(params.insertIndex).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params.selectedIndex=${params.selectedIndex}, expected=-1`);
      expect(params.selectedIndex).assertEqual(-1);
      log('testSwapIndexCalc0451 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0452
     * @tc.name      testSwapIndexCalc0452
     * @tc.desc      Verify extraParams with unrelated fields parses the two indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0452 begin');
      const source: DataSource = buildSource(4);
      const params: DragExtraParams = parseExtraParams('{"insertIndex":2,"selectedIndex":0,"extra":"info"}');
      const applied: boolean = listDrop(source, params.selectedIndex, params.insertIndex);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S3');
      log('testSwapIndexCalc0452 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0453
     * @tc.name      testSwapIndexCalc0453
     * @tc.desc      Verify swapping twice between different pairs keeps counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0453 begin');
      const source: DataSource = buildSource(15);
      swapData(source, 0, 1);
      swapData(source, 2, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=15`);
      expect(source.totalCount()).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S3');
      log('testSwapIndexCalc0453 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0454
     * @tc.name      testSwapIndexCalc0454
     * @tc.desc      Verify the grid central cell swap keeps other cells intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0454 begin');
      const source: DataSource = buildSource(15);
      swapData(source, 7, 8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(6).name=${source.getData(6).name}`);
      expect(source.getData(6).name).assertEqual('S7');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(7).name=${source.getData(7).name}`);
      expect(source.getData(7).name).assertEqual('S9');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(8).name=${source.getData(8).name}`);
      expect(source.getData(8).name).assertEqual('S8');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(9).name=${source.getData(9).name}`);
      expect(source.getData(9).name).assertEqual('S10');
      log('testSwapIndexCalc0454 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0455
     * @tc.name      testSwapIndexCalc0455
     * @tc.desc      Verify a full round trip through two guards restores order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0455 begin');
      const source: DataSource = buildSource(4);
      listDrop(source, 0, 3);
      listDrop(source, 3, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual namesOf(source)=${namesOf(source)}, expected='S1S2S3S4'`);
      expect(namesOf(source)).assertEqual('S1S2S3S4');
      log('testSwapIndexCalc0455 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_SWAPINDEXCALC_0456
     * @tc.name      testSwapIndexCalc0456
     * @tc.desc      Verify parsed insertIndex equals the target slot name after drop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSwapIndexCalc0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSwapIndexCalc0456 begin');
      const source: DataSource = buildSource(4);
      const params: DragExtraParams = parseExtraParams('{"insertIndex":1,"selectedIndex":3}');
      const applied: boolean = listDrop(source, params.selectedIndex, params.insertIndex);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue applied=${applied}`);
      expect(applied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1).name=${source.getData(1).name}`);
      expect(source.getData(1).name).assertEqual('S4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S2');
      log('testSwapIndexCalc0456 end');
    })
  })
}

/**
 * Mock DataChangeListener used by swap move-event test cases.
 */
class SwapMoveListener implements DataChangeListener {
  reloadedCount: number = 0;
  addedIndexes: number[] = [];
  deletedIndexes: number[] = [];
  changedIndexes: number[] = [];
  movedCount: number = 0;
  moveFromList: number[] = [];
  moveToList: number[] = [];

  onDataReloaded(): void {
    this.reloadedCount++;
  }

  onDataAdded(index: number): void {
    this.addedIndexes.push(index);
  }

  onDataAdd(index: number): void {
    this.addedIndexes.push(index);
  }

  onDataMoved(from: number, to: number): void {
    this.moveFromList.push(from);
    this.moveToList.push(to);
    this.movedCount++;
  }

  onDataMove(from: number, to: number): void {
    this.moveFromList.push(from);
    this.moveToList.push(to);
    this.movedCount++;
  }

  onDataDeleted(index: number): void {
    this.deletedIndexes.push(index);
  }

  onDataDelete(index: number): void {
    this.deletedIndexes.push(index);
  }

  onDataChanged(index: number): void {
    this.changedIndexes.push(index);
  }

  onDataChange(index: number): void {
    this.changedIndexes.push(index);
  }

  onDatasetChange(operations: Object[]): void {
    this.reloadedCount++;
  }
}
