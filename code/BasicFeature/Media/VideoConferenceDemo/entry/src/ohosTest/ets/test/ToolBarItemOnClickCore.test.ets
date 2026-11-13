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

const TAG: string = '[Sample_toolBarItemOnClickCore]';
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

export default function toolBarItemOnClickCoreTest(): void {
  describe('toolBarItemOnClickCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_0100
     * @tc.name      testToolBarItemOnClick0001
     * @tc.desc      Verify toolBarItemOnClickCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_0', label: 'label_0',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_0200
     * @tc.name      testToolBarItemOnClick0002
     * @tc.desc      Verify toolBarItemOnClickCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_1', label: 'label_1',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_0300
     * @tc.name      testToolBarItemOnClick0003
     * @tc.desc      Verify toolBarItemOnClickCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_2', label: 'label_2',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_0400
     * @tc.name      testToolBarItemOnClick0004
     * @tc.desc      Verify toolBarItemOnClickCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_3', label: 'label_3',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_0500
     * @tc.name      testToolBarItemOnClick0005
     * @tc.desc      Verify toolBarItemOnClickCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_4', label: 'label_4',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_0600
     * @tc.name      testToolBarItemOnClick0006
     * @tc.desc      Verify toolBarItemOnClickCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_5', label: 'label_5',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_0700
     * @tc.name      testToolBarItemOnClick0007
     * @tc.desc      Verify toolBarItemOnClickCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_6', label: 'label_6',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_0800
     * @tc.name      testToolBarItemOnClick0008
     * @tc.desc      Verify toolBarItemOnClickCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_7', label: 'label_7',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_0900
     * @tc.name      testToolBarItemOnClick0009
     * @tc.desc      Verify toolBarItemOnClickCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_8', label: 'label_8',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_1000
     * @tc.name      testToolBarItemOnClick0010
     * @tc.desc      Verify toolBarItemOnClickCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_9', label: 'label_9',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_1100
     * @tc.name      testToolBarItemOnClick0011
     * @tc.desc      Verify toolBarItemOnClickCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_10', label: 'label_10',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_1200
     * @tc.name      testToolBarItemOnClick0012
     * @tc.desc      Verify toolBarItemOnClickCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_11', label: 'label_11',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_1300
     * @tc.name      testToolBarItemOnClick0013
     * @tc.desc      Verify toolBarItemOnClickCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_12', label: 'label_12',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_1400
     * @tc.name      testToolBarItemOnClick0014
     * @tc.desc      Verify toolBarItemOnClickCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_13', label: 'label_13',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_1500
     * @tc.name      testToolBarItemOnClick0015
     * @tc.desc      Verify toolBarItemOnClickCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_14', label: 'label_14',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_1600
     * @tc.name      testToolBarItemOnClick0016
     * @tc.desc      Verify toolBarItemOnClickCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_15', label: 'label_15',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_1700
     * @tc.name      testToolBarItemOnClick0017
     * @tc.desc      Verify toolBarItemOnClickCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_16', label: 'label_16',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_1800
     * @tc.name      testToolBarItemOnClick0018
     * @tc.desc      Verify toolBarItemOnClickCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_17', label: 'label_17',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_1900
     * @tc.name      testToolBarItemOnClick0019
     * @tc.desc      Verify toolBarItemOnClickCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_18', label: 'label_18',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_2000
     * @tc.name      testToolBarItemOnClick0020
     * @tc.desc      Verify toolBarItemOnClickCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_19', label: 'label_19',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_2100
     * @tc.name      testToolBarItemOnClick0021
     * @tc.desc      Verify toolBarItemOnClickCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_20', label: 'label_20',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_2200
     * @tc.name      testToolBarItemOnClick0022
     * @tc.desc      Verify toolBarItemOnClickCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_21', label: 'label_21',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_2300
     * @tc.name      testToolBarItemOnClick0023
     * @tc.desc      Verify toolBarItemOnClickCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_22', label: 'label_22',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_2400
     * @tc.name      testToolBarItemOnClick0024
     * @tc.desc      Verify toolBarItemOnClickCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_23', label: 'label_23',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_2500
     * @tc.name      testToolBarItemOnClick0025
     * @tc.desc      Verify toolBarItemOnClickCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_24', label: 'label_24',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_2600
     * @tc.name      testToolBarItemOnClick0026
     * @tc.desc      Verify toolBarItemOnClickCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_25', label: 'label_25',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_2700
     * @tc.name      testToolBarItemOnClick0027
     * @tc.desc      Verify toolBarItemOnClickCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_26', label: 'label_26',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_2800
     * @tc.name      testToolBarItemOnClick0028
     * @tc.desc      Verify toolBarItemOnClickCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_27', label: 'label_27',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_2900
     * @tc.name      testToolBarItemOnClick0029
     * @tc.desc      Verify toolBarItemOnClickCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_28', label: 'label_28',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_3000
     * @tc.name      testToolBarItemOnClick0030
     * @tc.desc      Verify toolBarItemOnClickCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_29', label: 'label_29',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_3100
     * @tc.name      testToolBarItemOnClick0031
     * @tc.desc      Verify toolBarItemOnClickCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_30', label: 'label_30',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_3200
     * @tc.name      testToolBarItemOnClick0032
     * @tc.desc      Verify toolBarItemOnClickCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_31', label: 'label_31',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_3300
     * @tc.name      testToolBarItemOnClick0033
     * @tc.desc      Verify toolBarItemOnClickCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_32', label: 'label_32',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_3400
     * @tc.name      testToolBarItemOnClick0034
     * @tc.desc      Verify toolBarItemOnClickCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_33', label: 'label_33',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_3500
     * @tc.name      testToolBarItemOnClick0035
     * @tc.desc      Verify toolBarItemOnClickCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_34', label: 'label_34',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_3600
     * @tc.name      testToolBarItemOnClick0036
     * @tc.desc      Verify toolBarItemOnClickCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_35', label: 'label_35',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_3700
     * @tc.name      testToolBarItemOnClick0037
     * @tc.desc      Verify toolBarItemOnClickCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_36', label: 'label_36',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_3800
     * @tc.name      testToolBarItemOnClick0038
     * @tc.desc      Verify toolBarItemOnClickCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_37', label: 'label_37',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_3900
     * @tc.name      testToolBarItemOnClick0039
     * @tc.desc      Verify toolBarItemOnClickCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_38', label: 'label_38',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_4000
     * @tc.name      testToolBarItemOnClick0040
     * @tc.desc      Verify toolBarItemOnClickCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_39', label: 'label_39',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_4100
     * @tc.name      testToolBarItemOnClick0041
     * @tc.desc      Verify toolBarItemOnClickCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_40', label: 'label_40',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_4200
     * @tc.name      testToolBarItemOnClick0042
     * @tc.desc      Verify toolBarItemOnClickCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_41', label: 'label_41',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_4300
     * @tc.name      testToolBarItemOnClick0043
     * @tc.desc      Verify toolBarItemOnClickCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_42', label: 'label_42',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_4400
     * @tc.name      testToolBarItemOnClick0044
     * @tc.desc      Verify toolBarItemOnClickCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_43', label: 'label_43',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_4500
     * @tc.name      testToolBarItemOnClick0045
     * @tc.desc      Verify toolBarItemOnClickCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_44', label: 'label_44',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_4600
     * @tc.name      testToolBarItemOnClick0046
     * @tc.desc      Verify toolBarItemOnClickCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_45', label: 'label_45',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_4700
     * @tc.name      testToolBarItemOnClick0047
     * @tc.desc      Verify toolBarItemOnClickCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_46', label: 'label_46',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_4800
     * @tc.name      testToolBarItemOnClick0048
     * @tc.desc      Verify toolBarItemOnClickCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_47', label: 'label_47',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_4900
     * @tc.name      testToolBarItemOnClick0049
     * @tc.desc      Verify toolBarItemOnClickCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_48', label: 'label_48',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_5000
     * @tc.name      testToolBarItemOnClick0050
     * @tc.desc      Verify toolBarItemOnClickCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_49', label: 'label_49',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_5100
     * @tc.name      testToolBarItemOnClick0051
     * @tc.desc      Verify toolBarItemOnClickCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_50', label: 'label_50',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_5200
     * @tc.name      testToolBarItemOnClick0052
     * @tc.desc      Verify toolBarItemOnClickCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_51', label: 'label_51',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_5300
     * @tc.name      testToolBarItemOnClick0053
     * @tc.desc      Verify toolBarItemOnClickCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_52', label: 'label_52',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_5400
     * @tc.name      testToolBarItemOnClick0054
     * @tc.desc      Verify toolBarItemOnClickCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_53', label: 'label_53',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_5500
     * @tc.name      testToolBarItemOnClick0055
     * @tc.desc      Verify toolBarItemOnClickCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_54', label: 'label_54',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_5600
     * @tc.name      testToolBarItemOnClick0056
     * @tc.desc      Verify toolBarItemOnClickCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_55', label: 'label_55',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_5700
     * @tc.name      testToolBarItemOnClick0057
     * @tc.desc      Verify toolBarItemOnClickCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_56', label: 'label_56',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_5800
     * @tc.name      testToolBarItemOnClick0058
     * @tc.desc      Verify toolBarItemOnClickCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_57', label: 'label_57',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_5900
     * @tc.name      testToolBarItemOnClick0059
     * @tc.desc      Verify toolBarItemOnClickCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_58', label: 'label_58',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_6000
     * @tc.name      testToolBarItemOnClick0060
     * @tc.desc      Verify toolBarItemOnClickCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_59', label: 'label_59',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_6100
     * @tc.name      testToolBarItemOnClick0061
     * @tc.desc      Verify toolBarItemOnClickCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_60', label: 'label_60',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_6200
     * @tc.name      testToolBarItemOnClick0062
     * @tc.desc      Verify toolBarItemOnClickCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_61', label: 'label_61',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_6300
     * @tc.name      testToolBarItemOnClick0063
     * @tc.desc      Verify toolBarItemOnClickCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_62', label: 'label_62',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_6400
     * @tc.name      testToolBarItemOnClick0064
     * @tc.desc      Verify toolBarItemOnClickCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_63', label: 'label_63',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_6500
     * @tc.name      testToolBarItemOnClick0065
     * @tc.desc      Verify toolBarItemOnClickCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_64', label: 'label_64',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_6600
     * @tc.name      testToolBarItemOnClick0066
     * @tc.desc      Verify toolBarItemOnClickCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_65', label: 'label_65',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_6700
     * @tc.name      testToolBarItemOnClick0067
     * @tc.desc      Verify toolBarItemOnClickCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_66', label: 'label_66',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_6800
     * @tc.name      testToolBarItemOnClick0068
     * @tc.desc      Verify toolBarItemOnClickCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_67', label: 'label_67',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_6900
     * @tc.name      testToolBarItemOnClick0069
     * @tc.desc      Verify toolBarItemOnClickCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_68', label: 'label_68',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_7000
     * @tc.name      testToolBarItemOnClick0070
     * @tc.desc      Verify toolBarItemOnClickCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_69', label: 'label_69',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_7100
     * @tc.name      testToolBarItemOnClick0071
     * @tc.desc      Verify toolBarItemOnClickCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_70', label: 'label_70',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_7200
     * @tc.name      testToolBarItemOnClick0072
     * @tc.desc      Verify toolBarItemOnClickCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_71', label: 'label_71',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_7300
     * @tc.name      testToolBarItemOnClick0073
     * @tc.desc      Verify toolBarItemOnClickCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_72', label: 'label_72',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_7400
     * @tc.name      testToolBarItemOnClick0074
     * @tc.desc      Verify toolBarItemOnClickCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_73', label: 'label_73',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_7500
     * @tc.name      testToolBarItemOnClick0075
     * @tc.desc      Verify toolBarItemOnClickCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_74', label: 'label_74',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_7600
     * @tc.name      testToolBarItemOnClick0076
     * @tc.desc      Verify toolBarItemOnClickCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_75', label: 'label_75',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_7700
     * @tc.name      testToolBarItemOnClick0077
     * @tc.desc      Verify toolBarItemOnClickCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_76', label: 'label_76',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_7800
     * @tc.name      testToolBarItemOnClick0078
     * @tc.desc      Verify toolBarItemOnClickCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_77', label: 'label_77',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_7900
     * @tc.name      testToolBarItemOnClick0079
     * @tc.desc      Verify toolBarItemOnClickCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_78', label: 'label_78',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_8000
     * @tc.name      testToolBarItemOnClick0080
     * @tc.desc      Verify toolBarItemOnClickCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_79', label: 'label_79',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_ITEM_CLICK_8100
     * @tc.name      testToolBarItemOnClick0081
     * @tc.desc      Verify toolBarItemOnClickCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testToolBarItemOnClick0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let clicked: boolean = false;
      let captured: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'id_80', label: 'label_80',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: false,
        onClick: (isActive: boolean) => {
          clicked = true;
          captured = isActive;
        }
      });
      item.onClick(true);
      expect(clicked).assertTrue();
      expect(captured).assertTrue();
    });

  });
}
