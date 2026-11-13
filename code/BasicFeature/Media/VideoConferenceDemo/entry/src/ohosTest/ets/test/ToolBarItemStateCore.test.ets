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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ToolBarItem } from '../../../main/ets/components/CustomToolBarItem';

const TAG: string = '[Sample_toolBarItemStateCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

function createToolBarItem(id: string, label: string, active: boolean): ToolBarItem {
  return new ToolBarItem({
    id: id,
    label: label,
    iconActive: $r('sys.symbol.mic_fill'),
    iconActiveColors: [Color.White],
    iconInActiveColors: [Color.White, Color.Red],
    isActive: active
  });
}

export default function toolBarItemStateCoreTest(): void {
  describe('toolBarItemStateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_0100
     * @tc.name      testToolBarItemState0001
     * @tc.desc      Verify toolBarItemStateCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_0', 'label_0', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_0200
     * @tc.name      testToolBarItemState0002
     * @tc.desc      Verify toolBarItemStateCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_1', 'label_1', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_0300
     * @tc.name      testToolBarItemState0003
     * @tc.desc      Verify toolBarItemStateCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_2', 'label_2', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_0400
     * @tc.name      testToolBarItemState0004
     * @tc.desc      Verify toolBarItemStateCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_3', 'label_3', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_0500
     * @tc.name      testToolBarItemState0005
     * @tc.desc      Verify toolBarItemStateCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_4', 'label_4', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_0600
     * @tc.name      testToolBarItemState0006
     * @tc.desc      Verify toolBarItemStateCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_5', 'label_5', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_0700
     * @tc.name      testToolBarItemState0007
     * @tc.desc      Verify toolBarItemStateCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_6', 'label_6', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_0800
     * @tc.name      testToolBarItemState0008
     * @tc.desc      Verify toolBarItemStateCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_7', 'label_7', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_0900
     * @tc.name      testToolBarItemState0009
     * @tc.desc      Verify toolBarItemStateCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_8', 'label_8', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_1000
     * @tc.name      testToolBarItemState0010
     * @tc.desc      Verify toolBarItemStateCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_9', 'label_9', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_1100
     * @tc.name      testToolBarItemState0011
     * @tc.desc      Verify toolBarItemStateCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_10', 'label_10', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_1200
     * @tc.name      testToolBarItemState0012
     * @tc.desc      Verify toolBarItemStateCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_11', 'label_11', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_1300
     * @tc.name      testToolBarItemState0013
     * @tc.desc      Verify toolBarItemStateCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_12', 'label_12', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_1400
     * @tc.name      testToolBarItemState0014
     * @tc.desc      Verify toolBarItemStateCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_13', 'label_13', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_1500
     * @tc.name      testToolBarItemState0015
     * @tc.desc      Verify toolBarItemStateCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_14', 'label_14', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_1600
     * @tc.name      testToolBarItemState0016
     * @tc.desc      Verify toolBarItemStateCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_15', 'label_15', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_1700
     * @tc.name      testToolBarItemState0017
     * @tc.desc      Verify toolBarItemStateCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_16', 'label_16', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_1800
     * @tc.name      testToolBarItemState0018
     * @tc.desc      Verify toolBarItemStateCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_17', 'label_17', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_1900
     * @tc.name      testToolBarItemState0019
     * @tc.desc      Verify toolBarItemStateCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_18', 'label_18', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_2000
     * @tc.name      testToolBarItemState0020
     * @tc.desc      Verify toolBarItemStateCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_19', 'label_19', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_2100
     * @tc.name      testToolBarItemState0021
     * @tc.desc      Verify toolBarItemStateCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_20', 'label_20', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_2200
     * @tc.name      testToolBarItemState0022
     * @tc.desc      Verify toolBarItemStateCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_21', 'label_21', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_2300
     * @tc.name      testToolBarItemState0023
     * @tc.desc      Verify toolBarItemStateCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_22', 'label_22', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_2400
     * @tc.name      testToolBarItemState0024
     * @tc.desc      Verify toolBarItemStateCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_23', 'label_23', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_2500
     * @tc.name      testToolBarItemState0025
     * @tc.desc      Verify toolBarItemStateCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_24', 'label_24', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_2600
     * @tc.name      testToolBarItemState0026
     * @tc.desc      Verify toolBarItemStateCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_25', 'label_25', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_2700
     * @tc.name      testToolBarItemState0027
     * @tc.desc      Verify toolBarItemStateCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_26', 'label_26', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_2800
     * @tc.name      testToolBarItemState0028
     * @tc.desc      Verify toolBarItemStateCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_27', 'label_27', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_2900
     * @tc.name      testToolBarItemState0029
     * @tc.desc      Verify toolBarItemStateCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_28', 'label_28', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_3000
     * @tc.name      testToolBarItemState0030
     * @tc.desc      Verify toolBarItemStateCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_29', 'label_29', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_3100
     * @tc.name      testToolBarItemState0031
     * @tc.desc      Verify toolBarItemStateCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_30', 'label_30', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_3200
     * @tc.name      testToolBarItemState0032
     * @tc.desc      Verify toolBarItemStateCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_31', 'label_31', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_3300
     * @tc.name      testToolBarItemState0033
     * @tc.desc      Verify toolBarItemStateCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_32', 'label_32', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_3400
     * @tc.name      testToolBarItemState0034
     * @tc.desc      Verify toolBarItemStateCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_33', 'label_33', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_3500
     * @tc.name      testToolBarItemState0035
     * @tc.desc      Verify toolBarItemStateCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_34', 'label_34', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_3600
     * @tc.name      testToolBarItemState0036
     * @tc.desc      Verify toolBarItemStateCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_35', 'label_35', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_3700
     * @tc.name      testToolBarItemState0037
     * @tc.desc      Verify toolBarItemStateCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_36', 'label_36', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_3800
     * @tc.name      testToolBarItemState0038
     * @tc.desc      Verify toolBarItemStateCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_37', 'label_37', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_3900
     * @tc.name      testToolBarItemState0039
     * @tc.desc      Verify toolBarItemStateCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_38', 'label_38', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_4000
     * @tc.name      testToolBarItemState0040
     * @tc.desc      Verify toolBarItemStateCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_39', 'label_39', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_4100
     * @tc.name      testToolBarItemState0041
     * @tc.desc      Verify toolBarItemStateCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_40', 'label_40', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_4200
     * @tc.name      testToolBarItemState0042
     * @tc.desc      Verify toolBarItemStateCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_41', 'label_41', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_4300
     * @tc.name      testToolBarItemState0043
     * @tc.desc      Verify toolBarItemStateCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_42', 'label_42', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_4400
     * @tc.name      testToolBarItemState0044
     * @tc.desc      Verify toolBarItemStateCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_43', 'label_43', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_4500
     * @tc.name      testToolBarItemState0045
     * @tc.desc      Verify toolBarItemStateCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_44', 'label_44', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_4600
     * @tc.name      testToolBarItemState0046
     * @tc.desc      Verify toolBarItemStateCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_45', 'label_45', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_4700
     * @tc.name      testToolBarItemState0047
     * @tc.desc      Verify toolBarItemStateCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_46', 'label_46', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_4800
     * @tc.name      testToolBarItemState0048
     * @tc.desc      Verify toolBarItemStateCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_47', 'label_47', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_4900
     * @tc.name      testToolBarItemState0049
     * @tc.desc      Verify toolBarItemStateCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_48', 'label_48', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_5000
     * @tc.name      testToolBarItemState0050
     * @tc.desc      Verify toolBarItemStateCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_49', 'label_49', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_5100
     * @tc.name      testToolBarItemState0051
     * @tc.desc      Verify toolBarItemStateCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_50', 'label_50', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_5200
     * @tc.name      testToolBarItemState0052
     * @tc.desc      Verify toolBarItemStateCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_51', 'label_51', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_5300
     * @tc.name      testToolBarItemState0053
     * @tc.desc      Verify toolBarItemStateCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_52', 'label_52', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_5400
     * @tc.name      testToolBarItemState0054
     * @tc.desc      Verify toolBarItemStateCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_53', 'label_53', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_5500
     * @tc.name      testToolBarItemState0055
     * @tc.desc      Verify toolBarItemStateCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_54', 'label_54', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_5600
     * @tc.name      testToolBarItemState0056
     * @tc.desc      Verify toolBarItemStateCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_55', 'label_55', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_5700
     * @tc.name      testToolBarItemState0057
     * @tc.desc      Verify toolBarItemStateCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_56', 'label_56', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_5800
     * @tc.name      testToolBarItemState0058
     * @tc.desc      Verify toolBarItemStateCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_57', 'label_57', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_5900
     * @tc.name      testToolBarItemState0059
     * @tc.desc      Verify toolBarItemStateCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_58', 'label_58', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_6000
     * @tc.name      testToolBarItemState0060
     * @tc.desc      Verify toolBarItemStateCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_59', 'label_59', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_6100
     * @tc.name      testToolBarItemState0061
     * @tc.desc      Verify toolBarItemStateCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_60', 'label_60', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_6200
     * @tc.name      testToolBarItemState0062
     * @tc.desc      Verify toolBarItemStateCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_61', 'label_61', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_6300
     * @tc.name      testToolBarItemState0063
     * @tc.desc      Verify toolBarItemStateCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_62', 'label_62', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_6400
     * @tc.name      testToolBarItemState0064
     * @tc.desc      Verify toolBarItemStateCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_63', 'label_63', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_6500
     * @tc.name      testToolBarItemState0065
     * @tc.desc      Verify toolBarItemStateCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_64', 'label_64', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_6600
     * @tc.name      testToolBarItemState0066
     * @tc.desc      Verify toolBarItemStateCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_65', 'label_65', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_6700
     * @tc.name      testToolBarItemState0067
     * @tc.desc      Verify toolBarItemStateCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_66', 'label_66', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_6800
     * @tc.name      testToolBarItemState0068
     * @tc.desc      Verify toolBarItemStateCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_67', 'label_67', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_6900
     * @tc.name      testToolBarItemState0069
     * @tc.desc      Verify toolBarItemStateCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_68', 'label_68', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_7000
     * @tc.name      testToolBarItemState0070
     * @tc.desc      Verify toolBarItemStateCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_69', 'label_69', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_7100
     * @tc.name      testToolBarItemState0071
     * @tc.desc      Verify toolBarItemStateCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_70', 'label_70', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_7200
     * @tc.name      testToolBarItemState0072
     * @tc.desc      Verify toolBarItemStateCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_71', 'label_71', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_7300
     * @tc.name      testToolBarItemState0073
     * @tc.desc      Verify toolBarItemStateCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_72', 'label_72', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_7400
     * @tc.name      testToolBarItemState0074
     * @tc.desc      Verify toolBarItemStateCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_73', 'label_73', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_7500
     * @tc.name      testToolBarItemState0075
     * @tc.desc      Verify toolBarItemStateCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_74', 'label_74', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_7600
     * @tc.name      testToolBarItemState0076
     * @tc.desc      Verify toolBarItemStateCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_75', 'label_75', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_7700
     * @tc.name      testToolBarItemState0077
     * @tc.desc      Verify toolBarItemStateCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_76', 'label_76', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_7800
     * @tc.name      testToolBarItemState0078
     * @tc.desc      Verify toolBarItemStateCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_77', 'label_77', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_7900
     * @tc.name      testToolBarItemState0079
     * @tc.desc      Verify toolBarItemStateCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_78', 'label_78', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_8000
     * @tc.name      testToolBarItemState0080
     * @tc.desc      Verify toolBarItemStateCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_79', 'label_79', false);
      expect(item.isActive).assertEqual(false);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(true);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_STATE_8100
     * @tc.name      testToolBarItemState0081
     * @tc.desc      Verify toolBarItemStateCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemState0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_80', 'label_80', true);
      expect(item.isActive).assertEqual(true);
      item.isActive = !item.isActive;
      expect(item.isActive).assertEqual(false);
    });

  });
}
