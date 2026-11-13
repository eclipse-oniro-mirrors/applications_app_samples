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

const TAG: string = '[Sample_toolBarItemDefaultsCore]';
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

export default function toolBarItemDefaultsCoreTest(): void {
  describe('toolBarItemDefaultsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_0100
     * @tc.name      testToolBarItemDefaults0001
     * @tc.desc      Verify toolBarItemDefaultsCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_0', 'label_0', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_0200
     * @tc.name      testToolBarItemDefaults0002
     * @tc.desc      Verify toolBarItemDefaultsCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_1', 'label_1', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_0300
     * @tc.name      testToolBarItemDefaults0003
     * @tc.desc      Verify toolBarItemDefaultsCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_2', 'label_2', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_0400
     * @tc.name      testToolBarItemDefaults0004
     * @tc.desc      Verify toolBarItemDefaultsCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_3', 'label_3', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_0500
     * @tc.name      testToolBarItemDefaults0005
     * @tc.desc      Verify toolBarItemDefaultsCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_4', 'label_4', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_0600
     * @tc.name      testToolBarItemDefaults0006
     * @tc.desc      Verify toolBarItemDefaultsCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_5', 'label_5', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_0700
     * @tc.name      testToolBarItemDefaults0007
     * @tc.desc      Verify toolBarItemDefaultsCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_6', 'label_6', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_0800
     * @tc.name      testToolBarItemDefaults0008
     * @tc.desc      Verify toolBarItemDefaultsCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_7', 'label_7', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_0900
     * @tc.name      testToolBarItemDefaults0009
     * @tc.desc      Verify toolBarItemDefaultsCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_8', 'label_8', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_1000
     * @tc.name      testToolBarItemDefaults0010
     * @tc.desc      Verify toolBarItemDefaultsCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_9', 'label_9', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_1100
     * @tc.name      testToolBarItemDefaults0011
     * @tc.desc      Verify toolBarItemDefaultsCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_10', 'label_10', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_1200
     * @tc.name      testToolBarItemDefaults0012
     * @tc.desc      Verify toolBarItemDefaultsCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_11', 'label_11', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_1300
     * @tc.name      testToolBarItemDefaults0013
     * @tc.desc      Verify toolBarItemDefaultsCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_12', 'label_12', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_1400
     * @tc.name      testToolBarItemDefaults0014
     * @tc.desc      Verify toolBarItemDefaultsCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_13', 'label_13', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_1500
     * @tc.name      testToolBarItemDefaults0015
     * @tc.desc      Verify toolBarItemDefaultsCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_14', 'label_14', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_1600
     * @tc.name      testToolBarItemDefaults0016
     * @tc.desc      Verify toolBarItemDefaultsCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_15', 'label_15', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_1700
     * @tc.name      testToolBarItemDefaults0017
     * @tc.desc      Verify toolBarItemDefaultsCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_16', 'label_16', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_1800
     * @tc.name      testToolBarItemDefaults0018
     * @tc.desc      Verify toolBarItemDefaultsCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_17', 'label_17', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_1900
     * @tc.name      testToolBarItemDefaults0019
     * @tc.desc      Verify toolBarItemDefaultsCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_18', 'label_18', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_2000
     * @tc.name      testToolBarItemDefaults0020
     * @tc.desc      Verify toolBarItemDefaultsCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_19', 'label_19', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_2100
     * @tc.name      testToolBarItemDefaults0021
     * @tc.desc      Verify toolBarItemDefaultsCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_20', 'label_20', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_2200
     * @tc.name      testToolBarItemDefaults0022
     * @tc.desc      Verify toolBarItemDefaultsCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_21', 'label_21', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_2300
     * @tc.name      testToolBarItemDefaults0023
     * @tc.desc      Verify toolBarItemDefaultsCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_22', 'label_22', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_2400
     * @tc.name      testToolBarItemDefaults0024
     * @tc.desc      Verify toolBarItemDefaultsCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_23', 'label_23', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_2500
     * @tc.name      testToolBarItemDefaults0025
     * @tc.desc      Verify toolBarItemDefaultsCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_24', 'label_24', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_2600
     * @tc.name      testToolBarItemDefaults0026
     * @tc.desc      Verify toolBarItemDefaultsCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_25', 'label_25', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_2700
     * @tc.name      testToolBarItemDefaults0027
     * @tc.desc      Verify toolBarItemDefaultsCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_26', 'label_26', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_2800
     * @tc.name      testToolBarItemDefaults0028
     * @tc.desc      Verify toolBarItemDefaultsCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_27', 'label_27', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_2900
     * @tc.name      testToolBarItemDefaults0029
     * @tc.desc      Verify toolBarItemDefaultsCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_28', 'label_28', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_3000
     * @tc.name      testToolBarItemDefaults0030
     * @tc.desc      Verify toolBarItemDefaultsCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_29', 'label_29', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_3100
     * @tc.name      testToolBarItemDefaults0031
     * @tc.desc      Verify toolBarItemDefaultsCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_30', 'label_30', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_3200
     * @tc.name      testToolBarItemDefaults0032
     * @tc.desc      Verify toolBarItemDefaultsCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_31', 'label_31', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_3300
     * @tc.name      testToolBarItemDefaults0033
     * @tc.desc      Verify toolBarItemDefaultsCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_32', 'label_32', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_3400
     * @tc.name      testToolBarItemDefaults0034
     * @tc.desc      Verify toolBarItemDefaultsCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_33', 'label_33', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_3500
     * @tc.name      testToolBarItemDefaults0035
     * @tc.desc      Verify toolBarItemDefaultsCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_34', 'label_34', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_3600
     * @tc.name      testToolBarItemDefaults0036
     * @tc.desc      Verify toolBarItemDefaultsCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_35', 'label_35', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_3700
     * @tc.name      testToolBarItemDefaults0037
     * @tc.desc      Verify toolBarItemDefaultsCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_36', 'label_36', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_3800
     * @tc.name      testToolBarItemDefaults0038
     * @tc.desc      Verify toolBarItemDefaultsCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_37', 'label_37', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_3900
     * @tc.name      testToolBarItemDefaults0039
     * @tc.desc      Verify toolBarItemDefaultsCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_38', 'label_38', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_4000
     * @tc.name      testToolBarItemDefaults0040
     * @tc.desc      Verify toolBarItemDefaultsCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_39', 'label_39', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_4100
     * @tc.name      testToolBarItemDefaults0041
     * @tc.desc      Verify toolBarItemDefaultsCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_40', 'label_40', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_4200
     * @tc.name      testToolBarItemDefaults0042
     * @tc.desc      Verify toolBarItemDefaultsCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_41', 'label_41', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_4300
     * @tc.name      testToolBarItemDefaults0043
     * @tc.desc      Verify toolBarItemDefaultsCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_42', 'label_42', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_4400
     * @tc.name      testToolBarItemDefaults0044
     * @tc.desc      Verify toolBarItemDefaultsCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_43', 'label_43', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_4500
     * @tc.name      testToolBarItemDefaults0045
     * @tc.desc      Verify toolBarItemDefaultsCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_44', 'label_44', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_4600
     * @tc.name      testToolBarItemDefaults0046
     * @tc.desc      Verify toolBarItemDefaultsCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_45', 'label_45', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_4700
     * @tc.name      testToolBarItemDefaults0047
     * @tc.desc      Verify toolBarItemDefaultsCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_46', 'label_46', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_4800
     * @tc.name      testToolBarItemDefaults0048
     * @tc.desc      Verify toolBarItemDefaultsCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_47', 'label_47', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_4900
     * @tc.name      testToolBarItemDefaults0049
     * @tc.desc      Verify toolBarItemDefaultsCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_48', 'label_48', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_5000
     * @tc.name      testToolBarItemDefaults0050
     * @tc.desc      Verify toolBarItemDefaultsCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_49', 'label_49', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_5100
     * @tc.name      testToolBarItemDefaults0051
     * @tc.desc      Verify toolBarItemDefaultsCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_50', 'label_50', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_5200
     * @tc.name      testToolBarItemDefaults0052
     * @tc.desc      Verify toolBarItemDefaultsCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_51', 'label_51', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_5300
     * @tc.name      testToolBarItemDefaults0053
     * @tc.desc      Verify toolBarItemDefaultsCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_52', 'label_52', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_5400
     * @tc.name      testToolBarItemDefaults0054
     * @tc.desc      Verify toolBarItemDefaultsCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_53', 'label_53', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_5500
     * @tc.name      testToolBarItemDefaults0055
     * @tc.desc      Verify toolBarItemDefaultsCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_54', 'label_54', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_5600
     * @tc.name      testToolBarItemDefaults0056
     * @tc.desc      Verify toolBarItemDefaultsCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_55', 'label_55', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_5700
     * @tc.name      testToolBarItemDefaults0057
     * @tc.desc      Verify toolBarItemDefaultsCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_56', 'label_56', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_5800
     * @tc.name      testToolBarItemDefaults0058
     * @tc.desc      Verify toolBarItemDefaultsCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_57', 'label_57', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_5900
     * @tc.name      testToolBarItemDefaults0059
     * @tc.desc      Verify toolBarItemDefaultsCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_58', 'label_58', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_6000
     * @tc.name      testToolBarItemDefaults0060
     * @tc.desc      Verify toolBarItemDefaultsCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_59', 'label_59', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_6100
     * @tc.name      testToolBarItemDefaults0061
     * @tc.desc      Verify toolBarItemDefaultsCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_60', 'label_60', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_6200
     * @tc.name      testToolBarItemDefaults0062
     * @tc.desc      Verify toolBarItemDefaultsCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_61', 'label_61', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_6300
     * @tc.name      testToolBarItemDefaults0063
     * @tc.desc      Verify toolBarItemDefaultsCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_62', 'label_62', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_6400
     * @tc.name      testToolBarItemDefaults0064
     * @tc.desc      Verify toolBarItemDefaultsCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_63', 'label_63', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_6500
     * @tc.name      testToolBarItemDefaults0065
     * @tc.desc      Verify toolBarItemDefaultsCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_64', 'label_64', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_6600
     * @tc.name      testToolBarItemDefaults0066
     * @tc.desc      Verify toolBarItemDefaultsCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_65', 'label_65', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_6700
     * @tc.name      testToolBarItemDefaults0067
     * @tc.desc      Verify toolBarItemDefaultsCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_66', 'label_66', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_6800
     * @tc.name      testToolBarItemDefaults0068
     * @tc.desc      Verify toolBarItemDefaultsCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_67', 'label_67', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_6900
     * @tc.name      testToolBarItemDefaults0069
     * @tc.desc      Verify toolBarItemDefaultsCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_68', 'label_68', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_7000
     * @tc.name      testToolBarItemDefaults0070
     * @tc.desc      Verify toolBarItemDefaultsCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_69', 'label_69', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_7100
     * @tc.name      testToolBarItemDefaults0071
     * @tc.desc      Verify toolBarItemDefaultsCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_70', 'label_70', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_7200
     * @tc.name      testToolBarItemDefaults0072
     * @tc.desc      Verify toolBarItemDefaultsCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_71', 'label_71', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_7300
     * @tc.name      testToolBarItemDefaults0073
     * @tc.desc      Verify toolBarItemDefaultsCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_72', 'label_72', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_7400
     * @tc.name      testToolBarItemDefaults0074
     * @tc.desc      Verify toolBarItemDefaultsCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_73', 'label_73', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_7500
     * @tc.name      testToolBarItemDefaults0075
     * @tc.desc      Verify toolBarItemDefaultsCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_74', 'label_74', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_7600
     * @tc.name      testToolBarItemDefaults0076
     * @tc.desc      Verify toolBarItemDefaultsCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_75', 'label_75', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_7700
     * @tc.name      testToolBarItemDefaults0077
     * @tc.desc      Verify toolBarItemDefaultsCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_76', 'label_76', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_7800
     * @tc.name      testToolBarItemDefaults0078
     * @tc.desc      Verify toolBarItemDefaultsCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_77', 'label_77', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_7900
     * @tc.name      testToolBarItemDefaults0079
     * @tc.desc      Verify toolBarItemDefaultsCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_78', 'label_78', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_8000
     * @tc.name      testToolBarItemDefaults0080
     * @tc.desc      Verify toolBarItemDefaultsCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_79', 'label_79', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_DEF_8100
     * @tc.name      testToolBarItemDefaults0081
     * @tc.desc      Verify toolBarItemDefaultsCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemDefaults0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_80', 'label_80', false);
      expect(item.isActive).assertFalse();
      expect(typeof item.onClick).assertEqual('function');
      expect(item.iconInactive === undefined).assertTrue();
    });

  });
}
