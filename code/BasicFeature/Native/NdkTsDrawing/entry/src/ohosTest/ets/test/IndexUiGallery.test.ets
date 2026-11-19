/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import { Component, Driver, MatchPattern, ON, Point, Rect } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DRAWING_TAG, launchIndexPage, runCase, UI_WAIT_MS } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Launch the index page and return a driver bound to it.
 *
 * @returns { Promise<Driver> } Driver instance.
 */
async function page(): Promise<Driver> {
  return await launchIndexPage(UI_WAIT_MS);
}

/**
 * Locate the single component carrying one gallery id.
 *
 * @param { Driver } driver - Driver bound to the index page.
 * @param { string } id - Component id.
 * @returns { Promise<Component> } Located component.
 */
async function byId(driver: Driver, id: string): Promise<Component> {
  return await driver.findComponent(ON.id(id));
}

export default function indexUiGalleryTest() {
  describe('IndexUiGalleryTest', () => {
    // ==================== G1 入口定位与属性回读（24 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1001
     * @tc.name testIndexGallery0001
     * @tc.desc Verify the rects entry is located by id and reports its own id, label and clickability.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIndexGallery0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0001 begin');
      await runCase('testIndexGallery0001', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_Rects');
        expect(entry !== null).assertTrue();
        expect(await entry.getId()).assertEqual('gallery_Rects');
        expect(await entry.getText()).assertEqual('Rects');
        expect(await entry.isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1002
     * @tc.name testIndexGallery0002
     * @tc.desc Verify the round rect entry is located by label and is an enabled button.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIndexGallery0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0002 begin');
      await runCase('testIndexGallery0002', async () => {
        const driver: Driver = await page();
        const entry: Component = await driver.findComponent(ON.text('RoundRect'));
        const label: string = await entry.getText();
        expect(label).assertEqual('RoundRect');
        expect(await entry.getType()).assertEqual('Button');
        expect(await entry.isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1003
     * @tc.name testIndexGallery0003
     * @tc.desc Verify the whole button set is discoverable and the circle entry belongs to it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0003 begin');
      await runCase('testIndexGallery0003', async () => {
        const driver: Driver = await page();
        await driver.assertComponentExist(ON.id('gallery_Circle'));
        const buttons: Array<Component> = await driver.findComponents(ON.type('Button'));
        const circle: Component = await byId(driver, 'gallery_Circle');
        expect(buttons.length > 0).assertTrue();
        expect(await circle.isClickable()).assertTrue();
        expect(await circle.getText()).assertEqual('Circle');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1004
     * @tc.name testIndexGallery0004
     * @tc.desc Verify the arc entry occupies a box with a positive size and a placeable center.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0004 begin');
      await runCase('testIndexGallery0004', async () => {
        const driver: Driver = await page();
        const entry: Component = await driver.findComponent(ON.text('Arc'));
        const box: Rect = await entry.getBounds();
        const center: Point = await entry.getBoundsCenter();
        expect(box.right > box.left).assertTrue();
        expect(box.bottom > box.top).assertTrue();
        expect(center.x >= box.left && center.x <= box.right).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1005
     * @tc.name testIndexGallery0005
     * @tc.desc Verify the points entry exposes readable description and hint strings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0005 begin');
      await runCase('testIndexGallery0005', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_Points');
        const description: string = await entry.getDescription();
        const hint: string = await entry.getHint();
        expect(description !== null).assertTrue();
        expect(hint !== null).assertTrue();
        expect(await entry.getText()).assertEqual('Points');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1006
     * @tc.name testIndexGallery0006
     * @tc.desc Verify an exact text match resolves the color entry and its label length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0006 begin');
      await runCase('testIndexGallery0006', async () => {
        const driver: Driver = await page();
        const entry: Component = await driver.findComponent(ON.text('Color', MatchPattern.EQUALS));
        const label: string = await entry.getText();
        expect(label).assertEqual('Color');
        expect(label.length).assertEqual(5);
        expect(await entry.isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1007
     * @tc.name testIndexGallery0007
     * @tc.desc Verify the save restore entry keeps its id after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0007 begin');
      await runCase('testIndexGallery0007', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_SaveRestore');
        const before: string = await entry.getId();
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await byId(driver, 'gallery_SaveRestore');
        expect(before).assertEqual('gallery_SaveRestore');
        expect(await again.getId()).assertEqual(before);
        expect(await again.getText()).assertEqual('SaveRestore');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1008
     * @tc.name testIndexGallery0008
     * @tc.desc Verify the layer entry reports clickable before and after one press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0008 begin');
      await runCase('testIndexGallery0008', async () => {
        const driver: Driver = await page();
        const entry: Component = await driver.findComponent(ON.text('Layer'));
        const clickable: boolean = await entry.isClickable();
        expect(clickable).assertTrue();
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        await driver.assertComponentExist(ON.text('Layer'));
        const again: Component = await driver.findComponent(ON.text('Layer'));
        expect(await again.isClickable()).assertTrue();
        expect(await again.getText()).assertEqual('Layer');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1009
     * @tc.name testIndexGallery0009
     * @tc.desc Verify two bound reads of the transform entry return the same box.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0009 begin');
      await runCase('testIndexGallery0009', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_Transform');
        const first: Rect = await entry.getBounds();
        const second: Rect = await entry.getBounds();
        expect(first.left).assertEqual(second.left);
        expect(first.top).assertEqual(second.top);
        expect(first.right).assertEqual(second.right);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1010
     * @tc.name testIndexGallery0010
     * @tc.desc Verify a prefix match on the matrix entry returns at least one candidate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0010 begin');
      await runCase('testIndexGallery0010', async () => {
        const driver: Driver = await page();
        const candidates: Array<Component> = await driver.findComponents(ON.text('Matri', MatchPattern.STARTS_WITH));
        expect(candidates.length >= 2).assertTrue();
        const matrix: Component = await byId(driver, 'gallery_Matrix');
        const matrixDraw: Component = await byId(driver, 'gallery_MatrixDraw');
        expect(await matrix.getText()).assertEqual('Matrix');
        expect(await matrixDraw.getText()).assertEqual('MatrixDraw');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1011
     * @tc.name testIndexGallery0011
     * @tc.desc Verify the clip entry is a button with the expected id and label.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIndexGallery0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0011 begin');
      await runCase('testIndexGallery0011', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_Clip');
        expect(await entry.getType()).assertEqual('Button');
        expect(await entry.getText()).assertEqual('Clip');
        expect(await entry.getId()).assertEqual('gallery_Clip');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1012
     * @tc.name testIndexGallery0012
     * @tc.desc Verify the clip reset entry stays enabled and labelled after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0012 begin');
      await runCase('testIndexGallery0012', async () => {
        const driver: Driver = await page();
        const entry: Component = await driver.findComponent(ON.text('ClipReset'));
        expect(await entry.isEnabled()).assertTrue();
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await driver.findComponent(ON.text('ClipReset'));
        expect(await again.getText()).assertEqual('ClipReset');
        expect(await again.isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1013
     * @tc.name testIndexGallery0013
     * @tc.desc Verify the path arc entry spans a non degenerate horizontal range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0013 begin');
      await runCase('testIndexGallery0013', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_PathArc');
        const box: Rect = await entry.getBounds();
        expect(box.left >= 0).assertTrue();
        expect(box.right > box.left).assertTrue();
        expect(await entry.getText()).assertEqual('PathArc');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1014
     * @tc.name testIndexGallery0014
     * @tc.desc Verify the bezier path entry reports the id declared on the button.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0014 begin');
      await runCase('testIndexGallery0014', async () => {
        const driver: Driver = await page();
        const entry: Component = await driver.findComponent(ON.text('PathBezier'));
        const id: string = await entry.getId();
        expect(id).assertEqual('gallery_PathBezier');
        expect(id.indexOf('gallery_') === 0).assertTrue();
        expect(await entry.isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1015
     * @tc.name testIndexGallery0015
     * @tc.desc Verify the conic path entry is present before it is queried a second time.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0015 begin');
      await runCase('testIndexGallery0015', async () => {
        const driver: Driver = await page();
        await driver.assertComponentExist(ON.id('gallery_PathConic'));
        const entry: Component = await byId(driver, 'gallery_PathConic');
        const label: string = await entry.getText();
        expect(label).assertEqual('PathConic');
        expect(label.length).assertEqual(9);
        expect(await entry.getId()).assertEqual('gallery_PathConic');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1016
     * @tc.name testIndexGallery0016
     * @tc.desc Verify a contains match resolves the relative path entry by a substring.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0016 begin');
      await runCase('testIndexGallery0016', async () => {
        const driver: Driver = await page();
        const entry: Component = await driver.findComponent(ON.text('Relative', MatchPattern.CONTAINS));
        const label: string = await entry.getText();
        expect(label).assertEqual('PathRelative');
        expect(label.indexOf('Relative') > 0).assertTrue();
        expect(await entry.getId()).assertEqual('gallery_PathRelative');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1017
     * @tc.name testIndexGallery0017
     * @tc.desc Verify the primitive path entry center lies inside the display area.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0017 begin');
      await runCase('testIndexGallery0017', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_PathPrimitive');
        const center: Point = await entry.getBoundsCenter();
        const display: Point = await driver.getDisplaySize();
        expect(center.x > 0).assertTrue();
        expect(center.y > 0).assertTrue();
        expect(center.x < display.x).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1018
     * @tc.name testIndexGallery0018
     * @tc.desc Verify the combined path entry survives a double press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0018 begin');
      await runCase('testIndexGallery0018', async () => {
        const driver: Driver = await page();
        const entry: Component = await driver.findComponent(ON.text('PathCombined'));
        expect(await entry.isClickable()).assertTrue();
        await entry.doubleClick();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await driver.findComponent(ON.text('PathCombined'));
        expect(again !== null).assertTrue();
        expect(await again.getText()).assertEqual('PathCombined');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1019
     * @tc.name testIndexGallery0019
     * @tc.desc Verify the polygon path entry label keeps its declared length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0019 begin');
      await runCase('testIndexGallery0019', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_PathPolygon');
        const label: string = await entry.getText();
        expect(label).assertEqual('PathPolygon');
        expect(label.length).assertEqual(11);
        expect(await entry.getId()).assertEqual('gallery_PathPolygon');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1020
     * @tc.name testIndexGallery0020
     * @tc.desc Verify the pen brush entry reports a button type and an empty hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0020 begin');
      await runCase('testIndexGallery0020', async () => {
        const driver: Driver = await page();
        const entry: Component = await driver.findComponent(ON.text('PenBrush'));
        expect(await entry.getType()).assertEqual('Button');
        expect((await entry.getHint()).length).assertEqual(0);
        expect(await entry.getText()).assertEqual('PenBrush');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1021
     * @tc.name testIndexGallery0021
     * @tc.desc Verify the text blob entry box has a positive height.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0021 begin');
      await runCase('testIndexGallery0021', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_TextBlob');
        const box: Rect = await entry.getBounds();
        expect(box.bottom > box.top).assertTrue();
        expect(await entry.getText()).assertEqual('TextBlob');
        expect(await entry.isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1022
     * @tc.name testIndexGallery0022
     * @tc.desc Verify a contains match for glyph returns exactly the single glyph entry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0022 begin');
      await runCase('testIndexGallery0022', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> = await driver.findComponents(ON.text('Glyph', MatchPattern.CONTAINS));
        expect(matches.length).assertEqual(1);
        const label: string = await matches[0].getText();
        expect(label).assertEqual('Glyph');
        expect(await matches[0].getId()).assertEqual('gallery_Glyph');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1023
     * @tc.name testIndexGallery0023
     * @tc.desc Verify the effect entry stays clickable and keeps its label after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0023 begin');
      await runCase('testIndexGallery0023', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_Effect');
        const longClickable: boolean = await entry.isLongClickable();
        expect(longClickable).assertFalse();
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await byId(driver, 'gallery_Effect');
        expect(await again.getText()).assertEqual('Effect');
        expect(await again.getId()).assertEqual('gallery_Effect');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1024
     * @tc.name testIndexGallery0024
     * @tc.desc Verify a suffix match over the draw entries finds the matrix draw button.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0024 begin');
      await runCase('testIndexGallery0024', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> = await driver.findComponents(ON.text('Draw', MatchPattern.ENDS_WITH));
        let found: string = '';
        for (let index: number = 0; index < matches.length; index++) {
          const label: string = await matches[index].getText();
          if (label === 'MatrixDraw') {
            found = await matches[index].getId();
          }
        }
        expect(matches.length > 0).assertTrue();
        expect(found).assertEqual('gallery_MatrixDraw');
        expect(await byId(driver, 'gallery_MatrixDraw') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0024 end');
    });

    // ==================== G2 入口点击后的页面响应（24 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1025
     * @tc.name testIndexGallery0025
     * @tc.desc Verify a rects press keeps both the preview canvas and the entry on the page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIndexGallery0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0025 begin');
      await runCase('testIndexGallery0025', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_Rects');
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        await driver.assertComponentExist(ON.id('previewCanvas'));
        const again: Component = await byId(driver, 'gallery_Rects');
        expect(await again.getText()).assertEqual('Rects');
        expect(await driver.findComponent(ON.id('previewCanvas')) !== null).assertTrue();
        expect(await again.getId()).assertEqual('gallery_Rects');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1026
     * @tc.name testIndexGallery0026
     * @tc.desc Verify pressing the round rect entry twice keeps its id stable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0026 begin');
      await runCase('testIndexGallery0026', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_RoundRect');
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        const second: Component = await byId(driver, 'gallery_RoundRect');
        await second.click();
        await driver.delayMs(UI_WAIT_MS);
        const third: Component = await byId(driver, 'gallery_RoundRect');
        expect(await third.getId()).assertEqual('gallery_RoundRect');
        expect(await third.isEnabled()).assertTrue();
        expect(await third.getText()).assertEqual('RoundRect');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1027
     * @tc.name testIndexGallery0027
     * @tc.desc Verify a circle press does not change the number of buttons on the page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0027 begin');
      await runCase('testIndexGallery0027', async () => {
        const driver: Driver = await page();
        const before: number = (await driver.findComponents(ON.type('Button'))).length;
        const entry: Component = await byId(driver, 'gallery_Circle');
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        const after: number = (await driver.findComponents(ON.type('Button'))).length;
        expect(before > 0).assertTrue();
        expect(after).assertEqual(before);
        expect(await (await byId(driver, 'gallery_Circle')).getText()).assertEqual('Circle');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1028
     * @tc.name testIndexGallery0028
     * @tc.desc Verify an arc press leaves the entry box unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0028 begin');
      await runCase('testIndexGallery0028', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_Arc');
        const before: Rect = await entry.getBounds();
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        const after: Rect = await (await byId(driver, 'gallery_Arc')).getBounds();
        expect(after.left).assertEqual(before.left);
        expect(after.top).assertEqual(before.top);
        expect(await (await byId(driver, 'gallery_Arc')).getText()).assertEqual('Arc');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1029
     * @tc.name testIndexGallery0029
     * @tc.desc Verify the points entry remains enabled after it is pressed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0029 begin');
      await runCase('testIndexGallery0029', async () => {
        const driver: Driver = await page();
        const entry: Component = await driver.findComponent(ON.text('Points'));
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await driver.findComponent(ON.text('Points'));
        expect(await again.isEnabled()).assertTrue();
        expect(await again.isClickable()).assertTrue();
        expect(await again.getText()).assertEqual('Points');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1030
     * @tc.name testIndexGallery0030
     * @tc.desc Verify the color entry keeps its declared type after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0030 begin');
      await runCase('testIndexGallery0030', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_Color');
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        const type: string = await (await byId(driver, 'gallery_Color')).getType();
        expect(type).assertEqual('Button');
        expect(await (await byId(driver, 'gallery_Color')).getText()).assertEqual('Color');
        expect(await (await byId(driver, 'gallery_Color')).isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1031
     * @tc.name testIndexGallery0031
     * @tc.desc Verify a save restore press leaves the render node container reachable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0031 begin');
      await runCase('testIndexGallery0031', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_SaveRestore')).click();
        await driver.delayMs(UI_WAIT_MS);
        const container: Component = await byId(driver, 'renderNodeContainer');
        expect(container !== null).assertTrue();
        expect(await byId(driver, 'gallery_SaveRestore') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_SaveRestore')).getText()).assertEqual('SaveRestore');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1032
     * @tc.name testIndexGallery0032
     * @tc.desc Verify a layer press keeps the gallery scrollable and the entry listed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0032 begin');
      await runCase('testIndexGallery0032', async () => {
        const driver: Driver = await page();
        await (await driver.findComponent(ON.text('Layer'))).click();
        await driver.delayMs(UI_WAIT_MS);
        const scrollable: Array<Component> = await driver.findComponents(ON.type('Scroll'));
        expect(scrollable.length > 0).assertTrue();
        expect(await driver.findComponent(ON.text('Layer')) !== null).assertTrue();
        expect(await (await driver.findComponent(ON.text('Layer'))).getText()).assertEqual('Layer');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1033
     * @tc.name testIndexGallery0033
     * @tc.desc Verify the transform entry keeps the same center after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0033 begin');
      await runCase('testIndexGallery0033', async () => {
        const driver: Driver = await page();
        const entry: Component = await byId(driver, 'gallery_Transform');
        const before: Point = await entry.getBoundsCenter();
        await entry.click();
        await driver.delayMs(UI_WAIT_MS);
        const after: Point = await (await byId(driver, 'gallery_Transform')).getBoundsCenter();
        expect(after.x).assertEqual(before.x);
        expect(after.y).assertEqual(before.y);
        expect(await (await byId(driver, 'gallery_Transform')).getText()).assertEqual('Transform');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1034
     * @tc.name testIndexGallery0034
     * @tc.desc Verify a matrix press keeps the two matrix candidates resolvable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0034 begin');
      await runCase('testIndexGallery0034', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_Matrix')).click();
        await driver.delayMs(UI_WAIT_MS);
        const candidates: Array<Component> =
          await driver.findComponents(ON.text('Matrix', MatchPattern.CONTAINS));
        expect(candidates.length >= 2).assertTrue();
        expect(await byId(driver, 'gallery_MatrixDraw') !== null).assertTrue();
        expect(await byId(driver, 'gallery_Matrix') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1035
     * @tc.name testIndexGallery0035
     * @tc.desc Verify the clip entry keeps a four character label after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0035 begin');
      await runCase('testIndexGallery0035', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_Clip')).click();
        await driver.delayMs(UI_WAIT_MS);
        const label: string = await (await byId(driver, 'gallery_Clip')).getText();
        expect(label).assertEqual('Clip');
        expect(label.length).assertEqual(4);
        expect(await (await byId(driver, 'gallery_Clip')).getId()).assertEqual('gallery_Clip');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1036
     * @tc.name testIndexGallery0036
     * @tc.desc Verify the clip reset entry can be pressed twice without losing its label.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0036 begin');
      await runCase('testIndexGallery0036', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_ClipReset')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_ClipReset')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_ClipReset')).getText()).assertEqual('ClipReset');
        expect(await (await byId(driver, 'gallery_ClipReset')).isEnabled()).assertTrue();
        expect(await (await byId(driver, 'gallery_ClipReset')).getId()).assertEqual('gallery_ClipReset');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1037
     * @tc.name testIndexGallery0037
     * @tc.desc Verify a path arc press keeps every path entry resolvable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0037 begin');
      await runCase('testIndexGallery0037', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PathArc')).click();
        await driver.delayMs(UI_WAIT_MS);
        const paths: Array<Component> = await driver.findComponents(ON.text('Path', MatchPattern.STARTS_WITH));
        expect(paths.length >= 7).assertTrue();
        expect(await byId(driver, 'gallery_PathArc') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_PathArc')).getText()).assertEqual('PathArc');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1038
     * @tc.name testIndexGallery0038
     * @tc.desc Verify the bezier entry still reports a description after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0038 begin');
      await runCase('testIndexGallery0038', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PathBezier')).click();
        await driver.delayMs(UI_WAIT_MS);
        const description: string = await (await byId(driver, 'gallery_PathBezier')).getDescription();
        expect(description !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_PathBezier')).getText()).assertEqual('PathBezier');
        expect(await (await byId(driver, 'gallery_PathBezier')).getId()).assertEqual('gallery_PathBezier');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1039
     * @tc.name testIndexGallery0039
     * @tc.desc Verify the conic entry is still addressable by id after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0039 begin');
      await runCase('testIndexGallery0039', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PathConic')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_PathConic')).getId()).assertEqual('gallery_PathConic');
        expect(await (await byId(driver, 'gallery_PathConic')).isClickable()).assertTrue();
        expect(await (await byId(driver, 'gallery_PathConic')).getText()).assertEqual('PathConic');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1040
     * @tc.name testIndexGallery0040
     * @tc.desc Verify the relative path entry keeps a non negative left edge after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0040 begin');
      await runCase('testIndexGallery0040', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PathRelative')).click();
        await driver.delayMs(UI_WAIT_MS);
        const box: Rect = await (await byId(driver, 'gallery_PathRelative')).getBounds();
        expect(box.left >= 0).assertTrue();
        expect(box.right > box.left).assertTrue();
        expect(await (await byId(driver, 'gallery_PathRelative')).getText()).assertEqual('PathRelative');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1041
     * @tc.name testIndexGallery0041
     * @tc.desc Verify the primitive path entry stays clickable across two presses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0041 begin');
      await runCase('testIndexGallery0041', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PathPrimitive')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_PathPrimitive')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_PathPrimitive')).isClickable()).assertTrue();
        expect(await (await byId(driver, 'gallery_PathPrimitive')).getText()).assertEqual('PathPrimitive');
        expect(await (await byId(driver, 'gallery_PathPrimitive')).getId()).assertEqual('gallery_PathPrimitive');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1042
     * @tc.name testIndexGallery0042
     * @tc.desc Verify the combined path press keeps the legacy draw buttons visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0042 begin');
      await runCase('testIndexGallery0042', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PathCombined')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'btnDrawRect') !== null).assertTrue();
        expect(await byId(driver, 'btnDrawPath') !== null).assertTrue();
        expect(await byId(driver, 'btnDrawText') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1043
     * @tc.name testIndexGallery0043
     * @tc.desc Verify the polygon path entry keeps its eleven character label after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0043 begin');
      await runCase('testIndexGallery0043', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PathPolygon')).click();
        await driver.delayMs(UI_WAIT_MS);
        const label: string = await (await byId(driver, 'gallery_PathPolygon')).getText();
        expect(label.length).assertEqual(11);
        expect(label).assertEqual('PathPolygon');
        expect(await (await byId(driver, 'gallery_PathPolygon')).isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1044
     * @tc.name testIndexGallery0044
     * @tc.desc Verify the pen brush entry keeps its label and type after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0044 begin');
      await runCase('testIndexGallery0044', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PenBrush')).click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await byId(driver, 'gallery_PenBrush');
        expect(await again.getText()).assertEqual('PenBrush');
        expect(await again.getType()).assertEqual('Button');
        expect(await again.getId()).assertEqual('gallery_PenBrush');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1045
     * @tc.name testIndexGallery0045
     * @tc.desc Verify a text blob press keeps both the canvas and the entry on the page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0045 begin');
      await runCase('testIndexGallery0045', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_TextBlob')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
        expect(await byId(driver, 'gallery_TextBlob') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_TextBlob')).getText()).assertEqual('TextBlob');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1046
     * @tc.name testIndexGallery0046
     * @tc.desc Verify the glyph entry keeps a positive height after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0046 begin');
      await runCase('testIndexGallery0046', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_Glyph')).click();
        await driver.delayMs(UI_WAIT_MS);
        const box: Rect = await (await byId(driver, 'gallery_Glyph')).getBounds();
        expect(box.bottom > box.top).assertTrue();
        expect(await (await byId(driver, 'gallery_Glyph')).getText()).assertEqual('Glyph');
        expect(await (await byId(driver, 'gallery_Glyph')).getId()).assertEqual('gallery_Glyph');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1047
     * @tc.name testIndexGallery0047
     * @tc.desc Verify the effect entry stays clickable but not long clickable after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0047 begin');
      await runCase('testIndexGallery0047', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_Effect')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_Effect')).isLongClickable()).assertFalse();
        expect(await (await byId(driver, 'gallery_Effect')).getText()).assertEqual('Effect');
        expect(await (await byId(driver, 'gallery_Effect')).isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1048
     * @tc.name testIndexGallery0048
     * @tc.desc Verify the matrix draw entry keeps its id and label after a press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0048 begin');
      await runCase('testIndexGallery0048', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_MatrixDraw')).click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await byId(driver, 'gallery_MatrixDraw');
        expect(await again.getId()).assertEqual('gallery_MatrixDraw');
        expect(await again.getText()).assertEqual('MatrixDraw');
        expect(await again.isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0048 end');
    });

    // ==================== G3 两入口交替切换（12 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1049
     * @tc.name testIndexGallery0049
     * @tc.desc Verify pressing rects then round rect updates both labels in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexGallery0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0049 begin');
      await runCase('testIndexGallery0049', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_Rects')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_Rects')).getText()).assertEqual('Rects');
        await (await byId(driver, 'gallery_RoundRect')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_RoundRect')).getText()).assertEqual('RoundRect');
        expect(await (await byId(driver, 'gallery_Rects')).getId()).assertEqual('gallery_Rects');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1050
     * @tc.name testIndexGallery0050
     * @tc.desc Verify pressing arc then circle keeps both entries enabled.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0050 begin');
      await runCase('testIndexGallery0050', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_Arc')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_Circle')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_Arc')).isEnabled()).assertTrue();
        expect(await (await byId(driver, 'gallery_Circle')).isEnabled()).assertTrue();
        expect(await (await byId(driver, 'gallery_Arc')).getText()).assertEqual('Arc');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1051
     * @tc.name testIndexGallery0051
     * @tc.desc Verify pressing color then points keeps the button count stable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0051 begin');
      await runCase('testIndexGallery0051', async () => {
        const driver: Driver = await page();
        const count: number = (await driver.findComponents(ON.type('Button'))).length;
        await (await byId(driver, 'gallery_Color')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_Points')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect((await driver.findComponents(ON.type('Button'))).length).assertEqual(count);
        expect(await (await byId(driver, 'gallery_Points')).getText()).assertEqual('Points');
        expect(await (await byId(driver, 'gallery_Color')).getText()).assertEqual('Color');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1052
     * @tc.name testIndexGallery0052
     * @tc.desc Verify pressing layer then save restore keeps both ids readable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0052 begin');
      await runCase('testIndexGallery0052', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_Layer')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_SaveRestore')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_Layer')).getId()).assertEqual('gallery_Layer');
        expect(await (await byId(driver, 'gallery_SaveRestore')).getId()).assertEqual('gallery_SaveRestore');
        expect(await (await byId(driver, 'gallery_Layer')).getText()).assertEqual('Layer');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1053
     * @tc.name testIndexGallery0053
     * @tc.desc Verify pressing matrix then transform keeps both centers inside the page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0053 begin');
      await runCase('testIndexGallery0053', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_Matrix')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_Transform')).click();
        await driver.delayMs(UI_WAIT_MS);
        const first: Point = await (await byId(driver, 'gallery_Matrix')).getBoundsCenter();
        const second: Point = await (await byId(driver, 'gallery_Transform')).getBoundsCenter();
        expect(first.y > 0).assertTrue();
        expect(second.y > 0).assertTrue();
        expect(await (await byId(driver, 'gallery_Matrix')).getText()).assertEqual('Matrix');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1054
     * @tc.name testIndexGallery0054
     * @tc.desc Verify pressing clip reset then clip keeps both labels intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0054 begin');
      await runCase('testIndexGallery0054', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_ClipReset')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_Clip')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_Clip')).getText()).assertEqual('Clip');
        expect(await (await byId(driver, 'gallery_ClipReset')).getText()).assertEqual('ClipReset');
        expect(await (await byId(driver, 'gallery_Clip')).getId()).assertEqual('gallery_Clip');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1055
     * @tc.name testIndexGallery0055
     * @tc.desc Verify pressing two path entries keeps the path candidate count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0055 begin');
      await runCase('testIndexGallery0055', async () => {
        const driver: Driver = await page();
        const count: number = (await driver.findComponents(ON.text('Path', MatchPattern.STARTS_WITH))).length;
        await (await byId(driver, 'gallery_PathArc')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_PathBezier')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect((await driver.findComponents(ON.text('Path', MatchPattern.STARTS_WITH))).length)
          .assertEqual(count);
        expect(await (await byId(driver, 'gallery_PathBezier')).getText()).assertEqual('PathBezier');
        expect(await (await byId(driver, 'gallery_PathArc')).getText()).assertEqual('PathArc');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1056
     * @tc.name testIndexGallery0056
     * @tc.desc Verify pressing the conic then relative entry keeps both clickable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0056 begin');
      await runCase('testIndexGallery0056', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PathConic')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_PathRelative')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_PathConic')).isClickable()).assertTrue();
        expect(await (await byId(driver, 'gallery_PathRelative')).isClickable()).assertTrue();
        expect(await (await byId(driver, 'gallery_PathConic')).getText()).assertEqual('PathConic');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1057
     * @tc.name testIndexGallery0057
     * @tc.desc Verify pressing the primitive then combined entry keeps both boxes positive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0057 begin');
      await runCase('testIndexGallery0057', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PathPrimitive')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_PathCombined')).click();
        await driver.delayMs(UI_WAIT_MS);
        const first: Rect = await (await byId(driver, 'gallery_PathPrimitive')).getBounds();
        const second: Rect = await (await byId(driver, 'gallery_PathCombined')).getBounds();
        expect(first.right > first.left).assertTrue();
        expect(second.right > second.left).assertTrue();
        expect(await (await byId(driver, 'gallery_PathCombined')).getText()).assertEqual('PathCombined');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1058
     * @tc.name testIndexGallery0058
     * @tc.desc Verify pressing the polygon then pen brush entry keeps both type reads at Button.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexGallery0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0058 begin');
      await runCase('testIndexGallery0058', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_PathPolygon')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_PenBrush')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_PathPolygon')).getType()).assertEqual('Button');
        expect(await (await byId(driver, 'gallery_PenBrush')).getType()).assertEqual('Button');
        expect(await (await byId(driver, 'gallery_PathPolygon')).getText()).assertEqual('PathPolygon');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0058 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1059
     * @tc.name testIndexGallery0059
     * @tc.desc Verify pressing the text blob then glyph entry keeps the canvas present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0059 begin');
      await runCase('testIndexGallery0059', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_TextBlob')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_Glyph')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_Glyph')).getText()).assertEqual('Glyph');
        expect(await (await byId(driver, 'gallery_TextBlob')).getText()).assertEqual('TextBlob');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0059 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1060
     * @tc.name testIndexGallery0060
     * @tc.desc Verify pressing the effect then matrix draw entry keeps both ids readable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexGallery0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0060 begin');
      await runCase('testIndexGallery0060', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_Effect')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'gallery_MatrixDraw')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_Effect')).getId()).assertEqual('gallery_Effect');
        expect(await (await byId(driver, 'gallery_MatrixDraw')).getId()).assertEqual('gallery_MatrixDraw');
        expect(await (await byId(driver, 'gallery_Effect')).getText()).assertEqual('Effect');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexGallery0060 end');
    });
  });
}
