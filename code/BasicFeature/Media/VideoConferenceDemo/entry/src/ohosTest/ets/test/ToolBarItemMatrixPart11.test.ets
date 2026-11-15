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

export default function ToolBarItemMatrixPart11Test(): void {
  describe('ToolBarItemMatrixPart11', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_55100
     * @tc.name      testToolBarItemMatrix0551
     * @tc.desc      Verify ToolBarItem construction for matrix row 550.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0551 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_550',
        label: 'tool_label_550',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_550');
      expect(item.label).assertEqual('tool_label_550');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0551 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_55200
     * @tc.name      testToolBarItemMatrix0552
     * @tc.desc      Verify ToolBarItem construction for matrix row 551.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0552 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_551',
        label: 'tool_label_551',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_551');
      expect(item.label).assertEqual('tool_label_551');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0552 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_55300
     * @tc.name      testToolBarItemMatrix0553
     * @tc.desc      Verify ToolBarItem construction for matrix row 552.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0553 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_552',
        label: 'tool_label_552',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_552');
      expect(item.label).assertEqual('tool_label_552');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0553 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_55400
     * @tc.name      testToolBarItemMatrix0554
     * @tc.desc      Verify ToolBarItem construction for matrix row 553.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0554 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_553',
        label: 'tool_label_553',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_553');
      expect(item.label).assertEqual('tool_label_553');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0554 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_55500
     * @tc.name      testToolBarItemMatrix0555
     * @tc.desc      Verify ToolBarItem construction for matrix row 554.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0555 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_554',
        label: 'tool_label_554',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_554');
      expect(item.label).assertEqual('tool_label_554');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0555 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_55600
     * @tc.name      testToolBarItemMatrix0556
     * @tc.desc      Verify ToolBarItem construction for matrix row 555.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0556 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_555',
        label: 'tool_label_555',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_555');
      expect(item.label).assertEqual('tool_label_555');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0556 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_55700
     * @tc.name      testToolBarItemMatrix0557
     * @tc.desc      Verify ToolBarItem construction for matrix row 556.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0557 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_556',
        label: 'tool_label_556',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_556');
      expect(item.label).assertEqual('tool_label_556');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0557 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_55800
     * @tc.name      testToolBarItemMatrix0558
     * @tc.desc      Verify ToolBarItem construction for matrix row 557.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0558 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_557',
        label: 'tool_label_557',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_557');
      expect(item.label).assertEqual('tool_label_557');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0558 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_55900
     * @tc.name      testToolBarItemMatrix0559
     * @tc.desc      Verify ToolBarItem construction for matrix row 558.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0559 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_558',
        label: 'tool_label_558',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_558');
      expect(item.label).assertEqual('tool_label_558');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0559 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_56000
     * @tc.name      testToolBarItemMatrix0560
     * @tc.desc      Verify ToolBarItem construction for matrix row 559.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0560 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_559',
        label: 'tool_label_559',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_559');
      expect(item.label).assertEqual('tool_label_559');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0560 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_56100
     * @tc.name      testToolBarItemMatrix0561
     * @tc.desc      Verify ToolBarItem construction for matrix row 560.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0561 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_560',
        label: 'tool_label_560',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_560');
      expect(item.label).assertEqual('tool_label_560');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0561 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_56200
     * @tc.name      testToolBarItemMatrix0562
     * @tc.desc      Verify ToolBarItem construction for matrix row 561.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0562 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_561',
        label: 'tool_label_561',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_561');
      expect(item.label).assertEqual('tool_label_561');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0562 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_56300
     * @tc.name      testToolBarItemMatrix0563
     * @tc.desc      Verify ToolBarItem construction for matrix row 562.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0563 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_562',
        label: 'tool_label_562',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_562');
      expect(item.label).assertEqual('tool_label_562');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0563 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_56400
     * @tc.name      testToolBarItemMatrix0564
     * @tc.desc      Verify ToolBarItem construction for matrix row 563.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0564 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_563',
        label: 'tool_label_563',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_563');
      expect(item.label).assertEqual('tool_label_563');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0564 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_56500
     * @tc.name      testToolBarItemMatrix0565
     * @tc.desc      Verify ToolBarItem construction for matrix row 564.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0565 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_564',
        label: 'tool_label_564',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_564');
      expect(item.label).assertEqual('tool_label_564');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0565 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_56600
     * @tc.name      testToolBarItemMatrix0566
     * @tc.desc      Verify ToolBarItem construction for matrix row 565.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0566 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_565',
        label: 'tool_label_565',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_565');
      expect(item.label).assertEqual('tool_label_565');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0566 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_56700
     * @tc.name      testToolBarItemMatrix0567
     * @tc.desc      Verify ToolBarItem construction for matrix row 566.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0567 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_566',
        label: 'tool_label_566',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_566');
      expect(item.label).assertEqual('tool_label_566');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0567 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_56800
     * @tc.name      testToolBarItemMatrix0568
     * @tc.desc      Verify ToolBarItem construction for matrix row 567.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0568 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_567',
        label: 'tool_label_567',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_567');
      expect(item.label).assertEqual('tool_label_567');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0568 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_56900
     * @tc.name      testToolBarItemMatrix0569
     * @tc.desc      Verify ToolBarItem construction for matrix row 568.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0569 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_568',
        label: 'tool_label_568',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_568');
      expect(item.label).assertEqual('tool_label_568');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0569 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_57000
     * @tc.name      testToolBarItemMatrix0570
     * @tc.desc      Verify ToolBarItem construction for matrix row 569.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0570 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_569',
        label: 'tool_label_569',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_569');
      expect(item.label).assertEqual('tool_label_569');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0570 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_57100
     * @tc.name      testToolBarItemMatrix0571
     * @tc.desc      Verify ToolBarItem construction for matrix row 570.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0571 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_570',
        label: 'tool_label_570',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_570');
      expect(item.label).assertEqual('tool_label_570');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0571 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_57200
     * @tc.name      testToolBarItemMatrix0572
     * @tc.desc      Verify ToolBarItem construction for matrix row 571.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0572 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_571',
        label: 'tool_label_571',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_571');
      expect(item.label).assertEqual('tool_label_571');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0572 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_57300
     * @tc.name      testToolBarItemMatrix0573
     * @tc.desc      Verify ToolBarItem construction for matrix row 572.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0573 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_572',
        label: 'tool_label_572',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_572');
      expect(item.label).assertEqual('tool_label_572');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0573 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_57400
     * @tc.name      testToolBarItemMatrix0574
     * @tc.desc      Verify ToolBarItem construction for matrix row 573.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0574 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_573',
        label: 'tool_label_573',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_573');
      expect(item.label).assertEqual('tool_label_573');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0574 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_57500
     * @tc.name      testToolBarItemMatrix0575
     * @tc.desc      Verify ToolBarItem construction for matrix row 574.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0575 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_574',
        label: 'tool_label_574',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_574');
      expect(item.label).assertEqual('tool_label_574');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0575 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_57600
     * @tc.name      testToolBarItemMatrix0576
     * @tc.desc      Verify ToolBarItem construction for matrix row 575.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0576 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_575',
        label: 'tool_label_575',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_575');
      expect(item.label).assertEqual('tool_label_575');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0576 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_57700
     * @tc.name      testToolBarItemMatrix0577
     * @tc.desc      Verify ToolBarItem construction for matrix row 576.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0577 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_576',
        label: 'tool_label_576',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_576');
      expect(item.label).assertEqual('tool_label_576');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0577 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_57800
     * @tc.name      testToolBarItemMatrix0578
     * @tc.desc      Verify ToolBarItem construction for matrix row 577.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0578 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_577',
        label: 'tool_label_577',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_577');
      expect(item.label).assertEqual('tool_label_577');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0578 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_57900
     * @tc.name      testToolBarItemMatrix0579
     * @tc.desc      Verify ToolBarItem construction for matrix row 578.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0579 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_578',
        label: 'tool_label_578',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_578');
      expect(item.label).assertEqual('tool_label_578');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0579 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_58000
     * @tc.name      testToolBarItemMatrix0580
     * @tc.desc      Verify ToolBarItem construction for matrix row 579.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0580 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_579',
        label: 'tool_label_579',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_579');
      expect(item.label).assertEqual('tool_label_579');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0580 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_58100
     * @tc.name      testToolBarItemMatrix0581
     * @tc.desc      Verify ToolBarItem construction for matrix row 580.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0581 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_580',
        label: 'tool_label_580',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_580');
      expect(item.label).assertEqual('tool_label_580');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0581 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_58200
     * @tc.name      testToolBarItemMatrix0582
     * @tc.desc      Verify ToolBarItem construction for matrix row 581.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0582 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_581',
        label: 'tool_label_581',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_581');
      expect(item.label).assertEqual('tool_label_581');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0582 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_58300
     * @tc.name      testToolBarItemMatrix0583
     * @tc.desc      Verify ToolBarItem construction for matrix row 582.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0583 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_582',
        label: 'tool_label_582',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_582');
      expect(item.label).assertEqual('tool_label_582');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0583 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_58400
     * @tc.name      testToolBarItemMatrix0584
     * @tc.desc      Verify ToolBarItem construction for matrix row 583.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0584 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_583',
        label: 'tool_label_583',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_583');
      expect(item.label).assertEqual('tool_label_583');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0584 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_58500
     * @tc.name      testToolBarItemMatrix0585
     * @tc.desc      Verify ToolBarItem construction for matrix row 584.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0585 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_584',
        label: 'tool_label_584',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_584');
      expect(item.label).assertEqual('tool_label_584');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0585 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_58600
     * @tc.name      testToolBarItemMatrix0586
     * @tc.desc      Verify ToolBarItem construction for matrix row 585.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0586 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_585',
        label: 'tool_label_585',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_585');
      expect(item.label).assertEqual('tool_label_585');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0586 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_58700
     * @tc.name      testToolBarItemMatrix0587
     * @tc.desc      Verify ToolBarItem construction for matrix row 586.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0587 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_586',
        label: 'tool_label_586',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_586');
      expect(item.label).assertEqual('tool_label_586');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0587 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_58800
     * @tc.name      testToolBarItemMatrix0588
     * @tc.desc      Verify ToolBarItem construction for matrix row 587.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0588 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_587',
        label: 'tool_label_587',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_587');
      expect(item.label).assertEqual('tool_label_587');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0588 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_58900
     * @tc.name      testToolBarItemMatrix0589
     * @tc.desc      Verify ToolBarItem construction for matrix row 588.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0589 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_588',
        label: 'tool_label_588',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_588');
      expect(item.label).assertEqual('tool_label_588');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0589 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_59000
     * @tc.name      testToolBarItemMatrix0590
     * @tc.desc      Verify ToolBarItem construction for matrix row 589.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0590 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_589',
        label: 'tool_label_589',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_589');
      expect(item.label).assertEqual('tool_label_589');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0590 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_59100
     * @tc.name      testToolBarItemMatrix0591
     * @tc.desc      Verify ToolBarItem construction for matrix row 590.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0591 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_590',
        label: 'tool_label_590',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_590');
      expect(item.label).assertEqual('tool_label_590');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0591 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_59200
     * @tc.name      testToolBarItemMatrix0592
     * @tc.desc      Verify ToolBarItem construction for matrix row 591.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0592 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_591',
        label: 'tool_label_591',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_591');
      expect(item.label).assertEqual('tool_label_591');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0592 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_59300
     * @tc.name      testToolBarItemMatrix0593
     * @tc.desc      Verify ToolBarItem construction for matrix row 592.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0593 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_592',
        label: 'tool_label_592',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_592');
      expect(item.label).assertEqual('tool_label_592');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0593 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_59400
     * @tc.name      testToolBarItemMatrix0594
     * @tc.desc      Verify ToolBarItem construction for matrix row 593.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0594 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_593',
        label: 'tool_label_593',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_593');
      expect(item.label).assertEqual('tool_label_593');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0594 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_59500
     * @tc.name      testToolBarItemMatrix0595
     * @tc.desc      Verify ToolBarItem construction for matrix row 594.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0595 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_594',
        label: 'tool_label_594',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_594');
      expect(item.label).assertEqual('tool_label_594');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0595 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_59600
     * @tc.name      testToolBarItemMatrix0596
     * @tc.desc      Verify ToolBarItem construction for matrix row 595.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0596 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_595',
        label: 'tool_label_595',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_595');
      expect(item.label).assertEqual('tool_label_595');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0596 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_59700
     * @tc.name      testToolBarItemMatrix0597
     * @tc.desc      Verify ToolBarItem construction for matrix row 596.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0597 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_596',
        label: 'tool_label_596',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_596');
      expect(item.label).assertEqual('tool_label_596');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0597 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_59800
     * @tc.name      testToolBarItemMatrix0598
     * @tc.desc      Verify ToolBarItem construction for matrix row 597.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0598 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_597',
        label: 'tool_label_597',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_597');
      expect(item.label).assertEqual('tool_label_597');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0598 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_59900
     * @tc.name      testToolBarItemMatrix0599
     * @tc.desc      Verify ToolBarItem construction for matrix row 598.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0599 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_598',
        label: 'tool_label_598',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_598');
      expect(item.label).assertEqual('tool_label_598');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0599 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_60000
     * @tc.name      testToolBarItemMatrix0600
     * @tc.desc      Verify ToolBarItem construction for matrix row 599.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0600 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_599',
        label: 'tool_label_599',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_599');
      expect(item.label).assertEqual('tool_label_599');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0600 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_60100
     * @tc.name      testToolBarItemMatrix0601
     * @tc.desc      Verify ToolBarItem construction for matrix row 600.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0601 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_600',
        label: 'tool_label_600',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_600');
      expect(item.label).assertEqual('tool_label_600');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0601 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_60200
     * @tc.name      testToolBarItemMatrix0602
     * @tc.desc      Verify ToolBarItem construction for matrix row 601.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0602 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_601',
        label: 'tool_label_601',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_601');
      expect(item.label).assertEqual('tool_label_601');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0602 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_60300
     * @tc.name      testToolBarItemMatrix0603
     * @tc.desc      Verify ToolBarItem construction for matrix row 602.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0603 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_602',
        label: 'tool_label_602',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_602');
      expect(item.label).assertEqual('tool_label_602');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0603 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_60400
     * @tc.name      testToolBarItemMatrix0604
     * @tc.desc      Verify ToolBarItem construction for matrix row 603.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0604 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_603',
        label: 'tool_label_603',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_603');
      expect(item.label).assertEqual('tool_label_603');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0604 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP11_60500
     * @tc.name      testToolBarItemMatrix0605
     * @tc.desc      Verify ToolBarItem construction for matrix row 604.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0605 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_604',
        label: 'tool_label_604',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_604');
      expect(item.label).assertEqual('tool_label_604');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0605 end');
    })

  })
}
