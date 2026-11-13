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

const TAG: string = '[Sample_toolBarItemIndependenceCore]';
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

export default function toolBarItemIndependenceCoreTest(): void {
  describe('toolBarItemIndependenceCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_0100
     * @tc.name      testToolBarItemIndependence0001
     * @tc.desc      Verify toolBarItemIndependenceCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_0', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_0', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_0');
      expect(second.id).assertEqual('second_0');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_0200
     * @tc.name      testToolBarItemIndependence0002
     * @tc.desc      Verify toolBarItemIndependenceCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_1', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_1', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_1');
      expect(second.id).assertEqual('second_1');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_0300
     * @tc.name      testToolBarItemIndependence0003
     * @tc.desc      Verify toolBarItemIndependenceCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_2', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_2', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_2');
      expect(second.id).assertEqual('second_2');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_0400
     * @tc.name      testToolBarItemIndependence0004
     * @tc.desc      Verify toolBarItemIndependenceCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_3', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_3', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_3');
      expect(second.id).assertEqual('second_3');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_0500
     * @tc.name      testToolBarItemIndependence0005
     * @tc.desc      Verify toolBarItemIndependenceCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_4', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_4', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_4');
      expect(second.id).assertEqual('second_4');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_0600
     * @tc.name      testToolBarItemIndependence0006
     * @tc.desc      Verify toolBarItemIndependenceCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_5', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_5', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_5');
      expect(second.id).assertEqual('second_5');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_0700
     * @tc.name      testToolBarItemIndependence0007
     * @tc.desc      Verify toolBarItemIndependenceCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_6', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_6', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_6');
      expect(second.id).assertEqual('second_6');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_0800
     * @tc.name      testToolBarItemIndependence0008
     * @tc.desc      Verify toolBarItemIndependenceCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_7', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_7', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_7');
      expect(second.id).assertEqual('second_7');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_0900
     * @tc.name      testToolBarItemIndependence0009
     * @tc.desc      Verify toolBarItemIndependenceCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_8', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_8', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_8');
      expect(second.id).assertEqual('second_8');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_1000
     * @tc.name      testToolBarItemIndependence0010
     * @tc.desc      Verify toolBarItemIndependenceCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_9', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_9', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_9');
      expect(second.id).assertEqual('second_9');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_1100
     * @tc.name      testToolBarItemIndependence0011
     * @tc.desc      Verify toolBarItemIndependenceCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_10', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_10', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_10');
      expect(second.id).assertEqual('second_10');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_1200
     * @tc.name      testToolBarItemIndependence0012
     * @tc.desc      Verify toolBarItemIndependenceCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_11', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_11', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_11');
      expect(second.id).assertEqual('second_11');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_1300
     * @tc.name      testToolBarItemIndependence0013
     * @tc.desc      Verify toolBarItemIndependenceCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_12', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_12', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_12');
      expect(second.id).assertEqual('second_12');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_1400
     * @tc.name      testToolBarItemIndependence0014
     * @tc.desc      Verify toolBarItemIndependenceCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_13', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_13', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_13');
      expect(second.id).assertEqual('second_13');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_1500
     * @tc.name      testToolBarItemIndependence0015
     * @tc.desc      Verify toolBarItemIndependenceCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_14', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_14', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_14');
      expect(second.id).assertEqual('second_14');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_1600
     * @tc.name      testToolBarItemIndependence0016
     * @tc.desc      Verify toolBarItemIndependenceCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_15', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_15', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_15');
      expect(second.id).assertEqual('second_15');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_1700
     * @tc.name      testToolBarItemIndependence0017
     * @tc.desc      Verify toolBarItemIndependenceCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_16', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_16', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_16');
      expect(second.id).assertEqual('second_16');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_1800
     * @tc.name      testToolBarItemIndependence0018
     * @tc.desc      Verify toolBarItemIndependenceCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_17', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_17', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_17');
      expect(second.id).assertEqual('second_17');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_1900
     * @tc.name      testToolBarItemIndependence0019
     * @tc.desc      Verify toolBarItemIndependenceCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_18', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_18', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_18');
      expect(second.id).assertEqual('second_18');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_2000
     * @tc.name      testToolBarItemIndependence0020
     * @tc.desc      Verify toolBarItemIndependenceCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_19', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_19', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_19');
      expect(second.id).assertEqual('second_19');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_2100
     * @tc.name      testToolBarItemIndependence0021
     * @tc.desc      Verify toolBarItemIndependenceCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_20', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_20', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_20');
      expect(second.id).assertEqual('second_20');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_2200
     * @tc.name      testToolBarItemIndependence0022
     * @tc.desc      Verify toolBarItemIndependenceCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_21', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_21', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_21');
      expect(second.id).assertEqual('second_21');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_2300
     * @tc.name      testToolBarItemIndependence0023
     * @tc.desc      Verify toolBarItemIndependenceCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_22', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_22', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_22');
      expect(second.id).assertEqual('second_22');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_2400
     * @tc.name      testToolBarItemIndependence0024
     * @tc.desc      Verify toolBarItemIndependenceCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_23', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_23', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_23');
      expect(second.id).assertEqual('second_23');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_2500
     * @tc.name      testToolBarItemIndependence0025
     * @tc.desc      Verify toolBarItemIndependenceCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_24', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_24', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_24');
      expect(second.id).assertEqual('second_24');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_2600
     * @tc.name      testToolBarItemIndependence0026
     * @tc.desc      Verify toolBarItemIndependenceCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_25', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_25', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_25');
      expect(second.id).assertEqual('second_25');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_2700
     * @tc.name      testToolBarItemIndependence0027
     * @tc.desc      Verify toolBarItemIndependenceCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_26', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_26', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_26');
      expect(second.id).assertEqual('second_26');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_2800
     * @tc.name      testToolBarItemIndependence0028
     * @tc.desc      Verify toolBarItemIndependenceCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_27', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_27', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_27');
      expect(second.id).assertEqual('second_27');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_2900
     * @tc.name      testToolBarItemIndependence0029
     * @tc.desc      Verify toolBarItemIndependenceCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_28', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_28', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_28');
      expect(second.id).assertEqual('second_28');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_3000
     * @tc.name      testToolBarItemIndependence0030
     * @tc.desc      Verify toolBarItemIndependenceCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_29', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_29', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_29');
      expect(second.id).assertEqual('second_29');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_3100
     * @tc.name      testToolBarItemIndependence0031
     * @tc.desc      Verify toolBarItemIndependenceCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_30', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_30', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_30');
      expect(second.id).assertEqual('second_30');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_3200
     * @tc.name      testToolBarItemIndependence0032
     * @tc.desc      Verify toolBarItemIndependenceCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_31', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_31', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_31');
      expect(second.id).assertEqual('second_31');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_3300
     * @tc.name      testToolBarItemIndependence0033
     * @tc.desc      Verify toolBarItemIndependenceCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_32', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_32', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_32');
      expect(second.id).assertEqual('second_32');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_3400
     * @tc.name      testToolBarItemIndependence0034
     * @tc.desc      Verify toolBarItemIndependenceCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_33', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_33', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_33');
      expect(second.id).assertEqual('second_33');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_3500
     * @tc.name      testToolBarItemIndependence0035
     * @tc.desc      Verify toolBarItemIndependenceCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_34', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_34', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_34');
      expect(second.id).assertEqual('second_34');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_3600
     * @tc.name      testToolBarItemIndependence0036
     * @tc.desc      Verify toolBarItemIndependenceCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_35', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_35', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_35');
      expect(second.id).assertEqual('second_35');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_3700
     * @tc.name      testToolBarItemIndependence0037
     * @tc.desc      Verify toolBarItemIndependenceCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_36', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_36', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_36');
      expect(second.id).assertEqual('second_36');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_3800
     * @tc.name      testToolBarItemIndependence0038
     * @tc.desc      Verify toolBarItemIndependenceCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_37', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_37', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_37');
      expect(second.id).assertEqual('second_37');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_3900
     * @tc.name      testToolBarItemIndependence0039
     * @tc.desc      Verify toolBarItemIndependenceCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_38', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_38', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_38');
      expect(second.id).assertEqual('second_38');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_4000
     * @tc.name      testToolBarItemIndependence0040
     * @tc.desc      Verify toolBarItemIndependenceCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_39', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_39', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_39');
      expect(second.id).assertEqual('second_39');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_4100
     * @tc.name      testToolBarItemIndependence0041
     * @tc.desc      Verify toolBarItemIndependenceCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_40', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_40', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_40');
      expect(second.id).assertEqual('second_40');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_4200
     * @tc.name      testToolBarItemIndependence0042
     * @tc.desc      Verify toolBarItemIndependenceCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_41', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_41', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_41');
      expect(second.id).assertEqual('second_41');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_4300
     * @tc.name      testToolBarItemIndependence0043
     * @tc.desc      Verify toolBarItemIndependenceCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_42', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_42', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_42');
      expect(second.id).assertEqual('second_42');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_4400
     * @tc.name      testToolBarItemIndependence0044
     * @tc.desc      Verify toolBarItemIndependenceCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_43', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_43', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_43');
      expect(second.id).assertEqual('second_43');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_4500
     * @tc.name      testToolBarItemIndependence0045
     * @tc.desc      Verify toolBarItemIndependenceCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_44', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_44', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_44');
      expect(second.id).assertEqual('second_44');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_4600
     * @tc.name      testToolBarItemIndependence0046
     * @tc.desc      Verify toolBarItemIndependenceCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_45', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_45', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_45');
      expect(second.id).assertEqual('second_45');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_4700
     * @tc.name      testToolBarItemIndependence0047
     * @tc.desc      Verify toolBarItemIndependenceCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_46', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_46', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_46');
      expect(second.id).assertEqual('second_46');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_4800
     * @tc.name      testToolBarItemIndependence0048
     * @tc.desc      Verify toolBarItemIndependenceCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_47', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_47', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_47');
      expect(second.id).assertEqual('second_47');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_4900
     * @tc.name      testToolBarItemIndependence0049
     * @tc.desc      Verify toolBarItemIndependenceCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_48', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_48', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_48');
      expect(second.id).assertEqual('second_48');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_5000
     * @tc.name      testToolBarItemIndependence0050
     * @tc.desc      Verify toolBarItemIndependenceCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_49', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_49', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_49');
      expect(second.id).assertEqual('second_49');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_5100
     * @tc.name      testToolBarItemIndependence0051
     * @tc.desc      Verify toolBarItemIndependenceCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_50', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_50', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_50');
      expect(second.id).assertEqual('second_50');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_5200
     * @tc.name      testToolBarItemIndependence0052
     * @tc.desc      Verify toolBarItemIndependenceCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_51', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_51', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_51');
      expect(second.id).assertEqual('second_51');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_5300
     * @tc.name      testToolBarItemIndependence0053
     * @tc.desc      Verify toolBarItemIndependenceCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_52', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_52', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_52');
      expect(second.id).assertEqual('second_52');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_5400
     * @tc.name      testToolBarItemIndependence0054
     * @tc.desc      Verify toolBarItemIndependenceCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_53', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_53', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_53');
      expect(second.id).assertEqual('second_53');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_5500
     * @tc.name      testToolBarItemIndependence0055
     * @tc.desc      Verify toolBarItemIndependenceCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_54', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_54', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_54');
      expect(second.id).assertEqual('second_54');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_5600
     * @tc.name      testToolBarItemIndependence0056
     * @tc.desc      Verify toolBarItemIndependenceCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_55', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_55', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_55');
      expect(second.id).assertEqual('second_55');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_5700
     * @tc.name      testToolBarItemIndependence0057
     * @tc.desc      Verify toolBarItemIndependenceCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_56', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_56', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_56');
      expect(second.id).assertEqual('second_56');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_5800
     * @tc.name      testToolBarItemIndependence0058
     * @tc.desc      Verify toolBarItemIndependenceCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_57', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_57', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_57');
      expect(second.id).assertEqual('second_57');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_5900
     * @tc.name      testToolBarItemIndependence0059
     * @tc.desc      Verify toolBarItemIndependenceCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_58', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_58', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_58');
      expect(second.id).assertEqual('second_58');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_6000
     * @tc.name      testToolBarItemIndependence0060
     * @tc.desc      Verify toolBarItemIndependenceCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_59', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_59', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_59');
      expect(second.id).assertEqual('second_59');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_6100
     * @tc.name      testToolBarItemIndependence0061
     * @tc.desc      Verify toolBarItemIndependenceCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_60', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_60', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_60');
      expect(second.id).assertEqual('second_60');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_6200
     * @tc.name      testToolBarItemIndependence0062
     * @tc.desc      Verify toolBarItemIndependenceCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_61', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_61', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_61');
      expect(second.id).assertEqual('second_61');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_6300
     * @tc.name      testToolBarItemIndependence0063
     * @tc.desc      Verify toolBarItemIndependenceCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_62', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_62', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_62');
      expect(second.id).assertEqual('second_62');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_6400
     * @tc.name      testToolBarItemIndependence0064
     * @tc.desc      Verify toolBarItemIndependenceCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_63', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_63', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_63');
      expect(second.id).assertEqual('second_63');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_6500
     * @tc.name      testToolBarItemIndependence0065
     * @tc.desc      Verify toolBarItemIndependenceCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_64', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_64', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_64');
      expect(second.id).assertEqual('second_64');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_6600
     * @tc.name      testToolBarItemIndependence0066
     * @tc.desc      Verify toolBarItemIndependenceCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_65', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_65', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_65');
      expect(second.id).assertEqual('second_65');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_6700
     * @tc.name      testToolBarItemIndependence0067
     * @tc.desc      Verify toolBarItemIndependenceCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_66', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_66', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_66');
      expect(second.id).assertEqual('second_66');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_6800
     * @tc.name      testToolBarItemIndependence0068
     * @tc.desc      Verify toolBarItemIndependenceCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_67', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_67', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_67');
      expect(second.id).assertEqual('second_67');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_6900
     * @tc.name      testToolBarItemIndependence0069
     * @tc.desc      Verify toolBarItemIndependenceCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_68', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_68', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_68');
      expect(second.id).assertEqual('second_68');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_7000
     * @tc.name      testToolBarItemIndependence0070
     * @tc.desc      Verify toolBarItemIndependenceCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_69', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_69', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_69');
      expect(second.id).assertEqual('second_69');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_7100
     * @tc.name      testToolBarItemIndependence0071
     * @tc.desc      Verify toolBarItemIndependenceCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_70', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_70', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_70');
      expect(second.id).assertEqual('second_70');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_7200
     * @tc.name      testToolBarItemIndependence0072
     * @tc.desc      Verify toolBarItemIndependenceCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_71', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_71', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_71');
      expect(second.id).assertEqual('second_71');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_7300
     * @tc.name      testToolBarItemIndependence0073
     * @tc.desc      Verify toolBarItemIndependenceCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_72', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_72', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_72');
      expect(second.id).assertEqual('second_72');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_7400
     * @tc.name      testToolBarItemIndependence0074
     * @tc.desc      Verify toolBarItemIndependenceCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_73', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_73', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_73');
      expect(second.id).assertEqual('second_73');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_7500
     * @tc.name      testToolBarItemIndependence0075
     * @tc.desc      Verify toolBarItemIndependenceCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_74', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_74', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_74');
      expect(second.id).assertEqual('second_74');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_7600
     * @tc.name      testToolBarItemIndependence0076
     * @tc.desc      Verify toolBarItemIndependenceCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_75', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_75', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_75');
      expect(second.id).assertEqual('second_75');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_7700
     * @tc.name      testToolBarItemIndependence0077
     * @tc.desc      Verify toolBarItemIndependenceCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_76', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_76', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_76');
      expect(second.id).assertEqual('second_76');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_7800
     * @tc.name      testToolBarItemIndependence0078
     * @tc.desc      Verify toolBarItemIndependenceCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_77', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_77', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_77');
      expect(second.id).assertEqual('second_77');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_7900
     * @tc.name      testToolBarItemIndependence0079
     * @tc.desc      Verify toolBarItemIndependenceCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_78', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_78', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_78');
      expect(second.id).assertEqual('second_78');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_8000
     * @tc.name      testToolBarItemIndependence0080
     * @tc.desc      Verify toolBarItemIndependenceCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_79', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_79', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_79');
      expect(second.id).assertEqual('second_79');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_IND_8100
     * @tc.name      testToolBarItemIndependence0081
     * @tc.desc      Verify toolBarItemIndependenceCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemIndependence0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: ToolBarItem = createToolBarItem('first_80', 'first_label', false);
      const second: ToolBarItem = createToolBarItem('second_80', 'second_label', false);
      first.isActive = true;
      expect(first.isActive).assertTrue();
      expect(second.isActive).assertFalse();
      expect(first.id).assertEqual('first_80');
      expect(second.id).assertEqual('second_80');
    });

  });
}
