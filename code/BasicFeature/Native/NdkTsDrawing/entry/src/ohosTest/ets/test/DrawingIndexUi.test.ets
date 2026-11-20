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
import { Component, Driver, ON } from '@kit.TestKit';
import { launchIndexPage, runCase, UI_WAIT_MS } from './DrawingTestRunner';

export default function drawingIndexUiTest() {
  describe('DrawingIndexUiTest', () => {
    // ==================== 启动与原有入口按钮（4 条） ====================

    /**
     * @tc.number SUB_INDEX_UI_0100
     * @tc.name testIndexUi0001
     * @tc.desc Verify the index page shows the draw rect button after launch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIndexUi0001', 0, async (done: Function) => {
      await runCase('testIndexUi0001', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        await driver.assertComponentExist(ON.text('Draw Rect'));
        const button: Component = await driver.findComponent(ON.text('Draw Rect'));
        expect(button !== null).assertTrue();
        const label: string = await button.getText();
        expect(label).assertEqual('Draw Rect');
        expect(label.length).assertEqual(9);
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_0200
     * @tc.name testIndexUi0002
     * @tc.desc Verify the index page shows the draw path button after launch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIndexUi0002', 0, async (done: Function) => {
      await runCase('testIndexUi0002', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        await driver.assertComponentExist(ON.text('Draw Path'));
        const button: Component = await driver.findComponent(ON.text('Draw Path'));
        expect(button !== null).assertTrue();
        const label: string = await button.getText();
        expect(label).assertEqual('Draw Path');
        expect(label.length).assertEqual(9);
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_0300
     * @tc.name testIndexUi0003
     * @tc.desc Verify the index page shows the draw text button after launch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIndexUi0003', 0, async (done: Function) => {
      await runCase('testIndexUi0003', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        await driver.assertComponentExist(ON.text('Draw Text'));
        const button: Component = await driver.findComponent(ON.text('Draw Text'));
        expect(button !== null).assertTrue();
        const label: string = await button.getText();
        expect(label).assertEqual('Draw Text');
        expect(label.length).assertEqual(9);
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_0400
     * @tc.name testIndexUi0004
     * @tc.desc Verify the three legacy entry buttons exist on the same page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIndexUi0004', 0, async (done: Function) => {
      await runCase('testIndexUi0004', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const rectButton: Component = await driver.findComponent(ON.text('Draw Rect'));
        const pathButton: Component = await driver.findComponent(ON.text('Draw Path'));
        const textButton: Component = await driver.findComponent(ON.text('Draw Text'));
        expect(rectButton !== null).assertTrue();
        expect(pathButton !== null).assertTrue();
        expect(textButton !== null).assertTrue();
      }, done);
    });

    // ==================== 分组入口按钮可见性（8 条） ====================

    /**
     * @tc.number SUB_INDEX_UI_0500
     * @tc.name testIndexUi0005
     * @tc.desc Verify the rect and round rect gallery buttons are shown.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIndexUi0005', 0, async (done: Function) => {
      await runCase('testIndexUi0005', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const rects: Component = await driver.findComponent(ON.text('Rects'));
        const roundRect: Component = await driver.findComponent(ON.text('RoundRect'));
        expect(rects !== null).assertTrue();
        expect(roundRect !== null).assertTrue();
        const roundRectLabel: string = await roundRect.getText();
        expect(roundRectLabel).assertEqual('RoundRect');
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_0600
     * @tc.name testIndexUi0006
     * @tc.desc Verify the circle and arc gallery buttons are shown.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0006', 0, async (done: Function) => {
      await runCase('testIndexUi0006', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const circle: Component = await driver.findComponent(ON.text('Circle'));
        const arc: Component = await driver.findComponent(ON.text('Arc'));
        expect(circle !== null).assertTrue();
        expect(arc !== null).assertTrue();
        const arcLabel: string = await arc.getText();
        expect(arcLabel).assertEqual('Arc');
        expect(arcLabel.length).assertEqual(3);
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_0700
     * @tc.name testIndexUi0007
     * @tc.desc Verify the points and color gallery buttons are shown.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0007', 0, async (done: Function) => {
      await runCase('testIndexUi0007', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const points: Component = await driver.findComponent(ON.text('Points'));
        const color: Component = await driver.findComponent(ON.text('Color'));
        expect(points !== null).assertTrue();
        expect(color !== null).assertTrue();
        const colorLabel: string = await color.getText();
        expect(colorLabel).assertEqual('Color');
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_0800
     * @tc.name testIndexUi0008
     * @tc.desc Verify the save restore and layer gallery buttons are shown.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0008', 0, async (done: Function) => {
      await runCase('testIndexUi0008', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const saveRestore: Component = await driver.findComponent(ON.text('SaveRestore'));
        const layer: Component = await driver.findComponent(ON.text('Layer'));
        expect(saveRestore !== null).assertTrue();
        expect(layer !== null).assertTrue();
        const layerLabel: string = await layer.getText();
        expect(layerLabel).assertEqual('Layer');
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_0900
     * @tc.name testIndexUi0009
     * @tc.desc Verify the transform and matrix gallery buttons are shown.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0009', 0, async (done: Function) => {
      await runCase('testIndexUi0009', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const transform: Component = await driver.findComponent(ON.text('Transform'));
        const matrix: Component = await driver.findComponent(ON.text('Matrix'));
        const matrixDraw: Component = await driver.findComponent(ON.text('MatrixDraw'));
        expect(transform !== null).assertTrue();
        expect(matrix !== null).assertTrue();
        expect(matrixDraw !== null).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_1000
     * @tc.name testIndexUi0010
     * @tc.desc Verify the clip and clip reset gallery buttons are shown.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0010', 0, async (done: Function) => {
      await runCase('testIndexUi0010', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const clip: Component = await driver.findComponent(ON.text('Clip'));
        const clipReset: Component = await driver.findComponent(ON.text('ClipReset'));
        expect(clip !== null).assertTrue();
        expect(clipReset !== null).assertTrue();
        const clipLabel: string = await clip.getText();
        expect(clipLabel).assertEqual('Clip');
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_1100
     * @tc.name testIndexUi0011
     * @tc.desc Verify the arc bezier and conic path gallery buttons are shown.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0011', 0, async (done: Function) => {
      await runCase('testIndexUi0011', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const pathArc: Component = await driver.findComponent(ON.text('PathArc'));
        const pathBezier: Component = await driver.findComponent(ON.text('PathBezier'));
        const pathConic: Component = await driver.findComponent(ON.text('PathConic'));
        expect(pathArc !== null).assertTrue();
        expect(pathBezier !== null).assertTrue();
        expect(pathConic !== null).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_1200
     * @tc.name testIndexUi0012
     * @tc.desc Verify the relative primitive combined and polygon path buttons are shown.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0012', 0, async (done: Function) => {
      await runCase('testIndexUi0012', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const relative: Component = await driver.findComponent(ON.text('PathRelative'));
        const primitive: Component = await driver.findComponent(ON.text('PathPrimitive'));
        const combined: Component = await driver.findComponent(ON.text('PathCombined'));
        const polygon: Component = await driver.findComponent(ON.text('PathPolygon'));
        expect(relative !== null).assertTrue();
        expect(primitive !== null).assertTrue();
        expect(combined !== null).assertTrue();
        expect(polygon !== null).assertTrue();
      }, done);
    });

    // ==================== 原有按钮点击交互（3 条） ====================

    /**
     * @tc.number SUB_INDEX_UI_1300
     * @tc.name testIndexUi0013
     * @tc.desc Press the draw rect button and verify the page stays responsive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIndexUi0013', 0, async (done: Function) => {
      await runCase('testIndexUi0013', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const button: Component = await driver.findComponent(ON.text('Draw Rect'));
        expect(button !== null).assertTrue();
        await button.click();
        await driver.delayMs(UI_WAIT_MS);
        await driver.assertComponentExist(ON.text('Draw Rect'));
        const again: Component = await driver.findComponent(ON.text('Draw Rect'));
        expect(again !== null).assertTrue();
        const label: string = await again.getText();
        expect(label).assertEqual('Draw Rect');
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_1400
     * @tc.name testIndexUi0014
     * @tc.desc Press the draw path button and verify the page stays responsive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIndexUi0014', 0, async (done: Function) => {
      await runCase('testIndexUi0014', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const button: Component = await driver.findComponent(ON.text('Draw Path'));
        expect(button !== null).assertTrue();
        await button.click();
        await driver.delayMs(UI_WAIT_MS);
        await driver.assertComponentExist(ON.text('Draw Path'));
        const again: Component = await driver.findComponent(ON.text('Draw Path'));
        expect(again !== null).assertTrue();
        const label: string = await again.getText();
        expect(label).assertEqual('Draw Path');
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_1500
     * @tc.name testIndexUi0015
     * @tc.desc Press the draw text button and verify the page stays responsive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIndexUi0015', 0, async (done: Function) => {
      await runCase('testIndexUi0015', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const button: Component = await driver.findComponent(ON.text('Draw Text'));
        expect(button !== null).assertTrue();
        await button.click();
        await driver.delayMs(UI_WAIT_MS);
        await driver.assertComponentExist(ON.text('Draw Text'));
        const again: Component = await driver.findComponent(ON.text('Draw Text'));
        expect(again !== null).assertTrue();
        const label: string = await again.getText();
        expect(label).assertEqual('Draw Text');
      }, done);
    });

    // ==================== 分组按钮点击交互（5 条） ====================

    /**
     * @tc.number SUB_INDEX_UI_1600
     * @tc.name testIndexUi0016
     * @tc.desc Press the rect gallery button and verify the entry stays visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIndexUi0016', 0, async (done: Function) => {
      await runCase('testIndexUi0016', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const button: Component = await driver.findComponent(ON.text('Rects'));
        expect(button !== null).assertTrue();
        await button.click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await driver.findComponent(ON.text('Rects'));
        expect(again !== null).assertTrue();
        const label: string = await again.getText();
        expect(label).assertEqual('Rects');
        expect(label.length).assertEqual(5);
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_1700
     * @tc.name testIndexUi0017
     * @tc.desc Press the bezier path gallery button and verify the entry stays visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0017', 0, async (done: Function) => {
      await runCase('testIndexUi0017', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const button: Component = await driver.findComponent(ON.text('PathBezier'));
        expect(button !== null).assertTrue();
        await button.click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await driver.findComponent(ON.text('PathBezier'));
        expect(again !== null).assertTrue();
        const label: string = await again.getText();
        expect(label).assertEqual('PathBezier');
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_1800
     * @tc.name testIndexUi0018
     * @tc.desc Press the effect gallery button and verify the page stays responsive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0018', 0, async (done: Function) => {
      await runCase('testIndexUi0018', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const button: Component = await driver.findComponent(ON.text('Effect'));
        expect(button !== null).assertTrue();
        await button.click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await driver.findComponent(ON.text('Effect'));
        expect(again !== null).assertTrue();
        const label: string = await again.getText();
        expect(label).assertEqual('Effect');
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_1900
     * @tc.name testIndexUi0019
     * @tc.desc Verify the pen brush text blob and glyph entries and press the text blob entry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0019', 0, async (done: Function) => {
      await runCase('testIndexUi0019', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const penBrush: Component = await driver.findComponent(ON.text('PenBrush'));
        const textBlob: Component = await driver.findComponent(ON.text('TextBlob'));
        const glyph: Component = await driver.findComponent(ON.text('Glyph'));
        expect(penBrush !== null).assertTrue();
        expect(textBlob !== null).assertTrue();
        expect(glyph !== null).assertTrue();
        await textBlob.click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await driver.findComponent(ON.text('TextBlob'));
        expect(again !== null).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_INDEX_UI_2000
     * @tc.name testIndexUi0020
     * @tc.desc Press the glyph and matrix draw entries and verify the matrix entry stays visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIndexUi0020', 0, async (done: Function) => {
      await runCase('testIndexUi0020', async () => {
        const driver: Driver = await launchIndexPage(UI_WAIT_MS);
        const glyph: Component = await driver.findComponent(ON.text('Glyph'));
        expect(glyph !== null).assertTrue();
        await glyph.click();
        await driver.delayMs(UI_WAIT_MS);
        const matrixDraw: Component = await driver.findComponent(ON.text('MatrixDraw'));
        expect(matrixDraw !== null).assertTrue();
        await matrixDraw.click();
        await driver.delayMs(UI_WAIT_MS);
        const again: Component = await driver.findComponent(ON.text('MatrixDraw'));
        expect(again !== null).assertTrue();
        const label: string = await again.getText();
        expect(label).assertEqual('MatrixDraw');
      }, done);
    });
  });
}
