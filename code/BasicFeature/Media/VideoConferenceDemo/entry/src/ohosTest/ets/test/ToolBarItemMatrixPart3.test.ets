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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ToolBarItem } from '../../../main/ets/components/CustomToolBarItem';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VideoConferenceDemo]';

export default function ToolBarItemMatrixPart3Test(): void {
  describe('ToolBarItemMatrixPart3', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_11100
     * @tc.name      testToolBarItemMatrix0111
     * @tc.desc      Verify ToolBarItem construction for matrix row 110.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0111 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_110',
        label: 'tool_label_110',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_110');
      expect(item.label).assertEqual('tool_label_110');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0111 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_11200
     * @tc.name      testToolBarItemMatrix0112
     * @tc.desc      Verify ToolBarItem construction for matrix row 111.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0112 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_111',
        label: 'tool_label_111',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_111');
      expect(item.label).assertEqual('tool_label_111');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0112 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_11300
     * @tc.name      testToolBarItemMatrix0113
     * @tc.desc      Verify ToolBarItem construction for matrix row 112.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0113 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_112',
        label: 'tool_label_112',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_112');
      expect(item.label).assertEqual('tool_label_112');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0113 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_11400
     * @tc.name      testToolBarItemMatrix0114
     * @tc.desc      Verify ToolBarItem construction for matrix row 113.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0114 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_113',
        label: 'tool_label_113',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_113');
      expect(item.label).assertEqual('tool_label_113');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0114 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_11500
     * @tc.name      testToolBarItemMatrix0115
     * @tc.desc      Verify ToolBarItem construction for matrix row 114.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0115 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_114',
        label: 'tool_label_114',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_114');
      expect(item.label).assertEqual('tool_label_114');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0115 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_11600
     * @tc.name      testToolBarItemMatrix0116
     * @tc.desc      Verify ToolBarItem construction for matrix row 115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0116 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_115',
        label: 'tool_label_115',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_115');
      expect(item.label).assertEqual('tool_label_115');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0116 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_11700
     * @tc.name      testToolBarItemMatrix0117
     * @tc.desc      Verify ToolBarItem construction for matrix row 116.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0117 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_116',
        label: 'tool_label_116',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_116');
      expect(item.label).assertEqual('tool_label_116');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0117 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_11800
     * @tc.name      testToolBarItemMatrix0118
     * @tc.desc      Verify ToolBarItem construction for matrix row 117.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0118 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_117',
        label: 'tool_label_117',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_117');
      expect(item.label).assertEqual('tool_label_117');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0118 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_11900
     * @tc.name      testToolBarItemMatrix0119
     * @tc.desc      Verify ToolBarItem construction for matrix row 118.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0119 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_118',
        label: 'tool_label_118',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_118');
      expect(item.label).assertEqual('tool_label_118');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0119 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_12000
     * @tc.name      testToolBarItemMatrix0120
     * @tc.desc      Verify ToolBarItem construction for matrix row 119.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0120 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_119',
        label: 'tool_label_119',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_119');
      expect(item.label).assertEqual('tool_label_119');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0120 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_12100
     * @tc.name      testToolBarItemMatrix0121
     * @tc.desc      Verify ToolBarItem construction for matrix row 120.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0121 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_120',
        label: 'tool_label_120',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_120');
      expect(item.label).assertEqual('tool_label_120');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0121 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_12200
     * @tc.name      testToolBarItemMatrix0122
     * @tc.desc      Verify ToolBarItem construction for matrix row 121.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0122 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_121',
        label: 'tool_label_121',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_121');
      expect(item.label).assertEqual('tool_label_121');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0122 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_12300
     * @tc.name      testToolBarItemMatrix0123
     * @tc.desc      Verify ToolBarItem construction for matrix row 122.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0123 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_122',
        label: 'tool_label_122',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_122');
      expect(item.label).assertEqual('tool_label_122');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0123 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_12400
     * @tc.name      testToolBarItemMatrix0124
     * @tc.desc      Verify ToolBarItem construction for matrix row 123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0124 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_123',
        label: 'tool_label_123',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_123');
      expect(item.label).assertEqual('tool_label_123');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0124 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_12500
     * @tc.name      testToolBarItemMatrix0125
     * @tc.desc      Verify ToolBarItem construction for matrix row 124.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0125 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_124',
        label: 'tool_label_124',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_124');
      expect(item.label).assertEqual('tool_label_124');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0125 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_12600
     * @tc.name      testToolBarItemMatrix0126
     * @tc.desc      Verify ToolBarItem construction for matrix row 125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0126 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_125',
        label: 'tool_label_125',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_125');
      expect(item.label).assertEqual('tool_label_125');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0126 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_12700
     * @tc.name      testToolBarItemMatrix0127
     * @tc.desc      Verify ToolBarItem construction for matrix row 126.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0127 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_126',
        label: 'tool_label_126',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_126');
      expect(item.label).assertEqual('tool_label_126');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0127 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_12800
     * @tc.name      testToolBarItemMatrix0128
     * @tc.desc      Verify ToolBarItem construction for matrix row 127.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0128 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_127',
        label: 'tool_label_127',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_127');
      expect(item.label).assertEqual('tool_label_127');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0128 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_12900
     * @tc.name      testToolBarItemMatrix0129
     * @tc.desc      Verify ToolBarItem construction for matrix row 128.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0129 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_128',
        label: 'tool_label_128',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_128');
      expect(item.label).assertEqual('tool_label_128');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0129 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_13000
     * @tc.name      testToolBarItemMatrix0130
     * @tc.desc      Verify ToolBarItem construction for matrix row 129.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0130 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_129',
        label: 'tool_label_129',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_129');
      expect(item.label).assertEqual('tool_label_129');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0130 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_13100
     * @tc.name      testToolBarItemMatrix0131
     * @tc.desc      Verify ToolBarItem construction for matrix row 130.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0131 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_130',
        label: 'tool_label_130',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_130');
      expect(item.label).assertEqual('tool_label_130');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0131 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_13200
     * @tc.name      testToolBarItemMatrix0132
     * @tc.desc      Verify ToolBarItem construction for matrix row 131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0132 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_131',
        label: 'tool_label_131',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_131');
      expect(item.label).assertEqual('tool_label_131');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0132 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_13300
     * @tc.name      testToolBarItemMatrix0133
     * @tc.desc      Verify ToolBarItem construction for matrix row 132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0133 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_132',
        label: 'tool_label_132',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_132');
      expect(item.label).assertEqual('tool_label_132');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0133 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_13400
     * @tc.name      testToolBarItemMatrix0134
     * @tc.desc      Verify ToolBarItem construction for matrix row 133.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0134 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_133',
        label: 'tool_label_133',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_133');
      expect(item.label).assertEqual('tool_label_133');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0134 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_13500
     * @tc.name      testToolBarItemMatrix0135
     * @tc.desc      Verify ToolBarItem construction for matrix row 134.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0135 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_134',
        label: 'tool_label_134',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_134');
      expect(item.label).assertEqual('tool_label_134');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0135 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_13600
     * @tc.name      testToolBarItemMatrix0136
     * @tc.desc      Verify ToolBarItem construction for matrix row 135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0136 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_135',
        label: 'tool_label_135',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_135');
      expect(item.label).assertEqual('tool_label_135');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0136 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_13700
     * @tc.name      testToolBarItemMatrix0137
     * @tc.desc      Verify ToolBarItem construction for matrix row 136.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0137 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_136',
        label: 'tool_label_136',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_136');
      expect(item.label).assertEqual('tool_label_136');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0137 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_13800
     * @tc.name      testToolBarItemMatrix0138
     * @tc.desc      Verify ToolBarItem construction for matrix row 137.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0138 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_137',
        label: 'tool_label_137',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_137');
      expect(item.label).assertEqual('tool_label_137');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0138 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_13900
     * @tc.name      testToolBarItemMatrix0139
     * @tc.desc      Verify ToolBarItem construction for matrix row 138.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0139 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_138',
        label: 'tool_label_138',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_138');
      expect(item.label).assertEqual('tool_label_138');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0139 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_14000
     * @tc.name      testToolBarItemMatrix0140
     * @tc.desc      Verify ToolBarItem construction for matrix row 139.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0140 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_139',
        label: 'tool_label_139',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_139');
      expect(item.label).assertEqual('tool_label_139');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0140 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_14100
     * @tc.name      testToolBarItemMatrix0141
     * @tc.desc      Verify ToolBarItem construction for matrix row 140.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0141 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_140',
        label: 'tool_label_140',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_140');
      expect(item.label).assertEqual('tool_label_140');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0141 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_14200
     * @tc.name      testToolBarItemMatrix0142
     * @tc.desc      Verify ToolBarItem construction for matrix row 141.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0142 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_141',
        label: 'tool_label_141',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_141');
      expect(item.label).assertEqual('tool_label_141');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0142 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_14300
     * @tc.name      testToolBarItemMatrix0143
     * @tc.desc      Verify ToolBarItem construction for matrix row 142.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0143 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_142',
        label: 'tool_label_142',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_142');
      expect(item.label).assertEqual('tool_label_142');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0143 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_14400
     * @tc.name      testToolBarItemMatrix0144
     * @tc.desc      Verify ToolBarItem construction for matrix row 143.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0144 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_143',
        label: 'tool_label_143',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_143');
      expect(item.label).assertEqual('tool_label_143');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0144 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_14500
     * @tc.name      testToolBarItemMatrix0145
     * @tc.desc      Verify ToolBarItem construction for matrix row 144.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0145 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_144',
        label: 'tool_label_144',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_144');
      expect(item.label).assertEqual('tool_label_144');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0145 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_14600
     * @tc.name      testToolBarItemMatrix0146
     * @tc.desc      Verify ToolBarItem construction for matrix row 145.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0146 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_145',
        label: 'tool_label_145',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_145');
      expect(item.label).assertEqual('tool_label_145');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0146 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_14700
     * @tc.name      testToolBarItemMatrix0147
     * @tc.desc      Verify ToolBarItem construction for matrix row 146.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0147 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_146',
        label: 'tool_label_146',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_146');
      expect(item.label).assertEqual('tool_label_146');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0147 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_14800
     * @tc.name      testToolBarItemMatrix0148
     * @tc.desc      Verify ToolBarItem construction for matrix row 147.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0148 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_147',
        label: 'tool_label_147',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_147');
      expect(item.label).assertEqual('tool_label_147');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0148 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_14900
     * @tc.name      testToolBarItemMatrix0149
     * @tc.desc      Verify ToolBarItem construction for matrix row 148.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0149 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_148',
        label: 'tool_label_148',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_148');
      expect(item.label).assertEqual('tool_label_148');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0149 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_15000
     * @tc.name      testToolBarItemMatrix0150
     * @tc.desc      Verify ToolBarItem construction for matrix row 149.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0150 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_149',
        label: 'tool_label_149',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_149');
      expect(item.label).assertEqual('tool_label_149');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0150 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_15100
     * @tc.name      testToolBarItemMatrix0151
     * @tc.desc      Verify ToolBarItem construction for matrix row 150.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0151 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_150',
        label: 'tool_label_150',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_150');
      expect(item.label).assertEqual('tool_label_150');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0151 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_15200
     * @tc.name      testToolBarItemMatrix0152
     * @tc.desc      Verify ToolBarItem construction for matrix row 151.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0152 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_151',
        label: 'tool_label_151',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_151');
      expect(item.label).assertEqual('tool_label_151');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0152 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_15300
     * @tc.name      testToolBarItemMatrix0153
     * @tc.desc      Verify ToolBarItem construction for matrix row 152.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0153 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_152',
        label: 'tool_label_152',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_152');
      expect(item.label).assertEqual('tool_label_152');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0153 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_15400
     * @tc.name      testToolBarItemMatrix0154
     * @tc.desc      Verify ToolBarItem construction for matrix row 153.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0154 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_153',
        label: 'tool_label_153',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_153');
      expect(item.label).assertEqual('tool_label_153');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0154 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_15500
     * @tc.name      testToolBarItemMatrix0155
     * @tc.desc      Verify ToolBarItem construction for matrix row 154.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0155 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_154',
        label: 'tool_label_154',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_154');
      expect(item.label).assertEqual('tool_label_154');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0155 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_15600
     * @tc.name      testToolBarItemMatrix0156
     * @tc.desc      Verify ToolBarItem construction for matrix row 155.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0156 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_155',
        label: 'tool_label_155',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_155');
      expect(item.label).assertEqual('tool_label_155');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0156 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_15700
     * @tc.name      testToolBarItemMatrix0157
     * @tc.desc      Verify ToolBarItem construction for matrix row 156.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0157 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_156',
        label: 'tool_label_156',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_156');
      expect(item.label).assertEqual('tool_label_156');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0157 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_15800
     * @tc.name      testToolBarItemMatrix0158
     * @tc.desc      Verify ToolBarItem construction for matrix row 157.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0158 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_157',
        label: 'tool_label_157',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_157');
      expect(item.label).assertEqual('tool_label_157');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0158 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_15900
     * @tc.name      testToolBarItemMatrix0159
     * @tc.desc      Verify ToolBarItem construction for matrix row 158.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0159 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_158',
        label: 'tool_label_158',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_158');
      expect(item.label).assertEqual('tool_label_158');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0159 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_16000
     * @tc.name      testToolBarItemMatrix0160
     * @tc.desc      Verify ToolBarItem construction for matrix row 159.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0160 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_159',
        label: 'tool_label_159',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_159');
      expect(item.label).assertEqual('tool_label_159');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0160 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_16100
     * @tc.name      testToolBarItemMatrix0161
     * @tc.desc      Verify ToolBarItem construction for matrix row 160.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0161 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_160',
        label: 'tool_label_160',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_160');
      expect(item.label).assertEqual('tool_label_160');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0161 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_16200
     * @tc.name      testToolBarItemMatrix0162
     * @tc.desc      Verify ToolBarItem construction for matrix row 161.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0162 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_161',
        label: 'tool_label_161',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_161');
      expect(item.label).assertEqual('tool_label_161');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0162 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_16300
     * @tc.name      testToolBarItemMatrix0163
     * @tc.desc      Verify ToolBarItem construction for matrix row 162.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0163 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_162',
        label: 'tool_label_162',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_162');
      expect(item.label).assertEqual('tool_label_162');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0163 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_16400
     * @tc.name      testToolBarItemMatrix0164
     * @tc.desc      Verify ToolBarItem construction for matrix row 163.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0164 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_163',
        label: 'tool_label_163',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_163');
      expect(item.label).assertEqual('tool_label_163');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0164 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP3_16500
     * @tc.name      testToolBarItemMatrix0165
     * @tc.desc      Verify ToolBarItem construction for matrix row 164.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0165 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_164',
        label: 'tool_label_164',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_164');
      expect(item.label).assertEqual('tool_label_164');
      expect(item.isActive).assertEqual(false);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(true);
      let threw: boolean = false;
      try {
        item.onClick(true);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0165 end');
    })

  })
}
