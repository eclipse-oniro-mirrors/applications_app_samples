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

const TAG: string = '[Sample_toolBarItemFieldsCore]';
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

export default function toolBarItemFieldsCoreTest(): void {
  describe('toolBarItemFieldsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_0100
     * @tc.name      testToolBarItemFields0001
     * @tc.desc      Verify toolBarItemFieldsCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_0', 'label_0', true);
      expect(item.id).assertEqual('id_0');
      expect(item.label).assertEqual('label_0');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_0200
     * @tc.name      testToolBarItemFields0002
     * @tc.desc      Verify toolBarItemFieldsCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_1', 'label_1', true);
      expect(item.id).assertEqual('id_1');
      expect(item.label).assertEqual('label_1');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_0300
     * @tc.name      testToolBarItemFields0003
     * @tc.desc      Verify toolBarItemFieldsCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_2', 'label_2', true);
      expect(item.id).assertEqual('id_2');
      expect(item.label).assertEqual('label_2');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_0400
     * @tc.name      testToolBarItemFields0004
     * @tc.desc      Verify toolBarItemFieldsCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_3', 'label_3', true);
      expect(item.id).assertEqual('id_3');
      expect(item.label).assertEqual('label_3');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_0500
     * @tc.name      testToolBarItemFields0005
     * @tc.desc      Verify toolBarItemFieldsCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_4', 'label_4', true);
      expect(item.id).assertEqual('id_4');
      expect(item.label).assertEqual('label_4');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_0600
     * @tc.name      testToolBarItemFields0006
     * @tc.desc      Verify toolBarItemFieldsCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_5', 'label_5', true);
      expect(item.id).assertEqual('id_5');
      expect(item.label).assertEqual('label_5');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_0700
     * @tc.name      testToolBarItemFields0007
     * @tc.desc      Verify toolBarItemFieldsCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_6', 'label_6', true);
      expect(item.id).assertEqual('id_6');
      expect(item.label).assertEqual('label_6');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_0800
     * @tc.name      testToolBarItemFields0008
     * @tc.desc      Verify toolBarItemFieldsCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_7', 'label_7', true);
      expect(item.id).assertEqual('id_7');
      expect(item.label).assertEqual('label_7');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_0900
     * @tc.name      testToolBarItemFields0009
     * @tc.desc      Verify toolBarItemFieldsCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_8', 'label_8', true);
      expect(item.id).assertEqual('id_8');
      expect(item.label).assertEqual('label_8');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_1000
     * @tc.name      testToolBarItemFields0010
     * @tc.desc      Verify toolBarItemFieldsCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_9', 'label_9', true);
      expect(item.id).assertEqual('id_9');
      expect(item.label).assertEqual('label_9');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_1100
     * @tc.name      testToolBarItemFields0011
     * @tc.desc      Verify toolBarItemFieldsCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_10', 'label_10', true);
      expect(item.id).assertEqual('id_10');
      expect(item.label).assertEqual('label_10');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_1200
     * @tc.name      testToolBarItemFields0012
     * @tc.desc      Verify toolBarItemFieldsCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_11', 'label_11', true);
      expect(item.id).assertEqual('id_11');
      expect(item.label).assertEqual('label_11');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_1300
     * @tc.name      testToolBarItemFields0013
     * @tc.desc      Verify toolBarItemFieldsCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_12', 'label_12', true);
      expect(item.id).assertEqual('id_12');
      expect(item.label).assertEqual('label_12');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_1400
     * @tc.name      testToolBarItemFields0014
     * @tc.desc      Verify toolBarItemFieldsCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_13', 'label_13', true);
      expect(item.id).assertEqual('id_13');
      expect(item.label).assertEqual('label_13');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_1500
     * @tc.name      testToolBarItemFields0015
     * @tc.desc      Verify toolBarItemFieldsCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_14', 'label_14', true);
      expect(item.id).assertEqual('id_14');
      expect(item.label).assertEqual('label_14');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_1600
     * @tc.name      testToolBarItemFields0016
     * @tc.desc      Verify toolBarItemFieldsCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_15', 'label_15', true);
      expect(item.id).assertEqual('id_15');
      expect(item.label).assertEqual('label_15');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_1700
     * @tc.name      testToolBarItemFields0017
     * @tc.desc      Verify toolBarItemFieldsCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_16', 'label_16', true);
      expect(item.id).assertEqual('id_16');
      expect(item.label).assertEqual('label_16');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_1800
     * @tc.name      testToolBarItemFields0018
     * @tc.desc      Verify toolBarItemFieldsCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_17', 'label_17', true);
      expect(item.id).assertEqual('id_17');
      expect(item.label).assertEqual('label_17');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_1900
     * @tc.name      testToolBarItemFields0019
     * @tc.desc      Verify toolBarItemFieldsCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_18', 'label_18', true);
      expect(item.id).assertEqual('id_18');
      expect(item.label).assertEqual('label_18');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_2000
     * @tc.name      testToolBarItemFields0020
     * @tc.desc      Verify toolBarItemFieldsCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_19', 'label_19', true);
      expect(item.id).assertEqual('id_19');
      expect(item.label).assertEqual('label_19');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_2100
     * @tc.name      testToolBarItemFields0021
     * @tc.desc      Verify toolBarItemFieldsCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_20', 'label_20', true);
      expect(item.id).assertEqual('id_20');
      expect(item.label).assertEqual('label_20');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_2200
     * @tc.name      testToolBarItemFields0022
     * @tc.desc      Verify toolBarItemFieldsCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_21', 'label_21', true);
      expect(item.id).assertEqual('id_21');
      expect(item.label).assertEqual('label_21');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_2300
     * @tc.name      testToolBarItemFields0023
     * @tc.desc      Verify toolBarItemFieldsCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_22', 'label_22', true);
      expect(item.id).assertEqual('id_22');
      expect(item.label).assertEqual('label_22');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_2400
     * @tc.name      testToolBarItemFields0024
     * @tc.desc      Verify toolBarItemFieldsCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_23', 'label_23', true);
      expect(item.id).assertEqual('id_23');
      expect(item.label).assertEqual('label_23');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_2500
     * @tc.name      testToolBarItemFields0025
     * @tc.desc      Verify toolBarItemFieldsCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_24', 'label_24', true);
      expect(item.id).assertEqual('id_24');
      expect(item.label).assertEqual('label_24');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_2600
     * @tc.name      testToolBarItemFields0026
     * @tc.desc      Verify toolBarItemFieldsCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_25', 'label_25', true);
      expect(item.id).assertEqual('id_25');
      expect(item.label).assertEqual('label_25');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_2700
     * @tc.name      testToolBarItemFields0027
     * @tc.desc      Verify toolBarItemFieldsCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_26', 'label_26', true);
      expect(item.id).assertEqual('id_26');
      expect(item.label).assertEqual('label_26');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_2800
     * @tc.name      testToolBarItemFields0028
     * @tc.desc      Verify toolBarItemFieldsCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_27', 'label_27', true);
      expect(item.id).assertEqual('id_27');
      expect(item.label).assertEqual('label_27');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_2900
     * @tc.name      testToolBarItemFields0029
     * @tc.desc      Verify toolBarItemFieldsCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_28', 'label_28', true);
      expect(item.id).assertEqual('id_28');
      expect(item.label).assertEqual('label_28');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_3000
     * @tc.name      testToolBarItemFields0030
     * @tc.desc      Verify toolBarItemFieldsCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_29', 'label_29', true);
      expect(item.id).assertEqual('id_29');
      expect(item.label).assertEqual('label_29');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_3100
     * @tc.name      testToolBarItemFields0031
     * @tc.desc      Verify toolBarItemFieldsCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_30', 'label_30', true);
      expect(item.id).assertEqual('id_30');
      expect(item.label).assertEqual('label_30');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_3200
     * @tc.name      testToolBarItemFields0032
     * @tc.desc      Verify toolBarItemFieldsCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_31', 'label_31', true);
      expect(item.id).assertEqual('id_31');
      expect(item.label).assertEqual('label_31');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_3300
     * @tc.name      testToolBarItemFields0033
     * @tc.desc      Verify toolBarItemFieldsCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_32', 'label_32', true);
      expect(item.id).assertEqual('id_32');
      expect(item.label).assertEqual('label_32');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_3400
     * @tc.name      testToolBarItemFields0034
     * @tc.desc      Verify toolBarItemFieldsCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_33', 'label_33', true);
      expect(item.id).assertEqual('id_33');
      expect(item.label).assertEqual('label_33');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_3500
     * @tc.name      testToolBarItemFields0035
     * @tc.desc      Verify toolBarItemFieldsCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_34', 'label_34', true);
      expect(item.id).assertEqual('id_34');
      expect(item.label).assertEqual('label_34');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_3600
     * @tc.name      testToolBarItemFields0036
     * @tc.desc      Verify toolBarItemFieldsCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_35', 'label_35', true);
      expect(item.id).assertEqual('id_35');
      expect(item.label).assertEqual('label_35');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_3700
     * @tc.name      testToolBarItemFields0037
     * @tc.desc      Verify toolBarItemFieldsCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_36', 'label_36', true);
      expect(item.id).assertEqual('id_36');
      expect(item.label).assertEqual('label_36');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_3800
     * @tc.name      testToolBarItemFields0038
     * @tc.desc      Verify toolBarItemFieldsCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_37', 'label_37', true);
      expect(item.id).assertEqual('id_37');
      expect(item.label).assertEqual('label_37');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_3900
     * @tc.name      testToolBarItemFields0039
     * @tc.desc      Verify toolBarItemFieldsCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_38', 'label_38', true);
      expect(item.id).assertEqual('id_38');
      expect(item.label).assertEqual('label_38');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_4000
     * @tc.name      testToolBarItemFields0040
     * @tc.desc      Verify toolBarItemFieldsCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_39', 'label_39', true);
      expect(item.id).assertEqual('id_39');
      expect(item.label).assertEqual('label_39');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_4100
     * @tc.name      testToolBarItemFields0041
     * @tc.desc      Verify toolBarItemFieldsCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_40', 'label_40', true);
      expect(item.id).assertEqual('id_40');
      expect(item.label).assertEqual('label_40');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_4200
     * @tc.name      testToolBarItemFields0042
     * @tc.desc      Verify toolBarItemFieldsCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_41', 'label_41', true);
      expect(item.id).assertEqual('id_41');
      expect(item.label).assertEqual('label_41');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_4300
     * @tc.name      testToolBarItemFields0043
     * @tc.desc      Verify toolBarItemFieldsCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_42', 'label_42', true);
      expect(item.id).assertEqual('id_42');
      expect(item.label).assertEqual('label_42');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_4400
     * @tc.name      testToolBarItemFields0044
     * @tc.desc      Verify toolBarItemFieldsCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_43', 'label_43', true);
      expect(item.id).assertEqual('id_43');
      expect(item.label).assertEqual('label_43');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_4500
     * @tc.name      testToolBarItemFields0045
     * @tc.desc      Verify toolBarItemFieldsCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_44', 'label_44', true);
      expect(item.id).assertEqual('id_44');
      expect(item.label).assertEqual('label_44');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_4600
     * @tc.name      testToolBarItemFields0046
     * @tc.desc      Verify toolBarItemFieldsCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_45', 'label_45', true);
      expect(item.id).assertEqual('id_45');
      expect(item.label).assertEqual('label_45');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_4700
     * @tc.name      testToolBarItemFields0047
     * @tc.desc      Verify toolBarItemFieldsCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_46', 'label_46', true);
      expect(item.id).assertEqual('id_46');
      expect(item.label).assertEqual('label_46');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_4800
     * @tc.name      testToolBarItemFields0048
     * @tc.desc      Verify toolBarItemFieldsCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_47', 'label_47', true);
      expect(item.id).assertEqual('id_47');
      expect(item.label).assertEqual('label_47');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_4900
     * @tc.name      testToolBarItemFields0049
     * @tc.desc      Verify toolBarItemFieldsCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_48', 'label_48', true);
      expect(item.id).assertEqual('id_48');
      expect(item.label).assertEqual('label_48');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_5000
     * @tc.name      testToolBarItemFields0050
     * @tc.desc      Verify toolBarItemFieldsCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_49', 'label_49', true);
      expect(item.id).assertEqual('id_49');
      expect(item.label).assertEqual('label_49');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_5100
     * @tc.name      testToolBarItemFields0051
     * @tc.desc      Verify toolBarItemFieldsCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_50', 'label_50', true);
      expect(item.id).assertEqual('id_50');
      expect(item.label).assertEqual('label_50');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_5200
     * @tc.name      testToolBarItemFields0052
     * @tc.desc      Verify toolBarItemFieldsCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_51', 'label_51', true);
      expect(item.id).assertEqual('id_51');
      expect(item.label).assertEqual('label_51');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_5300
     * @tc.name      testToolBarItemFields0053
     * @tc.desc      Verify toolBarItemFieldsCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_52', 'label_52', true);
      expect(item.id).assertEqual('id_52');
      expect(item.label).assertEqual('label_52');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_5400
     * @tc.name      testToolBarItemFields0054
     * @tc.desc      Verify toolBarItemFieldsCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_53', 'label_53', true);
      expect(item.id).assertEqual('id_53');
      expect(item.label).assertEqual('label_53');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_5500
     * @tc.name      testToolBarItemFields0055
     * @tc.desc      Verify toolBarItemFieldsCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_54', 'label_54', true);
      expect(item.id).assertEqual('id_54');
      expect(item.label).assertEqual('label_54');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_5600
     * @tc.name      testToolBarItemFields0056
     * @tc.desc      Verify toolBarItemFieldsCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_55', 'label_55', true);
      expect(item.id).assertEqual('id_55');
      expect(item.label).assertEqual('label_55');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_5700
     * @tc.name      testToolBarItemFields0057
     * @tc.desc      Verify toolBarItemFieldsCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_56', 'label_56', true);
      expect(item.id).assertEqual('id_56');
      expect(item.label).assertEqual('label_56');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_5800
     * @tc.name      testToolBarItemFields0058
     * @tc.desc      Verify toolBarItemFieldsCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_57', 'label_57', true);
      expect(item.id).assertEqual('id_57');
      expect(item.label).assertEqual('label_57');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_5900
     * @tc.name      testToolBarItemFields0059
     * @tc.desc      Verify toolBarItemFieldsCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_58', 'label_58', true);
      expect(item.id).assertEqual('id_58');
      expect(item.label).assertEqual('label_58');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_6000
     * @tc.name      testToolBarItemFields0060
     * @tc.desc      Verify toolBarItemFieldsCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_59', 'label_59', true);
      expect(item.id).assertEqual('id_59');
      expect(item.label).assertEqual('label_59');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_6100
     * @tc.name      testToolBarItemFields0061
     * @tc.desc      Verify toolBarItemFieldsCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_60', 'label_60', true);
      expect(item.id).assertEqual('id_60');
      expect(item.label).assertEqual('label_60');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_6200
     * @tc.name      testToolBarItemFields0062
     * @tc.desc      Verify toolBarItemFieldsCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_61', 'label_61', true);
      expect(item.id).assertEqual('id_61');
      expect(item.label).assertEqual('label_61');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_6300
     * @tc.name      testToolBarItemFields0063
     * @tc.desc      Verify toolBarItemFieldsCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_62', 'label_62', true);
      expect(item.id).assertEqual('id_62');
      expect(item.label).assertEqual('label_62');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_6400
     * @tc.name      testToolBarItemFields0064
     * @tc.desc      Verify toolBarItemFieldsCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_63', 'label_63', true);
      expect(item.id).assertEqual('id_63');
      expect(item.label).assertEqual('label_63');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_6500
     * @tc.name      testToolBarItemFields0065
     * @tc.desc      Verify toolBarItemFieldsCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_64', 'label_64', true);
      expect(item.id).assertEqual('id_64');
      expect(item.label).assertEqual('label_64');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_6600
     * @tc.name      testToolBarItemFields0066
     * @tc.desc      Verify toolBarItemFieldsCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_65', 'label_65', true);
      expect(item.id).assertEqual('id_65');
      expect(item.label).assertEqual('label_65');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_6700
     * @tc.name      testToolBarItemFields0067
     * @tc.desc      Verify toolBarItemFieldsCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_66', 'label_66', true);
      expect(item.id).assertEqual('id_66');
      expect(item.label).assertEqual('label_66');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_6800
     * @tc.name      testToolBarItemFields0068
     * @tc.desc      Verify toolBarItemFieldsCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_67', 'label_67', true);
      expect(item.id).assertEqual('id_67');
      expect(item.label).assertEqual('label_67');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_6900
     * @tc.name      testToolBarItemFields0069
     * @tc.desc      Verify toolBarItemFieldsCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_68', 'label_68', true);
      expect(item.id).assertEqual('id_68');
      expect(item.label).assertEqual('label_68');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_7000
     * @tc.name      testToolBarItemFields0070
     * @tc.desc      Verify toolBarItemFieldsCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_69', 'label_69', true);
      expect(item.id).assertEqual('id_69');
      expect(item.label).assertEqual('label_69');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_7100
     * @tc.name      testToolBarItemFields0071
     * @tc.desc      Verify toolBarItemFieldsCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_70', 'label_70', true);
      expect(item.id).assertEqual('id_70');
      expect(item.label).assertEqual('label_70');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_7200
     * @tc.name      testToolBarItemFields0072
     * @tc.desc      Verify toolBarItemFieldsCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_71', 'label_71', true);
      expect(item.id).assertEqual('id_71');
      expect(item.label).assertEqual('label_71');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_7300
     * @tc.name      testToolBarItemFields0073
     * @tc.desc      Verify toolBarItemFieldsCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_72', 'label_72', true);
      expect(item.id).assertEqual('id_72');
      expect(item.label).assertEqual('label_72');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_7400
     * @tc.name      testToolBarItemFields0074
     * @tc.desc      Verify toolBarItemFieldsCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_73', 'label_73', true);
      expect(item.id).assertEqual('id_73');
      expect(item.label).assertEqual('label_73');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_7500
     * @tc.name      testToolBarItemFields0075
     * @tc.desc      Verify toolBarItemFieldsCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_74', 'label_74', true);
      expect(item.id).assertEqual('id_74');
      expect(item.label).assertEqual('label_74');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_7600
     * @tc.name      testToolBarItemFields0076
     * @tc.desc      Verify toolBarItemFieldsCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_75', 'label_75', true);
      expect(item.id).assertEqual('id_75');
      expect(item.label).assertEqual('label_75');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_7700
     * @tc.name      testToolBarItemFields0077
     * @tc.desc      Verify toolBarItemFieldsCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_76', 'label_76', true);
      expect(item.id).assertEqual('id_76');
      expect(item.label).assertEqual('label_76');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_7800
     * @tc.name      testToolBarItemFields0078
     * @tc.desc      Verify toolBarItemFieldsCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_77', 'label_77', true);
      expect(item.id).assertEqual('id_77');
      expect(item.label).assertEqual('label_77');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_7900
     * @tc.name      testToolBarItemFields0079
     * @tc.desc      Verify toolBarItemFieldsCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_78', 'label_78', true);
      expect(item.id).assertEqual('id_78');
      expect(item.label).assertEqual('label_78');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_8000
     * @tc.name      testToolBarItemFields0080
     * @tc.desc      Verify toolBarItemFieldsCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_79', 'label_79', true);
      expect(item.id).assertEqual('id_79');
      expect(item.label).assertEqual('label_79');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_FIELD_8100
     * @tc.name      testToolBarItemFields0081
     * @tc.desc      Verify toolBarItemFieldsCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemFields0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_80', 'label_80', true);
      expect(item.id).assertEqual('id_80');
      expect(item.label).assertEqual('label_80');
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
    });

  });
}
