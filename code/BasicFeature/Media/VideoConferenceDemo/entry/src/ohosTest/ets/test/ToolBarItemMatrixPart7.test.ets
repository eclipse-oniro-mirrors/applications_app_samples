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

export default function ToolBarItemMatrixPart7Test(): void {
  describe('ToolBarItemMatrixPart7', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_0100
     * @tc.name      testToolBarItemMatrix0331
     * @tc.desc      Verify ToolBarItem construction for matrix row 330.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0331 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_330',
        label: 'tool_label_330',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_330');
      expect(item.label).assertEqual('tool_label_330');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0331 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_0200
     * @tc.name      testToolBarItemMatrix0332
     * @tc.desc      Verify ToolBarItem construction for matrix row 331.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0332 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_331',
        label: 'tool_label_331',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_331');
      expect(item.label).assertEqual('tool_label_331');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0332 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_0300
     * @tc.name      testToolBarItemMatrix0333
     * @tc.desc      Verify ToolBarItem construction for matrix row 332.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0333 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_332',
        label: 'tool_label_332',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_332');
      expect(item.label).assertEqual('tool_label_332');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0333 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_0400
     * @tc.name      testToolBarItemMatrix0334
     * @tc.desc      Verify ToolBarItem construction for matrix row 333.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0334 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_333',
        label: 'tool_label_333',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_333');
      expect(item.label).assertEqual('tool_label_333');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0334 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_0500
     * @tc.name      testToolBarItemMatrix0335
     * @tc.desc      Verify ToolBarItem construction for matrix row 334.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0335 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_334',
        label: 'tool_label_334',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_334');
      expect(item.label).assertEqual('tool_label_334');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0335 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_0600
     * @tc.name      testToolBarItemMatrix0336
     * @tc.desc      Verify ToolBarItem construction for matrix row 335.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0336 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_335',
        label: 'tool_label_335',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_335');
      expect(item.label).assertEqual('tool_label_335');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0336 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_0700
     * @tc.name      testToolBarItemMatrix0337
     * @tc.desc      Verify ToolBarItem construction for matrix row 336.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0337 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_336',
        label: 'tool_label_336',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_336');
      expect(item.label).assertEqual('tool_label_336');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0337 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_0800
     * @tc.name      testToolBarItemMatrix0338
     * @tc.desc      Verify ToolBarItem construction for matrix row 337.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0338 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_337',
        label: 'tool_label_337',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_337');
      expect(item.label).assertEqual('tool_label_337');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0338 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_0900
     * @tc.name      testToolBarItemMatrix0339
     * @tc.desc      Verify ToolBarItem construction for matrix row 338.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0339 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_338',
        label: 'tool_label_338',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_338');
      expect(item.label).assertEqual('tool_label_338');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0339 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_1000
     * @tc.name      testToolBarItemMatrix0340
     * @tc.desc      Verify ToolBarItem construction for matrix row 339.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0340 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_339',
        label: 'tool_label_339',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_339');
      expect(item.label).assertEqual('tool_label_339');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0340 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_1100
     * @tc.name      testToolBarItemMatrix0341
     * @tc.desc      Verify ToolBarItem construction for matrix row 340.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0341 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_340',
        label: 'tool_label_340',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_340');
      expect(item.label).assertEqual('tool_label_340');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0341 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_1200
     * @tc.name      testToolBarItemMatrix0342
     * @tc.desc      Verify ToolBarItem construction for matrix row 341.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0342 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_341',
        label: 'tool_label_341',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_341');
      expect(item.label).assertEqual('tool_label_341');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0342 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_1300
     * @tc.name      testToolBarItemMatrix0343
     * @tc.desc      Verify ToolBarItem construction for matrix row 342.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0343 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_342',
        label: 'tool_label_342',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_342');
      expect(item.label).assertEqual('tool_label_342');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0343 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_1400
     * @tc.name      testToolBarItemMatrix0344
     * @tc.desc      Verify ToolBarItem construction for matrix row 343.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0344 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_343',
        label: 'tool_label_343',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_343');
      expect(item.label).assertEqual('tool_label_343');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0344 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_1500
     * @tc.name      testToolBarItemMatrix0345
     * @tc.desc      Verify ToolBarItem construction for matrix row 344.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0345 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_344',
        label: 'tool_label_344',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_344');
      expect(item.label).assertEqual('tool_label_344');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0345 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_1600
     * @tc.name      testToolBarItemMatrix0346
     * @tc.desc      Verify ToolBarItem construction for matrix row 345.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0346 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_345',
        label: 'tool_label_345',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_345');
      expect(item.label).assertEqual('tool_label_345');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0346 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_1700
     * @tc.name      testToolBarItemMatrix0347
     * @tc.desc      Verify ToolBarItem construction for matrix row 346.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0347 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_346',
        label: 'tool_label_346',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_346');
      expect(item.label).assertEqual('tool_label_346');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0347 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_1800
     * @tc.name      testToolBarItemMatrix0348
     * @tc.desc      Verify ToolBarItem construction for matrix row 347.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0348 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_347',
        label: 'tool_label_347',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_347');
      expect(item.label).assertEqual('tool_label_347');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0348 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_1900
     * @tc.name      testToolBarItemMatrix0349
     * @tc.desc      Verify ToolBarItem construction for matrix row 348.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0349 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_348',
        label: 'tool_label_348',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_348');
      expect(item.label).assertEqual('tool_label_348');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0349 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_2000
     * @tc.name      testToolBarItemMatrix0350
     * @tc.desc      Verify ToolBarItem construction for matrix row 349.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0350 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_349',
        label: 'tool_label_349',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_349');
      expect(item.label).assertEqual('tool_label_349');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0350 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_2100
     * @tc.name      testToolBarItemMatrix0351
     * @tc.desc      Verify ToolBarItem construction for matrix row 350.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0351 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_350',
        label: 'tool_label_350',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_350');
      expect(item.label).assertEqual('tool_label_350');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0351 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_2200
     * @tc.name      testToolBarItemMatrix0352
     * @tc.desc      Verify ToolBarItem construction for matrix row 351.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0352 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_351',
        label: 'tool_label_351',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_351');
      expect(item.label).assertEqual('tool_label_351');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0352 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_2300
     * @tc.name      testToolBarItemMatrix0353
     * @tc.desc      Verify ToolBarItem construction for matrix row 352.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0353 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_352',
        label: 'tool_label_352',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_352');
      expect(item.label).assertEqual('tool_label_352');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0353 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_2400
     * @tc.name      testToolBarItemMatrix0354
     * @tc.desc      Verify ToolBarItem construction for matrix row 353.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0354 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_353',
        label: 'tool_label_353',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_353');
      expect(item.label).assertEqual('tool_label_353');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0354 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_2500
     * @tc.name      testToolBarItemMatrix0355
     * @tc.desc      Verify ToolBarItem construction for matrix row 354.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0355 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_354',
        label: 'tool_label_354',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_354');
      expect(item.label).assertEqual('tool_label_354');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0355 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_2600
     * @tc.name      testToolBarItemMatrix0356
     * @tc.desc      Verify ToolBarItem construction for matrix row 355.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0356 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_355',
        label: 'tool_label_355',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_355');
      expect(item.label).assertEqual('tool_label_355');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0356 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_2700
     * @tc.name      testToolBarItemMatrix0357
     * @tc.desc      Verify ToolBarItem construction for matrix row 356.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0357 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_356',
        label: 'tool_label_356',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_356');
      expect(item.label).assertEqual('tool_label_356');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0357 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_2800
     * @tc.name      testToolBarItemMatrix0358
     * @tc.desc      Verify ToolBarItem construction for matrix row 357.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0358 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_357',
        label: 'tool_label_357',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_357');
      expect(item.label).assertEqual('tool_label_357');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0358 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_2900
     * @tc.name      testToolBarItemMatrix0359
     * @tc.desc      Verify ToolBarItem construction for matrix row 358.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0359 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_358',
        label: 'tool_label_358',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_358');
      expect(item.label).assertEqual('tool_label_358');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0359 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_3000
     * @tc.name      testToolBarItemMatrix0360
     * @tc.desc      Verify ToolBarItem construction for matrix row 359.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0360 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_359',
        label: 'tool_label_359',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_359');
      expect(item.label).assertEqual('tool_label_359');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0360 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_3100
     * @tc.name      testToolBarItemMatrix0361
     * @tc.desc      Verify ToolBarItem construction for matrix row 360.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0361 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_360',
        label: 'tool_label_360',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_360');
      expect(item.label).assertEqual('tool_label_360');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0361 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_3200
     * @tc.name      testToolBarItemMatrix0362
     * @tc.desc      Verify ToolBarItem construction for matrix row 361.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0362 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_361',
        label: 'tool_label_361',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_361');
      expect(item.label).assertEqual('tool_label_361');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0362 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_3300
     * @tc.name      testToolBarItemMatrix0363
     * @tc.desc      Verify ToolBarItem construction for matrix row 362.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0363 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_362',
        label: 'tool_label_362',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_362');
      expect(item.label).assertEqual('tool_label_362');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0363 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_3400
     * @tc.name      testToolBarItemMatrix0364
     * @tc.desc      Verify ToolBarItem construction for matrix row 363.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0364 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_363',
        label: 'tool_label_363',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_363');
      expect(item.label).assertEqual('tool_label_363');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0364 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_3500
     * @tc.name      testToolBarItemMatrix0365
     * @tc.desc      Verify ToolBarItem construction for matrix row 364.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0365 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_364',
        label: 'tool_label_364',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_364');
      expect(item.label).assertEqual('tool_label_364');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0365 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_3600
     * @tc.name      testToolBarItemMatrix0366
     * @tc.desc      Verify ToolBarItem construction for matrix row 365.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0366 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_365',
        label: 'tool_label_365',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_365');
      expect(item.label).assertEqual('tool_label_365');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0366 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_3700
     * @tc.name      testToolBarItemMatrix0367
     * @tc.desc      Verify ToolBarItem construction for matrix row 366.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0367 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_366',
        label: 'tool_label_366',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_366');
      expect(item.label).assertEqual('tool_label_366');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0367 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_3800
     * @tc.name      testToolBarItemMatrix0368
     * @tc.desc      Verify ToolBarItem construction for matrix row 367.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0368 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_367',
        label: 'tool_label_367',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_367');
      expect(item.label).assertEqual('tool_label_367');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0368 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_3900
     * @tc.name      testToolBarItemMatrix0369
     * @tc.desc      Verify ToolBarItem construction for matrix row 368.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0369 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_368',
        label: 'tool_label_368',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_368');
      expect(item.label).assertEqual('tool_label_368');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0369 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_4000
     * @tc.name      testToolBarItemMatrix0370
     * @tc.desc      Verify ToolBarItem construction for matrix row 369.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0370 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_369',
        label: 'tool_label_369',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_369');
      expect(item.label).assertEqual('tool_label_369');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0370 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_4100
     * @tc.name      testToolBarItemMatrix0371
     * @tc.desc      Verify ToolBarItem construction for matrix row 370.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0371 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_370',
        label: 'tool_label_370',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_370');
      expect(item.label).assertEqual('tool_label_370');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0371 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_4200
     * @tc.name      testToolBarItemMatrix0372
     * @tc.desc      Verify ToolBarItem construction for matrix row 371.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0372 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_371',
        label: 'tool_label_371',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_371');
      expect(item.label).assertEqual('tool_label_371');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0372 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_4300
     * @tc.name      testToolBarItemMatrix0373
     * @tc.desc      Verify ToolBarItem construction for matrix row 372.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0373 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_372',
        label: 'tool_label_372',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_372');
      expect(item.label).assertEqual('tool_label_372');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0373 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_4400
     * @tc.name      testToolBarItemMatrix0374
     * @tc.desc      Verify ToolBarItem construction for matrix row 373.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0374 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_373',
        label: 'tool_label_373',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_373');
      expect(item.label).assertEqual('tool_label_373');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0374 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_4500
     * @tc.name      testToolBarItemMatrix0375
     * @tc.desc      Verify ToolBarItem construction for matrix row 374.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0375 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_374',
        label: 'tool_label_374',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_374');
      expect(item.label).assertEqual('tool_label_374');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0375 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_4600
     * @tc.name      testToolBarItemMatrix0376
     * @tc.desc      Verify ToolBarItem construction for matrix row 375.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0376 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_375',
        label: 'tool_label_375',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_375');
      expect(item.label).assertEqual('tool_label_375');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0376 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_4700
     * @tc.name      testToolBarItemMatrix0377
     * @tc.desc      Verify ToolBarItem construction for matrix row 376.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0377 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_376',
        label: 'tool_label_376',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_376');
      expect(item.label).assertEqual('tool_label_376');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0377 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_4800
     * @tc.name      testToolBarItemMatrix0378
     * @tc.desc      Verify ToolBarItem construction for matrix row 377.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0378 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_377',
        label: 'tool_label_377',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_377');
      expect(item.label).assertEqual('tool_label_377');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0378 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_4900
     * @tc.name      testToolBarItemMatrix0379
     * @tc.desc      Verify ToolBarItem construction for matrix row 378.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0379 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_378',
        label: 'tool_label_378',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_378');
      expect(item.label).assertEqual('tool_label_378');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0379 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_5000
     * @tc.name      testToolBarItemMatrix0380
     * @tc.desc      Verify ToolBarItem construction for matrix row 379.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0380 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_379',
        label: 'tool_label_379',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_379');
      expect(item.label).assertEqual('tool_label_379');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0380 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_5100
     * @tc.name      testToolBarItemMatrix0381
     * @tc.desc      Verify ToolBarItem construction for matrix row 380.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0381 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_380',
        label: 'tool_label_380',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_380');
      expect(item.label).assertEqual('tool_label_380');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0381 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_5200
     * @tc.name      testToolBarItemMatrix0382
     * @tc.desc      Verify ToolBarItem construction for matrix row 381.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0382 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_381',
        label: 'tool_label_381',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_381');
      expect(item.label).assertEqual('tool_label_381');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0382 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_5300
     * @tc.name      testToolBarItemMatrix0383
     * @tc.desc      Verify ToolBarItem construction for matrix row 382.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0383 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_382',
        label: 'tool_label_382',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White, Color.Red],
        iconInActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_382');
      expect(item.label).assertEqual('tool_label_382');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0383 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_5400
     * @tc.name      testToolBarItemMatrix0384
     * @tc.desc      Verify ToolBarItem construction for matrix row 383.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0384 begin');
      let seen: boolean = false;
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_383',
        label: 'tool_label_383',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.Black, Color.Green, Color.Blue],
        iconInActiveColors: [Color.White],
        isActive: true,
        onClick: (v: boolean) => { seen = v; },
      });
      expect(item.id).assertEqual('tool_id_383');
      expect(item.label).assertEqual('tool_label_383');
      expect(item.isActive).assertEqual(true);
      expect(item.iconActive !== undefined).assertTrue();
      expect(item.iconActiveColors !== undefined).assertTrue();
      expect(item.iconInactive !== undefined).assertEqual(false);
      item.onClick(true);
      expect(seen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0384 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_TOOLBARP7_ONE_5500
     * @tc.name      testToolBarItemMatrix0385
     * @tc.desc      Verify ToolBarItem construction for matrix row 384.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToolBarItemMatrix0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0385 begin');
      const item: ToolBarItem = new ToolBarItem({
        id: 'tool_id_384',
        label: 'tool_label_384',
        iconActive: $r('sys.symbol.mic_fill'),
        iconActiveColors: [Color.White],
        iconInActiveColors: [Color.White, Color.Red],
        iconInactive: $r('sys.symbol.mic_fill'),
        isActive: false,
      });
      expect(item.id).assertEqual('tool_id_384');
      expect(item.label).assertEqual('tool_label_384');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToolBarItemMatrix0385 end');
    })

  })
}
