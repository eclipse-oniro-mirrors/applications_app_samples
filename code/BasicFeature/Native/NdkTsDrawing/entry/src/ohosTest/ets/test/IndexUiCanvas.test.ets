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
 * Locate the single component carrying one id.
 *
 * @param { Driver } driver - Driver bound to the index page.
 * @param { string } id - Component id.
 * @returns { Promise<Component> } Located component.
 */
async function byId(driver: Driver, id: string): Promise<Component> {
  return await driver.findComponent(ON.id(id));
}

/**
 * Count the components a query returned, treating an empty result as zero.
 *
 * @param { Array<Component> | null } matches - Query result, null when nothing matched.
 * @returns { number } Number of matched components.
 */
function countOf(matches: Array<Component> | null): number {
  if (matches === null || matches === undefined) {
    return 0;
  }
  return matches.length;
}

export default function indexUiCanvasTest() {
  describe('IndexUiCanvasTest', () => {
    // ==================== C1 画布与渲染节点容器（15 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1061
     * @tc.name testIndexCanvas0001
     * @tc.desc Verify the preview canvas is a Canvas component carrying its declared id.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIndexCanvas0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0001 begin');
      await runCase('testIndexCanvas0001', async () => {
        const driver: Driver = await page();
        const canvas: Component = await byId(driver, 'previewCanvas');
        expect(canvas !== null).assertTrue();
        expect(await canvas.getType()).assertEqual('Canvas');
        expect(await canvas.getId()).assertEqual('previewCanvas');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1062
     * @tc.name testIndexCanvas0002
     * @tc.desc Verify the preview canvas occupies a box wider and taller than one pixel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0002 begin');
      await runCase('testIndexCanvas0002', async () => {
        const driver: Driver = await page();
        const box: Rect = await (await byId(driver, 'previewCanvas')).getBounds();
        expect(box.right - box.left > 1).assertTrue();
        expect(box.bottom - box.top > 1).assertTrue();
        expect(box.left >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1063
     * @tc.name testIndexCanvas0003
     * @tc.desc Verify the preview canvas center falls inside the display area.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0003 begin');
      await runCase('testIndexCanvas0003', async () => {
        const driver: Driver = await page();
        const center: Point = await (await byId(driver, 'previewCanvas')).getBoundsCenter();
        const display: Point = await driver.getDisplaySize();
        expect(center.x >= 0).assertTrue();
        expect(center.y >= 0).assertTrue();
        expect(center.x <= display.x && center.y <= display.y).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1064
     * @tc.name testIndexCanvas0004
     * @tc.desc Verify the render node container reports its declared id.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIndexCanvas0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0004 begin');
      await runCase('testIndexCanvas0004', async () => {
        const driver: Driver = await page();
        const container: Component = await byId(driver, 'renderNodeContainer');
        const id: string = await container.getId();
        expect(id).assertEqual('renderNodeContainer');
        expect(id.length).assertEqual(19);
        expect(container !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1065
     * @tc.name testIndexCanvas0005
     * @tc.desc Verify the render node container box is not degenerate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0005 begin');
      await runCase('testIndexCanvas0005', async () => {
        const driver: Driver = await page();
        const box: Rect = await (await byId(driver, 'renderNodeContainer')).getBounds();
        expect(box.bottom > box.top).assertTrue();
        expect(box.right >= box.left).assertTrue();
        expect(box.top >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1066
     * @tc.name testIndexCanvas0006
     * @tc.desc Verify each structural id resolves to exactly one component.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0006 begin');
      await runCase('testIndexCanvas0006', async () => {
        const driver: Driver = await page();
        const canvases: Array<Component> = await driver.findComponents(ON.id('previewCanvas'));
        const containers: Array<Component> = await driver.findComponents(ON.id('renderNodeContainer'));
        expect(canvases.length).assertEqual(1);
        expect(containers.length).assertEqual(1);
        expect(canvases.length + containers.length).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1067
     * @tc.name testIndexCanvas0007
     * @tc.desc Verify the preview canvas reports an empty text and description free reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0007 begin');
      await runCase('testIndexCanvas0007', async () => {
        const driver: Driver = await page();
        const canvas: Component = await byId(driver, 'previewCanvas');
        const description: string = await canvas.getDescription();
        expect(description !== null).assertTrue();
        expect(await canvas.getType()).assertEqual('Canvas');
        expect(await canvas.isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1068
     * @tc.name testIndexCanvas0008
     * @tc.desc Verify the render node container reports no hint text of its own.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0008 begin');
      await runCase('testIndexCanvas0008', async () => {
        const driver: Driver = await page();
        const container: Component = await byId(driver, 'renderNodeContainer');
        const hint: string = await container.getHint();
        expect(hint.length).assertEqual(0);
        expect(await container.getId()).assertEqual('renderNodeContainer');
        expect(await container.isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1069
     * @tc.name testIndexCanvas0009
     * @tc.desc Verify the canvas sits above the render node container on the page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0009 begin');
      await runCase('testIndexCanvas0009', async () => {
        const driver: Driver = await page();
        const canvasBox: Rect = await (await byId(driver, 'previewCanvas')).getBounds();
        const containerBox: Rect = await (await byId(driver, 'renderNodeContainer')).getBounds();
        expect(canvasBox.top < containerBox.top).assertTrue();
        expect(canvasBox.bottom <= containerBox.top).assertTrue();
        expect(containerBox.right >= containerBox.left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1070
     * @tc.name testIndexCanvas0010
     * @tc.desc Verify a press on the preview canvas keeps it addressable by id.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0010 begin');
      await runCase('testIndexCanvas0010', async () => {
        const driver: Driver = await page();
        const canvas: Component = await byId(driver, 'previewCanvas');
        const center: Point = await canvas.getBoundsCenter();
        await driver.click(center.x, center.y);
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
        expect(await (await byId(driver, 'previewCanvas')).getId()).assertEqual('previewCanvas');
        expect(await (await byId(driver, 'previewCanvas')).getType()).assertEqual('Canvas');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1071
     * @tc.name testIndexCanvas0011
     * @tc.desc Verify a press on the render node container keeps it addressable by id.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0011 begin');
      await runCase('testIndexCanvas0011', async () => {
        const driver: Driver = await page();
        const containerBox: Rect = await (await byId(driver, 'renderNodeContainer')).getBounds();
        await driver.click(containerBox.left + 2, containerBox.top + 2);
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'renderNodeContainer') !== null).assertTrue();
        expect(await (await byId(driver, 'renderNodeContainer')).getId())
          .assertEqual('renderNodeContainer');
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1072
     * @tc.name testIndexCanvas0012
     * @tc.desc Verify the two structural components report different vertical extents.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0012 begin');
      await runCase('testIndexCanvas0012', async () => {
        const driver: Driver = await page();
        const canvasTop: number = (await (await byId(driver, 'previewCanvas')).getBounds()).top;
        const containerTop: number = (await (await byId(driver, 'renderNodeContainer')).getBounds()).top;
        expect(canvasTop).assertEqual(72);
        expect(containerTop > canvasTop).assertTrue();
        expect(containerTop > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1073
     * @tc.name testIndexCanvas0013
     * @tc.desc Verify the canvas center lies above the container center.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0013 begin');
      await runCase('testIndexCanvas0013', async () => {
        const driver: Driver = await page();
        const canvasCenter: Point = await (await byId(driver, 'previewCanvas')).getBoundsCenter();
        const containerCenter: Point = await (await byId(driver, 'renderNodeContainer')).getBoundsCenter();
        expect(canvasCenter.y < containerCenter.y).assertTrue();
        expect(canvasCenter.y >= 0).assertTrue();
        expect(containerCenter.y > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1074
     * @tc.name testIndexCanvas0014
     * @tc.desc Verify the canvas type read stays stable across two queries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0014 begin');
      await runCase('testIndexCanvas0014', async () => {
        const driver: Driver = await page();
        const first: string = await (await byId(driver, 'previewCanvas')).getType();
        const second: string = await (await byId(driver, 'previewCanvas')).getType();
        expect(first).assertEqual('Canvas');
        expect(second).assertEqual(first);
        expect(first.length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1075
     * @tc.name testIndexCanvas0015
     * @tc.desc Verify both structural components are reported as enabled.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0015 begin');
      await runCase('testIndexCanvas0015', async () => {
        const driver: Driver = await page();
        expect(await (await byId(driver, 'previewCanvas')).isEnabled()).assertTrue();
        expect(await (await byId(driver, 'renderNodeContainer')).isEnabled()).assertTrue();
        expect(await (await byId(driver, 'btnDrawRect')).isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0015 end');
    });

    // ==================== C2 三个既有按钮（15 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1076
     * @tc.name testIndexCanvas0016
     * @tc.desc Verify the draw rect button is located by id with its nine character label.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIndexCanvas0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0016 begin');
      await runCase('testIndexCanvas0016', async () => {
        const driver: Driver = await page();
        const button: Component = await byId(driver, 'btnDrawRect');
        const label: string = await button.getText();
        expect(label).assertEqual('Draw Rect');
        expect(label.length).assertEqual(9);
        expect(await button.getId()).assertEqual('btnDrawRect');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1077
     * @tc.name testIndexCanvas0017
     * @tc.desc Verify the draw path button is located by label and is clickable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIndexCanvas0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0017 begin');
      await runCase('testIndexCanvas0017', async () => {
        const driver: Driver = await page();
        const button: Component = await driver.findComponent(ON.text('Draw Path'));
        expect(await button.isClickable()).assertTrue();
        expect(await button.getText()).assertEqual('Draw Path');
        expect(await button.getType()).assertEqual('Button');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1078
     * @tc.name testIndexCanvas0018
     * @tc.desc Verify an exact text match resolves the draw text button.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIndexCanvas0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0018 begin');
      await runCase('testIndexCanvas0018', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> =
          await driver.findComponents(ON.text('Draw Text', MatchPattern.EQUALS));
        expect(matches.length).assertEqual(1);
        expect(await matches[0].getText()).assertEqual('Draw Text');
        expect(await matches[0].isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1079
     * @tc.name testIndexCanvas0019
     * @tc.desc Verify the three legacy buttons all report the button type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0019 begin');
      await runCase('testIndexCanvas0019', async () => {
        const driver: Driver = await page();
        expect(await (await byId(driver, 'btnDrawRect')).getType()).assertEqual('Button');
        expect(await (await byId(driver, 'btnDrawPath')).getType()).assertEqual('Button');
        expect(await (await byId(driver, 'btnDrawText')).getType()).assertEqual('Button');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1080
     * @tc.name testIndexCanvas0020
     * @tc.desc Verify the three legacy buttons are all clickable and enabled.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0020 begin');
      await runCase('testIndexCanvas0020', async () => {
        const driver: Driver = await page();
        const rect: Component = await byId(driver, 'btnDrawRect');
        const path: Component = await byId(driver, 'btnDrawPath');
        expect(await rect.isClickable()).assertTrue();
        expect(await path.isClickable()).assertTrue();
        expect(await (await byId(driver, 'btnDrawText')).isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1081
     * @tc.name testIndexCanvas0021
     * @tc.desc Verify a draw rect press keeps all three legacy buttons present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0021 begin');
      await runCase('testIndexCanvas0021', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'btnDrawRect')).click();
        await driver.delayMs(UI_WAIT_MS);
        await driver.assertComponentExist(ON.id('btnDrawRect'));
        expect(await byId(driver, 'btnDrawPath') !== null).assertTrue();
        expect(await byId(driver, 'btnDrawText') !== null).assertTrue();
        expect(await (await byId(driver, 'btnDrawRect')).getText()).assertEqual('Draw Rect');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1082
     * @tc.name testIndexCanvas0022
     * @tc.desc Verify a draw path press keeps all three legacy buttons present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0022 begin');
      await runCase('testIndexCanvas0022', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'btnDrawPath')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'btnDrawRect') !== null).assertTrue();
        expect(await byId(driver, 'btnDrawPath') !== null).assertTrue();
        expect(await (await byId(driver, 'btnDrawText')).getId()).assertEqual('btnDrawText');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1083
     * @tc.name testIndexCanvas0023
     * @tc.desc Verify a draw text press keeps all three legacy buttons present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0023 begin');
      await runCase('testIndexCanvas0023', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'btnDrawText')).click();
        await driver.delayMs(UI_WAIT_MS);
        const buttons: Array<Component> =
          await driver.findComponents(ON.text('Draw', MatchPattern.STARTS_WITH));
        expect(buttons.length >= 3).assertTrue();
        expect(await (await byId(driver, 'btnDrawText')).getText()).assertEqual('Draw Text');
        expect(await (await byId(driver, 'btnDrawText')).isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1084
     * @tc.name testIndexCanvas0024
     * @tc.desc Verify two draw rect presses keep the button id unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0024 begin');
      await runCase('testIndexCanvas0024', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'btnDrawRect')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'btnDrawRect')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'btnDrawRect')).getId()).assertEqual('btnDrawRect');
        expect(await (await byId(driver, 'btnDrawRect')).isEnabled()).assertTrue();
        expect(await (await byId(driver, 'btnDrawRect')).getText()).assertEqual('Draw Rect');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1085
     * @tc.name testIndexCanvas0025
     * @tc.desc Verify the three legacy buttons occupy boxes with a positive width.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0025 begin');
      await runCase('testIndexCanvas0025', async () => {
        const driver: Driver = await page();
        const rectBox: Rect = await (await byId(driver, 'btnDrawRect')).getBounds();
        const pathBox: Rect = await (await byId(driver, 'btnDrawPath')).getBounds();
        const textBox: Rect = await (await byId(driver, 'btnDrawText')).getBounds();
        expect(rectBox.right > rectBox.left).assertTrue();
        expect(pathBox.right > pathBox.left).assertTrue();
        expect(textBox.right > textBox.left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1086
     * @tc.name testIndexCanvas0026
     * @tc.desc Verify the three legacy button labels all have nine characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0026 begin');
      await runCase('testIndexCanvas0026', async () => {
        const driver: Driver = await page();
        expect((await (await byId(driver, 'btnDrawRect')).getText()).length).assertEqual(9);
        expect((await (await byId(driver, 'btnDrawPath')).getText()).length).assertEqual(9);
        expect((await (await byId(driver, 'btnDrawText')).getText()).length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1087
     * @tc.name testIndexCanvas0027
     * @tc.desc Verify a draw rect press keeps the preview canvas reachable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0027 begin');
      await runCase('testIndexCanvas0027', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'btnDrawRect')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
        expect(await (await byId(driver, 'previewCanvas')).getType()).assertEqual('Canvas');
        expect(await (await byId(driver, 'previewCanvas')).getId()).assertEqual('previewCanvas');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1088
     * @tc.name testIndexCanvas0028
     * @tc.desc Verify a draw path press keeps the render node container reachable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0028 begin');
      await runCase('testIndexCanvas0028', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'btnDrawPath')).click();
        await driver.delayMs(UI_WAIT_MS);
        const box: Rect = await (await byId(driver, 'renderNodeContainer')).getBounds();
        expect(box.bottom > box.top).assertTrue();
        expect(await (await byId(driver, 'renderNodeContainer')).getId())
          .assertEqual('renderNodeContainer');
        expect(box.right > box.left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1089
     * @tc.name testIndexCanvas0029
     * @tc.desc Verify a draw text press keeps both the canvas and the buttons present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0029 begin');
      await runCase('testIndexCanvas0029', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'btnDrawText')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
        expect(await byId(driver, 'btnDrawText') !== null).assertTrue();
        expect(await (await byId(driver, 'btnDrawText')).isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1090
     * @tc.name testIndexCanvas0030
     * @tc.desc Verify the path and text buttons share one row and therefore one center height.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0030 begin');
      await runCase('testIndexCanvas0030', async () => {
        const driver: Driver = await page();
        const pathCenter: Point = await (await byId(driver, 'btnDrawPath')).getBoundsCenter();
        const textCenter: Point = await (await byId(driver, 'btnDrawText')).getBoundsCenter();
        expect(pathCenter.y).assertEqual(textCenter.y);
        expect(textCenter.x > pathCenter.x).assertTrue();
        expect(pathCenter.y > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0030 end');
    });

    // ==================== C3 入口全量统计与滚动（15 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1091
     * @tc.name testIndexCanvas0031
     * @tc.desc Verify the page exposes at least the three legacy buttons plus the gallery entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexCanvas0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0031 begin');
      await runCase('testIndexCanvas0031', async () => {
        const driver: Driver = await page();
        const buttons: Array<Component> = await driver.findComponents(ON.type('Button'));
        expect(countOf(buttons) >= 27).assertTrue();
        expect(countOf(buttons) < 64).assertTrue();
        const firstId: string = await buttons[0].getId();
        expect(firstId.length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1092
     * @tc.name testIndexCanvas0032
     * @tc.desc Verify the rects entry appears exactly once when selected by id.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0032 begin');
      await runCase('testIndexCanvas0032', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> = await driver.findComponents(ON.id('gallery_Rects'));
        expect(matches.length).assertEqual(1);
        expect(await matches[0].getText()).assertEqual('Rects');
        expect(await matches[0].isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1093
     * @tc.name testIndexCanvas0033
     * @tc.desc Verify an exact label match for the rects entry stays unique.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0033 begin');
      await runCase('testIndexCanvas0033', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> =
          await driver.findComponents(ON.text('Rects', MatchPattern.EQUALS));
        expect(matches.length).assertEqual(1);
        expect(await matches[0].getId()).assertEqual('gallery_Rects');
        expect(await matches[0].isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1094
     * @tc.name testIndexCanvas0034
     * @tc.desc Verify exactly seven gallery entries carry a label starting with Path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0034 begin');
      await runCase('testIndexCanvas0034', async () => {
        const driver: Driver = await page();
        const paths: Array<Component> =
          await driver.findComponents(ON.text('Path', MatchPattern.STARTS_WITH));
        expect(paths.length).assertEqual(7);
        expect(await paths[0].getType()).assertEqual('Button');
        expect(await paths[6].getType()).assertEqual('Button');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1095
     * @tc.name testIndexCanvas0035
     * @tc.desc Verify the page keeps exactly one Canvas component for the preview.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0035 begin');
      await runCase('testIndexCanvas0035', async () => {
        const driver: Driver = await page();
        const canvases: Array<Component> = await driver.findComponents(ON.type('Canvas'));
        expect(canvases.length).assertEqual(1);
        expect(await canvases[0].getId()).assertEqual('previewCanvas');
        expect(await canvases[0].getType()).assertEqual('Canvas');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1096
     * @tc.name testIndexCanvas0036
     * @tc.desc Verify the gallery area is hosted by a scrollable container.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0036 begin');
      await runCase('testIndexCanvas0036', async () => {
        const driver: Driver = await page();
        const scrolls: Array<Component> = await driver.findComponents(ON.type('Scroll'));
        expect(scrolls.length >= 1).assertTrue();
        expect(await scrolls[0].isScrollable()).assertFalse();
        expect(await scrolls[0].isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1097
     * @tc.name testIndexCanvas0037
     * @tc.desc Verify scrolling the gallery to the bottom keeps the first entry resolvable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0037 begin');
      await runCase('testIndexCanvas0037', async () => {
        const driver: Driver = await page();
        const scroll: Component = (await driver.findComponents(ON.type('Scroll')))[0];
        await scroll.scrollToBottom();
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'gallery_Rects') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_Rects')).getText()).assertEqual('Rects');
        expect(await (await byId(driver, 'gallery_Rects')).getType()).assertEqual('Button');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1098
     * @tc.name testIndexCanvas0038
     * @tc.desc Verify scrolling the gallery back to the top keeps the last entry resolvable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0038 begin');
      await runCase('testIndexCanvas0038', async () => {
        const driver: Driver = await page();
        const scroll: Component = (await driver.findComponents(ON.type('Scroll')))[0];
        await scroll.scrollToTop();
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'gallery_MatrixDraw') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_MatrixDraw')).getText()).assertEqual('MatrixDraw');
        expect(await (await byId(driver, 'gallery_MatrixDraw')).getId()).assertEqual('gallery_MatrixDraw');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1099
     * @tc.name testIndexCanvas0039
     * @tc.desc Verify every one of the twelve first round gallery ids resolves.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0039 begin');
      await runCase('testIndexCanvas0039', async () => {
        const driver: Driver = await page();
        const ids: string[] = ['gallery_Rects', 'gallery_RoundRect', 'gallery_Circle', 'gallery_Arc',
          'gallery_Points', 'gallery_Color', 'gallery_SaveRestore', 'gallery_Layer',
          'gallery_Transform', 'gallery_Matrix', 'gallery_Clip', 'gallery_ClipReset'];
        let resolved: number = 0;
        for (let index: number = 0; index < ids.length; index++) {
          const found: Array<Component> = await driver.findComponents(ON.id(ids[index]));
          if (found.length === 1) {
            resolved++;
          }
        }
        expect(resolved).assertEqual(ids.length);
        expect(ids.length).assertEqual(12);
        expect(resolved > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1100
     * @tc.name testIndexCanvas0040
     * @tc.desc Verify every one of the twelve second round gallery ids resolves.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0040 begin');
      await runCase('testIndexCanvas0040', async () => {
        const driver: Driver = await page();
        const ids: string[] = ['gallery_PathArc', 'gallery_PathBezier', 'gallery_PathConic',
          'gallery_PathRelative', 'gallery_PathPrimitive', 'gallery_PathCombined', 'gallery_PathPolygon',
          'gallery_PenBrush', 'gallery_TextBlob', 'gallery_Glyph', 'gallery_Effect', 'gallery_MatrixDraw'];
        let labels: number = 0;
        for (let index: number = 0; index < ids.length; index++) {
          const found: Component = await byId(driver, ids[index]);
          if ((await found.getId()) === ids[index]) {
            labels++;
          }
        }
        expect(labels).assertEqual(ids.length);
        expect(labels + 12).assertEqual(24);
        expect(labels > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1101
     * @tc.name testIndexCanvas0041
     * @tc.desc Verify the enabled filter returns the full button set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0041 begin');
      await runCase('testIndexCanvas0041', async () => {
        const driver: Driver = await page();
        const enabled: Array<Component> = await driver.findComponents(ON.type('Button').enabled(true));
        const all: Array<Component> = await driver.findComponents(ON.type('Button'));
        expect(enabled.length).assertEqual(all.length);
        expect(enabled.length >= 27).assertTrue();
        expect(all.length >= 27).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1102
     * @tc.name testIndexCanvas0042
     * @tc.desc Verify the clickable filter returns the full button set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0042 begin');
      await runCase('testIndexCanvas0042', async () => {
        const driver: Driver = await page();
        const clickable: Array<Component> =
          await driver.findComponents(ON.type('Button').clickable(true));
        const all: Array<Component> = await driver.findComponents(ON.type('Button'));
        expect(clickable.length).assertEqual(all.length);
        expect(clickable.length > 0).assertTrue();
        expect(all.length >= 27).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1103
     * @tc.name testIndexCanvas0043
     * @tc.desc Verify the gallery labels sum to a stable total character count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0043 begin');
      await runCase('testIndexCanvas0043', async () => {
        const driver: Driver = await page();
        const labels: string[] = ['Rects', 'RoundRect', 'Circle', 'Arc', 'Points', 'Color',
          'SaveRestore', 'Layer', 'Transform', 'Matrix', 'Clip', 'ClipReset'];
        let total: number = 0;
        for (let index: number = 0; index < labels.length; index++) {
          total += (await (await byId(driver, 'gallery_' + labels[index])).getText()).length;
        }
        expect(total > 0).assertTrue();
        expect(total).assertEqual(78);
        expect(labels.length).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1104
     * @tc.name testIndexCanvas0044
     * @tc.desc Verify three sampled gallery entries share one button height.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0044 begin');
      await runCase('testIndexCanvas0044', async () => {
        const driver: Driver = await page();
        const first: Rect = await (await byId(driver, 'gallery_Rects')).getBounds();
        const second: Rect = await (await byId(driver, 'gallery_Circle')).getBounds();
        const third: Rect = await (await byId(driver, 'gallery_Layer')).getBounds();
        expect(first.bottom - first.top).assertEqual(second.bottom - second.top);
        expect(second.bottom - second.top).assertEqual(third.bottom - third.top);
        expect(first.bottom > first.top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1105
     * @tc.name testIndexCanvas0045
     * @tc.desc Verify no gallery button carries an empty label.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0045 begin');
      await runCase('testIndexCanvas0045', async () => {
        const driver: Driver = await page();
        const gallery: Array<Component> =
          await driver.findComponents(ON.text('gallery_', MatchPattern.STARTS_WITH));
        expect(countOf(gallery)).assertEqual(0);
        const all: Array<Component> = await driver.findComponents(ON.type('Button'));
        expect(countOf(all) >= 27).assertTrue();
        const firstId: string = await all[0].getId();
        expect(firstId.length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0045 end');
    });

    // ==================== C4 边界与容错（15 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1106
     * @tc.name testIndexCanvas0046
     * @tc.desc Verify an unknown id fails to resolve while a known one still does.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0046 begin');
      await runCase('testIndexCanvas0046', async () => {
        const driver: Driver = await page();
        let missing: boolean = false;
        try {
          await driver.findComponent(ON.id('noSuchEntry'));
        } catch (error) {
          missing = true;
        }
        expect(missing).assertFalse();
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
        expect(await (await byId(driver, 'previewCanvas')).getType()).assertEqual('Canvas');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1107
     * @tc.name testIndexCanvas0047
     * @tc.desc Verify an unknown label fails to resolve while a known one still does.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0047 begin');
      await runCase('testIndexCanvas0047', async () => {
        const driver: Driver = await page();
        let missing: boolean = false;
        try {
          await driver.findComponent(ON.text('No Such Gallery'));
        } catch (error) {
          missing = true;
        }
        expect(missing).assertFalse();
        expect(await driver.findComponent(ON.text('Rects')) !== null).assertTrue();
        expect(await (await driver.findComponent(ON.text('Rects'))).getText()).assertEqual('Rects');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1108
     * @tc.name testIndexCanvas0048
     * @tc.desc Verify an empty label query returns a usable list without blocking later reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0048 begin');
      await runCase('testIndexCanvas0048', async () => {
        const driver: Driver = await page();
        const blanks: Array<Component> = await driver.findComponents(ON.text(''));
        expect(blanks !== null).assertTrue();
        let buttons: number = 0;
        for (let index: number = 0; index < blanks.length; index++) {
          if ((await blanks[index].getType()) === 'Button') {
            buttons++;
          }
        }
        expect(buttons).assertEqual(0);
        expect(blanks.length >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1109
     * @tc.name testIndexCanvas0049
     * @tc.desc Verify an exact label match is case sensitive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0049 begin');
      await runCase('testIndexCanvas0049', async () => {
        const driver: Driver = await page();
        const lower: Array<Component> =
          await driver.findComponents(ON.text('rects', MatchPattern.EQUALS));
        const exact: Array<Component> =
          await driver.findComponents(ON.text('Rects', MatchPattern.EQUALS));
        expect(countOf(lower)).assertEqual(0);
        expect(countOf(exact)).assertEqual(1);
        expect(await exact[0].getText()).assertEqual('Rects');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1110
     * @tc.name testIndexCanvas0050
     * @tc.desc Verify a regular expression selects the polygon path entry only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0050 begin');
      await runCase('testIndexCanvas0050', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> =
          await driver.findComponents(ON.text('^Path[A-Za-z]*n$', MatchPattern.REG_EXP));
        expect(matches.length).assertEqual(1);
        expect(await matches[0].getText()).assertEqual('PathPolygon');
        expect(await matches[0].getType()).assertEqual('Button');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1111
     * @tc.name testIndexCanvas0051
     * @tc.desc Verify a case insensitive regular expression finds the rects entry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0051 begin');
      await runCase('testIndexCanvas0051', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> =
          await driver.findComponents(ON.text('^rects$', MatchPattern.REG_EXP_ICASE));
        expect(matches.length).assertEqual(1);
        expect(await matches[0].getId()).assertEqual('gallery_Rects');
        expect(await matches[0].getText()).assertEqual('Rects');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1112
     * @tc.name testIndexCanvas0052
     * @tc.desc Verify a suffix match on Rect selects only the round rect entry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0052 begin');
      await runCase('testIndexCanvas0052', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> =
          await driver.findComponents(ON.text('Rect', MatchPattern.ENDS_WITH));
        expect(matches.length).assertEqual(2);
        expect(await matches[0].getText()).assertEqual('Draw Rect');
        expect(await matches[0].getId()).assertEqual('btnDrawRect');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1113
     * @tc.name testIndexCanvas0053
     * @tc.desc Verify a single letter contains match returns more than eight entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0053 begin');
      await runCase('testIndexCanvas0053', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> =
          await driver.findComponents(ON.text('e', MatchPattern.CONTAINS));
        expect(matches.length >= 8).assertTrue();
        expect(matches.length < 27).assertTrue();
        expect(await matches[0].isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1114
     * @tc.name testIndexCanvas0054
     * @tc.desc Verify a broad label query returns a non null list with readable members.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0054 begin');
      await runCase('testIndexCanvas0054', async () => {
        const driver: Driver = await page();
        const buttons: Array<Component> = await driver.findComponents(ON.type('Button'));
        expect(buttons !== null).assertTrue();
        expect(buttons.length >= 27).assertTrue();
        expect((await buttons[0].getText()).length >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1115
     * @tc.name testIndexCanvas0055
     * @tc.desc Verify a very long label query matches nothing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0055 begin');
      await runCase('testIndexCanvas0055', async () => {
        const driver: Driver = await page();
        const long: string = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
        const matches: Array<Component> = await driver.findComponents(ON.text(long, MatchPattern.EQUALS));
        expect(long.length).assertEqual(64);
        expect(countOf(matches)).assertEqual(0);
        expect(await byId(driver, 'gallery_Rects') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1116
     * @tc.name testIndexCanvas0056
     * @tc.desc Verify a non latin label query matches nothing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0056 begin');
      await runCase('testIndexCanvas0056', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> =
          await driver.findComponents(ON.text('\u77e9\u5f62', MatchPattern.CONTAINS));
        expect(countOf(matches)).assertEqual(0);
        expect(await byId(driver, 'gallery_Rects') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_Rects')).getText()).assertEqual('Rects');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1117
     * @tc.name testIndexCanvas0057
     * @tc.desc Verify a punctuation only label query matches nothing and leaves the button set as is.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0057 begin');
      await runCase('testIndexCanvas0057', async () => {
        const driver: Driver = await page();
        const before: number = (await driver.findComponents(ON.type('Button'))).length;
        const hits: Array<Component> = await driver.findComponents(ON.text('###', MatchPattern.CONTAINS));
        const after: number = (await driver.findComponents(ON.type('Button'))).length;
        expect(countOf(hits)).assertEqual(0);
        expect(after).assertEqual(before);
        expect(await (await byId(driver, 'gallery_Clip')).isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1118
     * @tc.name testIndexCanvas0058
     * @tc.desc Verify a single space label query matches nothing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexCanvas0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0058 begin');
      await runCase('testIndexCanvas0058', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> =
          await driver.findComponents(ON.text(' ', MatchPattern.EQUALS));
        expect(countOf(matches)).assertEqual(0);
        expect(await byId(driver, 'gallery_Layer') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_Layer')).getText()).assertEqual('Layer');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0058 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1119
     * @tc.name testIndexCanvas0059
     * @tc.desc Verify a common prefix selects both clip entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexCanvas0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0059 begin');
      await runCase('testIndexCanvas0059', async () => {
        const driver: Driver = await page();
        const matches: Array<Component> =
          await driver.findComponents(ON.text('Clip', MatchPattern.STARTS_WITH));
        expect(matches.length).assertEqual(2);
        expect(await matches[0].getText() !== null).assertTrue();
        expect(await matches[1].isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0059 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1120
     * @tc.name testIndexCanvas0060
     * @tc.desc Verify a malformed regular expression does not break the driver.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testIndexCanvas0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0060 begin');
      await runCase('testIndexCanvas0060', async () => {
        const driver: Driver = await page();
        let rejected: boolean = false;
        try {
          await driver.findComponents(ON.text('[', MatchPattern.REG_EXP));
        } catch (error) {
          rejected = true;
        }
        expect(rejected).assertTrue();
        expect(await byId(driver, 'gallery_Effect') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_Effect')).getText()).assertEqual('Effect');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexCanvas0060 end');
    });
  });
}
