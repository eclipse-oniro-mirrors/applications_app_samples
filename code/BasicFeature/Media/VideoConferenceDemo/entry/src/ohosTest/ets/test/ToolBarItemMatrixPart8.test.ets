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

export default function ToolBarItemMatrixPart8Test(): void {
  describe('ToolBarItemMatrixPart8', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_0100
     * @tc.name      testToolBarItemMatrix0386
     * @tc.desc      Verify ToolBarItem construction for matrix row 385.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0386 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_385',
        label: 'tool_label_385',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_385');
      expect(item.label).assertEqual('tool_label_385');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0386 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_0200
     * @tc.name      testToolBarItemMatrix0387
     * @tc.desc      Verify ToolBarItem construction for matrix row 386.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0387 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_386',
        label: 'tool_label_386',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_386');
      expect(item.label).assertEqual('tool_label_386');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0387 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_0300
     * @tc.name      testToolBarItemMatrix0388
     * @tc.desc      Verify ToolBarItem construction for matrix row 387.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0388 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_387',
        label: 'tool_label_387',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_387');
      expect(item.label).assertEqual('tool_label_387');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0388 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_0400
     * @tc.name      testToolBarItemMatrix0389
     * @tc.desc      Verify ToolBarItem construction for matrix row 388.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0389 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_388',
        label: 'tool_label_388',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_388');
      expect(item.label).assertEqual('tool_label_388');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0389 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_0500
     * @tc.name      testToolBarItemMatrix0390
     * @tc.desc      Verify ToolBarItem construction for matrix row 389.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0390 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_389',
        label: 'tool_label_389',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_389');
      expect(item.label).assertEqual('tool_label_389');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0390 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_0600
     * @tc.name      testToolBarItemMatrix0391
     * @tc.desc      Verify ToolBarItem construction for matrix row 390.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0391 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_390',
        label: 'tool_label_390',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_390');
      expect(item.label).assertEqual('tool_label_390');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0391 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_0700
     * @tc.name      testToolBarItemMatrix0392
     * @tc.desc      Verify ToolBarItem construction for matrix row 391.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0392 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_391',
        label: 'tool_label_391',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_391');
      expect(item.label).assertEqual('tool_label_391');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0392 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_0800
     * @tc.name      testToolBarItemMatrix0393
     * @tc.desc      Verify ToolBarItem construction for matrix row 392.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0393 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_392',
        label: 'tool_label_392',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_392');
      expect(item.label).assertEqual('tool_label_392');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0393 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_0900
     * @tc.name      testToolBarItemMatrix0394
     * @tc.desc      Verify ToolBarItem construction for matrix row 393.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0394 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_393',
        label: 'tool_label_393',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_393');
      expect(item.label).assertEqual('tool_label_393');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0394 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_1000
     * @tc.name      testToolBarItemMatrix0395
     * @tc.desc      Verify ToolBarItem construction for matrix row 394.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0395 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_394',
        label: 'tool_label_394',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_394');
      expect(item.label).assertEqual('tool_label_394');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0395 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_1100
     * @tc.name      testToolBarItemMatrix0396
     * @tc.desc      Verify ToolBarItem construction for matrix row 395.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0396 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_395',
        label: 'tool_label_395',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_395');
      expect(item.label).assertEqual('tool_label_395');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0396 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_1200
     * @tc.name      testToolBarItemMatrix0397
     * @tc.desc      Verify ToolBarItem construction for matrix row 396.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0397 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_396',
        label: 'tool_label_396',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_396');
      expect(item.label).assertEqual('tool_label_396');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0397 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_1300
     * @tc.name      testToolBarItemMatrix0398
     * @tc.desc      Verify ToolBarItem construction for matrix row 397.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0398 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_397',
        label: 'tool_label_397',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_397');
      expect(item.label).assertEqual('tool_label_397');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0398 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_1400
     * @tc.name      testToolBarItemMatrix0399
     * @tc.desc      Verify ToolBarItem construction for matrix row 398.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0399 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_398',
        label: 'tool_label_398',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_398');
      expect(item.label).assertEqual('tool_label_398');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0399 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_1500
     * @tc.name      testToolBarItemMatrix0400
     * @tc.desc      Verify ToolBarItem construction for matrix row 399.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0400 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_399',
        label: 'tool_label_399',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_399');
      expect(item.label).assertEqual('tool_label_399');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0400 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_1600
     * @tc.name      testToolBarItemMatrix0401
     * @tc.desc      Verify ToolBarItem construction for matrix row 400.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0401 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_400',
        label: 'tool_label_400',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_400');
      expect(item.label).assertEqual('tool_label_400');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0401 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_1700
     * @tc.name      testToolBarItemMatrix0402
     * @tc.desc      Verify ToolBarItem construction for matrix row 401.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0402 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_401',
        label: 'tool_label_401',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_401');
      expect(item.label).assertEqual('tool_label_401');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0402 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_1800
     * @tc.name      testToolBarItemMatrix0403
     * @tc.desc      Verify ToolBarItem construction for matrix row 402.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0403 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_402',
        label: 'tool_label_402',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_402');
      expect(item.label).assertEqual('tool_label_402');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0403 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_1900
     * @tc.name      testToolBarItemMatrix0404
     * @tc.desc      Verify ToolBarItem construction for matrix row 403.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0404 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_403',
        label: 'tool_label_403',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_403');
      expect(item.label).assertEqual('tool_label_403');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0404 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_2000
     * @tc.name      testToolBarItemMatrix0405
     * @tc.desc      Verify ToolBarItem construction for matrix row 404.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0405 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_404',
        label: 'tool_label_404',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_404');
      expect(item.label).assertEqual('tool_label_404');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0405 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_2100
     * @tc.name      testToolBarItemMatrix0406
     * @tc.desc      Verify ToolBarItem construction for matrix row 405.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0406 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_405',
        label: 'tool_label_405',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_405');
      expect(item.label).assertEqual('tool_label_405');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0406 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_2200
     * @tc.name      testToolBarItemMatrix0407
     * @tc.desc      Verify ToolBarItem construction for matrix row 406.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0407 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_406',
        label: 'tool_label_406',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_406');
      expect(item.label).assertEqual('tool_label_406');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0407 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_2300
     * @tc.name      testToolBarItemMatrix0408
     * @tc.desc      Verify ToolBarItem construction for matrix row 407.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0408 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_407',
        label: 'tool_label_407',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_407');
      expect(item.label).assertEqual('tool_label_407');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0408 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_2400
     * @tc.name      testToolBarItemMatrix0409
     * @tc.desc      Verify ToolBarItem construction for matrix row 408.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0409 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_408',
        label: 'tool_label_408',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_408');
      expect(item.label).assertEqual('tool_label_408');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0409 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_2500
     * @tc.name      testToolBarItemMatrix0410
     * @tc.desc      Verify ToolBarItem construction for matrix row 409.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0410 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_409',
        label: 'tool_label_409',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_409');
      expect(item.label).assertEqual('tool_label_409');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0410 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_2600
     * @tc.name      testToolBarItemMatrix0411
     * @tc.desc      Verify ToolBarItem construction for matrix row 410.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0411 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_410',
        label: 'tool_label_410',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_410');
      expect(item.label).assertEqual('tool_label_410');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0411 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_2700
     * @tc.name      testToolBarItemMatrix0412
     * @tc.desc      Verify ToolBarItem construction for matrix row 411.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0412 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_411',
        label: 'tool_label_411',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_411');
      expect(item.label).assertEqual('tool_label_411');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0412 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_2800
     * @tc.name      testToolBarItemMatrix0413
     * @tc.desc      Verify ToolBarItem construction for matrix row 412.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0413 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_412',
        label: 'tool_label_412',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_412');
      expect(item.label).assertEqual('tool_label_412');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0413 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_2900
     * @tc.name      testToolBarItemMatrix0414
     * @tc.desc      Verify ToolBarItem construction for matrix row 413.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0414 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_413',
        label: 'tool_label_413',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_413');
      expect(item.label).assertEqual('tool_label_413');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0414 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_3000
     * @tc.name      testToolBarItemMatrix0415
     * @tc.desc      Verify ToolBarItem construction for matrix row 414.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0415 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_414',
        label: 'tool_label_414',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_414');
      expect(item.label).assertEqual('tool_label_414');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0415 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_3100
     * @tc.name      testToolBarItemMatrix0416
     * @tc.desc      Verify ToolBarItem construction for matrix row 415.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0416 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_415',
        label: 'tool_label_415',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_415');
      expect(item.label).assertEqual('tool_label_415');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0416 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_3200
     * @tc.name      testToolBarItemMatrix0417
     * @tc.desc      Verify ToolBarItem construction for matrix row 416.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0417 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_416',
        label: 'tool_label_416',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_416');
      expect(item.label).assertEqual('tool_label_416');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0417 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_3300
     * @tc.name      testToolBarItemMatrix0418
     * @tc.desc      Verify ToolBarItem construction for matrix row 417.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0418 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_417',
        label: 'tool_label_417',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_417');
      expect(item.label).assertEqual('tool_label_417');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0418 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_3400
     * @tc.name      testToolBarItemMatrix0419
     * @tc.desc      Verify ToolBarItem construction for matrix row 418.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0419 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_418',
        label: 'tool_label_418',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_418');
      expect(item.label).assertEqual('tool_label_418');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0419 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_3500
     * @tc.name      testToolBarItemMatrix0420
     * @tc.desc      Verify ToolBarItem construction for matrix row 419.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0420 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_419',
        label: 'tool_label_419',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_419');
      expect(item.label).assertEqual('tool_label_419');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0420 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_3600
     * @tc.name      testToolBarItemMatrix0421
     * @tc.desc      Verify ToolBarItem construction for matrix row 420.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0421 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_420',
        label: 'tool_label_420',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_420');
      expect(item.label).assertEqual('tool_label_420');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0421 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_3700
     * @tc.name      testToolBarItemMatrix0422
     * @tc.desc      Verify ToolBarItem construction for matrix row 421.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0422 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_421',
        label: 'tool_label_421',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_421');
      expect(item.label).assertEqual('tool_label_421');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0422 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_3800
     * @tc.name      testToolBarItemMatrix0423
     * @tc.desc      Verify ToolBarItem construction for matrix row 422.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0423 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_422',
        label: 'tool_label_422',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_422');
      expect(item.label).assertEqual('tool_label_422');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0423 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_3900
     * @tc.name      testToolBarItemMatrix0424
     * @tc.desc      Verify ToolBarItem construction for matrix row 423.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0424 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_423',
        label: 'tool_label_423',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_423');
      expect(item.label).assertEqual('tool_label_423');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0424 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_4000
     * @tc.name      testToolBarItemMatrix0425
     * @tc.desc      Verify ToolBarItem construction for matrix row 424.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0425 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_424',
        label: 'tool_label_424',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_424');
      expect(item.label).assertEqual('tool_label_424');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0425 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_4100
     * @tc.name      testToolBarItemMatrix0426
     * @tc.desc      Verify ToolBarItem construction for matrix row 425.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0426 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_425',
        label: 'tool_label_425',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_425');
      expect(item.label).assertEqual('tool_label_425');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0426 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_4200
     * @tc.name      testToolBarItemMatrix0427
     * @tc.desc      Verify ToolBarItem construction for matrix row 426.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0427 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_426',
        label: 'tool_label_426',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_426');
      expect(item.label).assertEqual('tool_label_426');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0427 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_4300
     * @tc.name      testToolBarItemMatrix0428
     * @tc.desc      Verify ToolBarItem construction for matrix row 427.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0428 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_427',
        label: 'tool_label_427',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_427');
      expect(item.label).assertEqual('tool_label_427');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0428 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_4400
     * @tc.name      testToolBarItemMatrix0429
     * @tc.desc      Verify ToolBarItem construction for matrix row 428.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0429 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_428',
        label: 'tool_label_428',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_428');
      expect(item.label).assertEqual('tool_label_428');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0429 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_4500
     * @tc.name      testToolBarItemMatrix0430
     * @tc.desc      Verify ToolBarItem construction for matrix row 429.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0430 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_429',
        label: 'tool_label_429',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_429');
      expect(item.label).assertEqual('tool_label_429');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0430 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_4600
     * @tc.name      testToolBarItemMatrix0431
     * @tc.desc      Verify ToolBarItem construction for matrix row 430.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0431 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_430',
        label: 'tool_label_430',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_430');
      expect(item.label).assertEqual('tool_label_430');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0431 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_4700
     * @tc.name      testToolBarItemMatrix0432
     * @tc.desc      Verify ToolBarItem construction for matrix row 431.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0432 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_431',
        label: 'tool_label_431',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_431');
      expect(item.label).assertEqual('tool_label_431');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0432 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_4800
     * @tc.name      testToolBarItemMatrix0433
     * @tc.desc      Verify ToolBarItem construction for matrix row 432.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0433 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_432',
        label: 'tool_label_432',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_432');
      expect(item.label).assertEqual('tool_label_432');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0433 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_4900
     * @tc.name      testToolBarItemMatrix0434
     * @tc.desc      Verify ToolBarItem construction for matrix row 433.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0434 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_433',
        label: 'tool_label_433',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_433');
      expect(item.label).assertEqual('tool_label_433');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0434 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_5000
     * @tc.name      testToolBarItemMatrix0435
     * @tc.desc      Verify ToolBarItem construction for matrix row 434.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0435 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_434',
        label: 'tool_label_434',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_434');
      expect(item.label).assertEqual('tool_label_434');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0435 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_5100
     * @tc.name      testToolBarItemMatrix0436
     * @tc.desc      Verify ToolBarItem construction for matrix row 435.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0436 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_435',
        label: 'tool_label_435',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_435');
      expect(item.label).assertEqual('tool_label_435');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0436 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_5200
     * @tc.name      testToolBarItemMatrix0437
     * @tc.desc      Verify ToolBarItem construction for matrix row 436.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0437 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_436',
        label: 'tool_label_436',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_436');
      expect(item.label).assertEqual('tool_label_436');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0437 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_5300
     * @tc.name      testToolBarItemMatrix0438
     * @tc.desc      Verify ToolBarItem construction for matrix row 437.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0438 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_437',
        label: 'tool_label_437',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_437');
      expect(item.label).assertEqual('tool_label_437');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0438 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_5400
     * @tc.name      testToolBarItemMatrix0439
     * @tc.desc      Verify ToolBarItem construction for matrix row 438.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0439 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_438',
        label: 'tool_label_438',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_438');
      expect(item.label).assertEqual('tool_label_438');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0439 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP8_ONE_5500
     * @tc.name      testToolBarItemMatrix0440
     * @tc.desc      Verify ToolBarItem construction for matrix row 439.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0440 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_439',
        label: 'tool_label_439',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_439');
      expect(item.label).assertEqual('tool_label_439');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0440 end');
    })

  })
}
