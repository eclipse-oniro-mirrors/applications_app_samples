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

export default function ToolBarItemMatrixPart12Test(): void {
  describe('ToolBarItemMatrixPart12', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_60600
     * @tc.name      testToolBarItemMatrix0606
     * @tc.desc      Verify ToolBarItem construction for matrix row 605.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0606 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_605',
        label: 'tool_label_605',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_605');
      expect(item.label).assertEqual('tool_label_605');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0606 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_60700
     * @tc.name      testToolBarItemMatrix0607
     * @tc.desc      Verify ToolBarItem construction for matrix row 606.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0607 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_606',
        label: 'tool_label_606',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_606');
      expect(item.label).assertEqual('tool_label_606');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0607 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_60800
     * @tc.name      testToolBarItemMatrix0608
     * @tc.desc      Verify ToolBarItem construction for matrix row 607.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0608 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_607',
        label: 'tool_label_607',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_607');
      expect(item.label).assertEqual('tool_label_607');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0608 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_60900
     * @tc.name      testToolBarItemMatrix0609
     * @tc.desc      Verify ToolBarItem construction for matrix row 608.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0609 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_608',
        label: 'tool_label_608',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_608');
      expect(item.label).assertEqual('tool_label_608');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0609 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_61000
     * @tc.name      testToolBarItemMatrix0610
     * @tc.desc      Verify ToolBarItem construction for matrix row 609.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0610 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_609',
        label: 'tool_label_609',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_609');
      expect(item.label).assertEqual('tool_label_609');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0610 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_61100
     * @tc.name      testToolBarItemMatrix0611
     * @tc.desc      Verify ToolBarItem construction for matrix row 610.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0611 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_610',
        label: 'tool_label_610',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_610');
      expect(item.label).assertEqual('tool_label_610');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0611 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_61200
     * @tc.name      testToolBarItemMatrix0612
     * @tc.desc      Verify ToolBarItem construction for matrix row 611.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0612 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_611',
        label: 'tool_label_611',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_611');
      expect(item.label).assertEqual('tool_label_611');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0612 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_61300
     * @tc.name      testToolBarItemMatrix0613
     * @tc.desc      Verify ToolBarItem construction for matrix row 612.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0613 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_612',
        label: 'tool_label_612',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_612');
      expect(item.label).assertEqual('tool_label_612');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0613 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_61400
     * @tc.name      testToolBarItemMatrix0614
     * @tc.desc      Verify ToolBarItem construction for matrix row 613.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0614 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_613',
        label: 'tool_label_613',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_613');
      expect(item.label).assertEqual('tool_label_613');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0614 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_61500
     * @tc.name      testToolBarItemMatrix0615
     * @tc.desc      Verify ToolBarItem construction for matrix row 614.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0615 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_614',
        label: 'tool_label_614',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_614');
      expect(item.label).assertEqual('tool_label_614');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0615 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_61600
     * @tc.name      testToolBarItemMatrix0616
     * @tc.desc      Verify ToolBarItem construction for matrix row 615.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0616 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_615',
        label: 'tool_label_615',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_615');
      expect(item.label).assertEqual('tool_label_615');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0616 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_61700
     * @tc.name      testToolBarItemMatrix0617
     * @tc.desc      Verify ToolBarItem construction for matrix row 616.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0617 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_616',
        label: 'tool_label_616',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_616');
      expect(item.label).assertEqual('tool_label_616');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0617 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_61800
     * @tc.name      testToolBarItemMatrix0618
     * @tc.desc      Verify ToolBarItem construction for matrix row 617.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0618 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_617',
        label: 'tool_label_617',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_617');
      expect(item.label).assertEqual('tool_label_617');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0618 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_61900
     * @tc.name      testToolBarItemMatrix0619
     * @tc.desc      Verify ToolBarItem construction for matrix row 618.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0619 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_618',
        label: 'tool_label_618',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_618');
      expect(item.label).assertEqual('tool_label_618');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0619 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_62000
     * @tc.name      testToolBarItemMatrix0620
     * @tc.desc      Verify ToolBarItem construction for matrix row 619.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0620 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_619',
        label: 'tool_label_619',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_619');
      expect(item.label).assertEqual('tool_label_619');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0620 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_62100
     * @tc.name      testToolBarItemMatrix0621
     * @tc.desc      Verify ToolBarItem construction for matrix row 620.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0621 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_620',
        label: 'tool_label_620',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_620');
      expect(item.label).assertEqual('tool_label_620');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0621 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_62200
     * @tc.name      testToolBarItemMatrix0622
     * @tc.desc      Verify ToolBarItem construction for matrix row 621.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0622 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_621',
        label: 'tool_label_621',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_621');
      expect(item.label).assertEqual('tool_label_621');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0622 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_62300
     * @tc.name      testToolBarItemMatrix0623
     * @tc.desc      Verify ToolBarItem construction for matrix row 622.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0623 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_622',
        label: 'tool_label_622',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_622');
      expect(item.label).assertEqual('tool_label_622');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0623 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_62400
     * @tc.name      testToolBarItemMatrix0624
     * @tc.desc      Verify ToolBarItem construction for matrix row 623.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0624 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_623',
        label: 'tool_label_623',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_623');
      expect(item.label).assertEqual('tool_label_623');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0624 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_62500
     * @tc.name      testToolBarItemMatrix0625
     * @tc.desc      Verify ToolBarItem construction for matrix row 624.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0625 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_624',
        label: 'tool_label_624',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_624');
      expect(item.label).assertEqual('tool_label_624');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0625 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_62600
     * @tc.name      testToolBarItemMatrix0626
     * @tc.desc      Verify ToolBarItem construction for matrix row 625.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0626 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_625',
        label: 'tool_label_625',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_625');
      expect(item.label).assertEqual('tool_label_625');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0626 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_62700
     * @tc.name      testToolBarItemMatrix0627
     * @tc.desc      Verify ToolBarItem construction for matrix row 626.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0627 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_626',
        label: 'tool_label_626',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_626');
      expect(item.label).assertEqual('tool_label_626');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0627 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_62800
     * @tc.name      testToolBarItemMatrix0628
     * @tc.desc      Verify ToolBarItem construction for matrix row 627.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0628 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_627',
        label: 'tool_label_627',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_627');
      expect(item.label).assertEqual('tool_label_627');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0628 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_62900
     * @tc.name      testToolBarItemMatrix0629
     * @tc.desc      Verify ToolBarItem construction for matrix row 628.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0629', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0629 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_628',
        label: 'tool_label_628',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_628');
      expect(item.label).assertEqual('tool_label_628');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0629 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_63000
     * @tc.name      testToolBarItemMatrix0630
     * @tc.desc      Verify ToolBarItem construction for matrix row 629.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0630', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0630 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_629',
        label: 'tool_label_629',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_629');
      expect(item.label).assertEqual('tool_label_629');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0630 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_63100
     * @tc.name      testToolBarItemMatrix0631
     * @tc.desc      Verify ToolBarItem construction for matrix row 630.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0631', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0631 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_630',
        label: 'tool_label_630',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_630');
      expect(item.label).assertEqual('tool_label_630');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0631 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_63200
     * @tc.name      testToolBarItemMatrix0632
     * @tc.desc      Verify ToolBarItem construction for matrix row 631.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0632', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0632 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_631',
        label: 'tool_label_631',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_631');
      expect(item.label).assertEqual('tool_label_631');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0632 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_63300
     * @tc.name      testToolBarItemMatrix0633
     * @tc.desc      Verify ToolBarItem construction for matrix row 632.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0633', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0633 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_632',
        label: 'tool_label_632',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_632');
      expect(item.label).assertEqual('tool_label_632');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0633 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_63400
     * @tc.name      testToolBarItemMatrix0634
     * @tc.desc      Verify ToolBarItem construction for matrix row 633.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0634', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0634 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_633',
        label: 'tool_label_633',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_633');
      expect(item.label).assertEqual('tool_label_633');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0634 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_63500
     * @tc.name      testToolBarItemMatrix0635
     * @tc.desc      Verify ToolBarItem construction for matrix row 634.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0635', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0635 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_634',
        label: 'tool_label_634',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_634');
      expect(item.label).assertEqual('tool_label_634');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0635 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_63600
     * @tc.name      testToolBarItemMatrix0636
     * @tc.desc      Verify ToolBarItem construction for matrix row 635.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0636', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0636 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_635',
        label: 'tool_label_635',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_635');
      expect(item.label).assertEqual('tool_label_635');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0636 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_63700
     * @tc.name      testToolBarItemMatrix0637
     * @tc.desc      Verify ToolBarItem construction for matrix row 636.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0637', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0637 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_636',
        label: 'tool_label_636',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_636');
      expect(item.label).assertEqual('tool_label_636');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0637 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_63800
     * @tc.name      testToolBarItemMatrix0638
     * @tc.desc      Verify ToolBarItem construction for matrix row 637.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0638', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0638 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_637',
        label: 'tool_label_637',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_637');
      expect(item.label).assertEqual('tool_label_637');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0638 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_63900
     * @tc.name      testToolBarItemMatrix0639
     * @tc.desc      Verify ToolBarItem construction for matrix row 638.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0639', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0639 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_638',
        label: 'tool_label_638',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_638');
      expect(item.label).assertEqual('tool_label_638');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0639 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_64000
     * @tc.name      testToolBarItemMatrix0640
     * @tc.desc      Verify ToolBarItem construction for matrix row 639.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0640', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0640 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_639',
        label: 'tool_label_639',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_639');
      expect(item.label).assertEqual('tool_label_639');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0640 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_64100
     * @tc.name      testToolBarItemMatrix0641
     * @tc.desc      Verify ToolBarItem construction for matrix row 640.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0641', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0641 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_640',
        label: 'tool_label_640',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_640');
      expect(item.label).assertEqual('tool_label_640');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0641 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_64200
     * @tc.name      testToolBarItemMatrix0642
     * @tc.desc      Verify ToolBarItem construction for matrix row 641.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0642', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0642 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_641',
        label: 'tool_label_641',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_641');
      expect(item.label).assertEqual('tool_label_641');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0642 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_64300
     * @tc.name      testToolBarItemMatrix0643
     * @tc.desc      Verify ToolBarItem construction for matrix row 642.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0643', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0643 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_642',
        label: 'tool_label_642',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_642');
      expect(item.label).assertEqual('tool_label_642');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0643 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_64400
     * @tc.name      testToolBarItemMatrix0644
     * @tc.desc      Verify ToolBarItem construction for matrix row 643.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0644', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0644 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_643',
        label: 'tool_label_643',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_643');
      expect(item.label).assertEqual('tool_label_643');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0644 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_64500
     * @tc.name      testToolBarItemMatrix0645
     * @tc.desc      Verify ToolBarItem construction for matrix row 644.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0645', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0645 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_644',
        label: 'tool_label_644',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_644');
      expect(item.label).assertEqual('tool_label_644');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0645 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_64600
     * @tc.name      testToolBarItemMatrix0646
     * @tc.desc      Verify ToolBarItem construction for matrix row 645.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0646', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0646 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_645',
        label: 'tool_label_645',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_645');
      expect(item.label).assertEqual('tool_label_645');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0646 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_64700
     * @tc.name      testToolBarItemMatrix0647
     * @tc.desc      Verify ToolBarItem construction for matrix row 646.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0647', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0647 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_646',
        label: 'tool_label_646',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_646');
      expect(item.label).assertEqual('tool_label_646');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0647 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_64800
     * @tc.name      testToolBarItemMatrix0648
     * @tc.desc      Verify ToolBarItem construction for matrix row 647.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0648', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0648 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_647',
        label: 'tool_label_647',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_647');
      expect(item.label).assertEqual('tool_label_647');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0648 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_64900
     * @tc.name      testToolBarItemMatrix0649
     * @tc.desc      Verify ToolBarItem construction for matrix row 648.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0649', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0649 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_648',
        label: 'tool_label_648',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_648');
      expect(item.label).assertEqual('tool_label_648');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0649 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_65000
     * @tc.name      testToolBarItemMatrix0650
     * @tc.desc      Verify ToolBarItem construction for matrix row 649.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0650', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0650 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_649',
        label: 'tool_label_649',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_649');
      expect(item.label).assertEqual('tool_label_649');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0650 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_65100
     * @tc.name      testToolBarItemMatrix0651
     * @tc.desc      Verify ToolBarItem construction for matrix row 650.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0651', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0651 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_650',
        label: 'tool_label_650',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_650');
      expect(item.label).assertEqual('tool_label_650');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0651 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_65200
     * @tc.name      testToolBarItemMatrix0652
     * @tc.desc      Verify ToolBarItem construction for matrix row 651.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0652', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0652 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_651',
        label: 'tool_label_651',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_651');
      expect(item.label).assertEqual('tool_label_651');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0652 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_65300
     * @tc.name      testToolBarItemMatrix0653
     * @tc.desc      Verify ToolBarItem construction for matrix row 652.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0653', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0653 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_652',
        label: 'tool_label_652',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_652');
      expect(item.label).assertEqual('tool_label_652');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0653 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_65400
     * @tc.name      testToolBarItemMatrix0654
     * @tc.desc      Verify ToolBarItem construction for matrix row 653.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0654', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0654 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_653',
        label: 'tool_label_653',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_653');
      expect(item.label).assertEqual('tool_label_653');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0654 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_65500
     * @tc.name      testToolBarItemMatrix0655
     * @tc.desc      Verify ToolBarItem construction for matrix row 654.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0655', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0655 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_654',
        label: 'tool_label_654',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_654');
      expect(item.label).assertEqual('tool_label_654');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0655 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_65600
     * @tc.name      testToolBarItemMatrix0656
     * @tc.desc      Verify ToolBarItem construction for matrix row 655.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0656', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0656 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_655',
        label: 'tool_label_655',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_655');
      expect(item.label).assertEqual('tool_label_655');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0656 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_65700
     * @tc.name      testToolBarItemMatrix0657
     * @tc.desc      Verify ToolBarItem construction for matrix row 656.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0657', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0657 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_656',
        label: 'tool_label_656',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_656');
      expect(item.label).assertEqual('tool_label_656');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0657 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_65800
     * @tc.name      testToolBarItemMatrix0658
     * @tc.desc      Verify ToolBarItem construction for matrix row 657.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0658', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0658 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_657',
        label: 'tool_label_657',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_657');
      expect(item.label).assertEqual('tool_label_657');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0658 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_65900
     * @tc.name      testToolBarItemMatrix0659
     * @tc.desc      Verify ToolBarItem construction for matrix row 658.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0659', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0659 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_658',
        label: 'tool_label_658',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_658');
      expect(item.label).assertEqual('tool_label_658');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0659 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP12_66000
     * @tc.name      testToolBarItemMatrix0660
     * @tc.desc      Verify ToolBarItem construction for matrix row 659.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0660', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0660 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_659',
        label: 'tool_label_659',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_659');
      expect(item.label).assertEqual('tool_label_659');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0660 end');
    })

  })
}
