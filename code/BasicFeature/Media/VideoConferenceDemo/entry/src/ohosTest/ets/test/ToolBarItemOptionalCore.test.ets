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

const TAG: string = '[Sample_toolBarItemOptionalCore]';
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

export default function toolBarItemOptionalCoreTest(): void {
  describe('toolBarItemOptionalCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_0100
     * @tc.name      testToolBarItemOptional0001
     * @tc.desc      Verify toolBarItemOptionalCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_0', 'label_0', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_0200
     * @tc.name      testToolBarItemOptional0002
     * @tc.desc      Verify toolBarItemOptionalCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_1', 'label_1', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_0300
     * @tc.name      testToolBarItemOptional0003
     * @tc.desc      Verify toolBarItemOptionalCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_2', 'label_2', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_0400
     * @tc.name      testToolBarItemOptional0004
     * @tc.desc      Verify toolBarItemOptionalCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_3', 'label_3', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_0500
     * @tc.name      testToolBarItemOptional0005
     * @tc.desc      Verify toolBarItemOptionalCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_4', 'label_4', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_0600
     * @tc.name      testToolBarItemOptional0006
     * @tc.desc      Verify toolBarItemOptionalCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_5', 'label_5', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_0700
     * @tc.name      testToolBarItemOptional0007
     * @tc.desc      Verify toolBarItemOptionalCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_6', 'label_6', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_0800
     * @tc.name      testToolBarItemOptional0008
     * @tc.desc      Verify toolBarItemOptionalCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_7', 'label_7', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_0900
     * @tc.name      testToolBarItemOptional0009
     * @tc.desc      Verify toolBarItemOptionalCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_8', 'label_8', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_1000
     * @tc.name      testToolBarItemOptional0010
     * @tc.desc      Verify toolBarItemOptionalCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_9', 'label_9', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_1100
     * @tc.name      testToolBarItemOptional0011
     * @tc.desc      Verify toolBarItemOptionalCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_10', 'label_10', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_1200
     * @tc.name      testToolBarItemOptional0012
     * @tc.desc      Verify toolBarItemOptionalCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_11', 'label_11', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_1300
     * @tc.name      testToolBarItemOptional0013
     * @tc.desc      Verify toolBarItemOptionalCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_12', 'label_12', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_1400
     * @tc.name      testToolBarItemOptional0014
     * @tc.desc      Verify toolBarItemOptionalCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_13', 'label_13', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_1500
     * @tc.name      testToolBarItemOptional0015
     * @tc.desc      Verify toolBarItemOptionalCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_14', 'label_14', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_1600
     * @tc.name      testToolBarItemOptional0016
     * @tc.desc      Verify toolBarItemOptionalCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_15', 'label_15', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_1700
     * @tc.name      testToolBarItemOptional0017
     * @tc.desc      Verify toolBarItemOptionalCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_16', 'label_16', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_1800
     * @tc.name      testToolBarItemOptional0018
     * @tc.desc      Verify toolBarItemOptionalCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_17', 'label_17', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_1900
     * @tc.name      testToolBarItemOptional0019
     * @tc.desc      Verify toolBarItemOptionalCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_18', 'label_18', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_2000
     * @tc.name      testToolBarItemOptional0020
     * @tc.desc      Verify toolBarItemOptionalCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_19', 'label_19', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_2100
     * @tc.name      testToolBarItemOptional0021
     * @tc.desc      Verify toolBarItemOptionalCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_20', 'label_20', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_2200
     * @tc.name      testToolBarItemOptional0022
     * @tc.desc      Verify toolBarItemOptionalCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_21', 'label_21', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_2300
     * @tc.name      testToolBarItemOptional0023
     * @tc.desc      Verify toolBarItemOptionalCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_22', 'label_22', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_2400
     * @tc.name      testToolBarItemOptional0024
     * @tc.desc      Verify toolBarItemOptionalCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_23', 'label_23', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_2500
     * @tc.name      testToolBarItemOptional0025
     * @tc.desc      Verify toolBarItemOptionalCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_24', 'label_24', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_2600
     * @tc.name      testToolBarItemOptional0026
     * @tc.desc      Verify toolBarItemOptionalCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_25', 'label_25', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_2700
     * @tc.name      testToolBarItemOptional0027
     * @tc.desc      Verify toolBarItemOptionalCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_26', 'label_26', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_2800
     * @tc.name      testToolBarItemOptional0028
     * @tc.desc      Verify toolBarItemOptionalCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_27', 'label_27', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_2900
     * @tc.name      testToolBarItemOptional0029
     * @tc.desc      Verify toolBarItemOptionalCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_28', 'label_28', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_3000
     * @tc.name      testToolBarItemOptional0030
     * @tc.desc      Verify toolBarItemOptionalCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_29', 'label_29', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_3100
     * @tc.name      testToolBarItemOptional0031
     * @tc.desc      Verify toolBarItemOptionalCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_30', 'label_30', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_3200
     * @tc.name      testToolBarItemOptional0032
     * @tc.desc      Verify toolBarItemOptionalCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_31', 'label_31', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_3300
     * @tc.name      testToolBarItemOptional0033
     * @tc.desc      Verify toolBarItemOptionalCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_32', 'label_32', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_3400
     * @tc.name      testToolBarItemOptional0034
     * @tc.desc      Verify toolBarItemOptionalCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_33', 'label_33', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_3500
     * @tc.name      testToolBarItemOptional0035
     * @tc.desc      Verify toolBarItemOptionalCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_34', 'label_34', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_3600
     * @tc.name      testToolBarItemOptional0036
     * @tc.desc      Verify toolBarItemOptionalCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_35', 'label_35', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_3700
     * @tc.name      testToolBarItemOptional0037
     * @tc.desc      Verify toolBarItemOptionalCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_36', 'label_36', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_3800
     * @tc.name      testToolBarItemOptional0038
     * @tc.desc      Verify toolBarItemOptionalCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_37', 'label_37', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_3900
     * @tc.name      testToolBarItemOptional0039
     * @tc.desc      Verify toolBarItemOptionalCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_38', 'label_38', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_4000
     * @tc.name      testToolBarItemOptional0040
     * @tc.desc      Verify toolBarItemOptionalCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_39', 'label_39', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_4100
     * @tc.name      testToolBarItemOptional0041
     * @tc.desc      Verify toolBarItemOptionalCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_40', 'label_40', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_4200
     * @tc.name      testToolBarItemOptional0042
     * @tc.desc      Verify toolBarItemOptionalCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_41', 'label_41', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_4300
     * @tc.name      testToolBarItemOptional0043
     * @tc.desc      Verify toolBarItemOptionalCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_42', 'label_42', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_4400
     * @tc.name      testToolBarItemOptional0044
     * @tc.desc      Verify toolBarItemOptionalCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_43', 'label_43', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_4500
     * @tc.name      testToolBarItemOptional0045
     * @tc.desc      Verify toolBarItemOptionalCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_44', 'label_44', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_4600
     * @tc.name      testToolBarItemOptional0046
     * @tc.desc      Verify toolBarItemOptionalCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_45', 'label_45', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_4700
     * @tc.name      testToolBarItemOptional0047
     * @tc.desc      Verify toolBarItemOptionalCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_46', 'label_46', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_4800
     * @tc.name      testToolBarItemOptional0048
     * @tc.desc      Verify toolBarItemOptionalCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_47', 'label_47', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_4900
     * @tc.name      testToolBarItemOptional0049
     * @tc.desc      Verify toolBarItemOptionalCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_48', 'label_48', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_5000
     * @tc.name      testToolBarItemOptional0050
     * @tc.desc      Verify toolBarItemOptionalCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_49', 'label_49', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_5100
     * @tc.name      testToolBarItemOptional0051
     * @tc.desc      Verify toolBarItemOptionalCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_50', 'label_50', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_5200
     * @tc.name      testToolBarItemOptional0052
     * @tc.desc      Verify toolBarItemOptionalCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_51', 'label_51', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_5300
     * @tc.name      testToolBarItemOptional0053
     * @tc.desc      Verify toolBarItemOptionalCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_52', 'label_52', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_5400
     * @tc.name      testToolBarItemOptional0054
     * @tc.desc      Verify toolBarItemOptionalCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_53', 'label_53', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_5500
     * @tc.name      testToolBarItemOptional0055
     * @tc.desc      Verify toolBarItemOptionalCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_54', 'label_54', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_5600
     * @tc.name      testToolBarItemOptional0056
     * @tc.desc      Verify toolBarItemOptionalCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_55', 'label_55', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_5700
     * @tc.name      testToolBarItemOptional0057
     * @tc.desc      Verify toolBarItemOptionalCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_56', 'label_56', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_5800
     * @tc.name      testToolBarItemOptional0058
     * @tc.desc      Verify toolBarItemOptionalCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_57', 'label_57', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_5900
     * @tc.name      testToolBarItemOptional0059
     * @tc.desc      Verify toolBarItemOptionalCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_58', 'label_58', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_6000
     * @tc.name      testToolBarItemOptional0060
     * @tc.desc      Verify toolBarItemOptionalCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_59', 'label_59', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_6100
     * @tc.name      testToolBarItemOptional0061
     * @tc.desc      Verify toolBarItemOptionalCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_60', 'label_60', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_6200
     * @tc.name      testToolBarItemOptional0062
     * @tc.desc      Verify toolBarItemOptionalCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_61', 'label_61', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_6300
     * @tc.name      testToolBarItemOptional0063
     * @tc.desc      Verify toolBarItemOptionalCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_62', 'label_62', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_6400
     * @tc.name      testToolBarItemOptional0064
     * @tc.desc      Verify toolBarItemOptionalCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_63', 'label_63', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_6500
     * @tc.name      testToolBarItemOptional0065
     * @tc.desc      Verify toolBarItemOptionalCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_64', 'label_64', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_6600
     * @tc.name      testToolBarItemOptional0066
     * @tc.desc      Verify toolBarItemOptionalCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_65', 'label_65', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_6700
     * @tc.name      testToolBarItemOptional0067
     * @tc.desc      Verify toolBarItemOptionalCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_66', 'label_66', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_6800
     * @tc.name      testToolBarItemOptional0068
     * @tc.desc      Verify toolBarItemOptionalCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_67', 'label_67', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_6900
     * @tc.name      testToolBarItemOptional0069
     * @tc.desc      Verify toolBarItemOptionalCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_68', 'label_68', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_7000
     * @tc.name      testToolBarItemOptional0070
     * @tc.desc      Verify toolBarItemOptionalCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_69', 'label_69', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_7100
     * @tc.name      testToolBarItemOptional0071
     * @tc.desc      Verify toolBarItemOptionalCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_70', 'label_70', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_7200
     * @tc.name      testToolBarItemOptional0072
     * @tc.desc      Verify toolBarItemOptionalCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_71', 'label_71', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_7300
     * @tc.name      testToolBarItemOptional0073
     * @tc.desc      Verify toolBarItemOptionalCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_72', 'label_72', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_7400
     * @tc.name      testToolBarItemOptional0074
     * @tc.desc      Verify toolBarItemOptionalCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_73', 'label_73', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_7500
     * @tc.name      testToolBarItemOptional0075
     * @tc.desc      Verify toolBarItemOptionalCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_74', 'label_74', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_7600
     * @tc.name      testToolBarItemOptional0076
     * @tc.desc      Verify toolBarItemOptionalCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_75', 'label_75', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_7700
     * @tc.name      testToolBarItemOptional0077
     * @tc.desc      Verify toolBarItemOptionalCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_76', 'label_76', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_7800
     * @tc.name      testToolBarItemOptional0078
     * @tc.desc      Verify toolBarItemOptionalCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_77', 'label_77', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_7900
     * @tc.name      testToolBarItemOptional0079
     * @tc.desc      Verify toolBarItemOptionalCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_78', 'label_78', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_8000
     * @tc.name      testToolBarItemOptional0080
     * @tc.desc      Verify toolBarItemOptionalCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_79', 'label_79', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_OPT_8100
     * @tc.name      testToolBarItemOptional0081
     * @tc.desc      Verify toolBarItemOptionalCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOptional0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const item: ToolBarItem = createToolBarItem('id_80', 'label_80', false);
      expect(item.iconInactive === undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInActiveColors !== undefined).assertTrue();
    });

  });
}
