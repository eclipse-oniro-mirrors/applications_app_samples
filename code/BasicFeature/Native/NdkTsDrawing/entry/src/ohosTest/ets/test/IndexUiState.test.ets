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
import { Component, Driver, ON, Point, Rect } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DRAWING_TAG, launchIndexPage, runCase, UI_WAIT_MS } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const GALLERY_IDS: string[] = ['gallery_Rects', 'gallery_RoundRect', 'gallery_Circle', 'gallery_Arc',
  'gallery_Points', 'gallery_Color', 'gallery_SaveRestore', 'gallery_Layer', 'gallery_Transform',
  'gallery_Matrix', 'gallery_Clip', 'gallery_ClipReset', 'gallery_PathArc', 'gallery_PathBezier',
  'gallery_PathConic', 'gallery_PathRelative', 'gallery_PathPrimitive', 'gallery_PathCombined',
  'gallery_PathPolygon', 'gallery_PenBrush', 'gallery_TextBlob', 'gallery_Glyph', 'gallery_Effect',
  'gallery_MatrixDraw'];

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

/**
 * Press one gallery entry a number of times, re-resolving it before each press.
 *
 * @param { Driver } driver - Driver bound to the index page.
 * @param { string } id - Component id.
 * @param { number } rounds - Number of presses.
 */
async function press(driver: Driver, id: string, rounds: number): Promise<void> {
  for (let round: number = 0; round < rounds; round++) {
    await (await byId(driver, id)).click();
    await driver.delayMs(UI_WAIT_MS);
  }
}

export default function indexUiStateTest() {
  describe('IndexUiStateTest', () => {
    // ==================== S1 同一入口连续点击（14 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1121
     * @tc.name testIndexState0001
     * @tc.desc Verify three presses of the rects entry keep the entry intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testIndexState0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0001 begin');
      await runCase('testIndexState0001', async () => {
        const driver: Driver = await page();
        await press(driver, 'gallery_Rects', 3);
        expect(await byId(driver, 'gallery_Rects') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_Rects')).getId()).assertEqual('gallery_Rects');
        expect(await (await byId(driver, 'gallery_Rects')).getText()).assertEqual('Rects');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1122
     * @tc.name testIndexState0002
     * @tc.desc Verify four presses of the round rect entry keep the label unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0002 begin');
      await runCase('testIndexState0002', async () => {
        const driver: Driver = await page();
        const before: string = await (await byId(driver, 'gallery_RoundRect')).getText();
        await press(driver, 'gallery_RoundRect', 4);
        expect(await (await byId(driver, 'gallery_RoundRect')).getText()).assertEqual(before);
        expect(before).assertEqual('RoundRect');
        expect(await (await byId(driver, 'gallery_RoundRect')).isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1123
     * @tc.name testIndexState0003
     * @tc.desc Verify two presses of the circle entry leave its box untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0003 begin');
      await runCase('testIndexState0003', async () => {
        const driver: Driver = await page();
        const before: Rect = await (await byId(driver, 'gallery_Circle')).getBounds();
        await press(driver, 'gallery_Circle', 2);
        const after: Rect = await (await byId(driver, 'gallery_Circle')).getBounds();
        expect(after.top).assertEqual(before.top);
        expect(after.left).assertEqual(before.left);
        expect(await (await byId(driver, 'gallery_Circle')).isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1124
     * @tc.name testIndexState0004
     * @tc.desc Verify five presses of the arc entry do not change the button count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0004 begin');
      await runCase('testIndexState0004', async () => {
        const driver: Driver = await page();
        const before: number = (await driver.findComponents(ON.type('Button'))).length;
        await press(driver, 'gallery_Arc', 5);
        const after: number = (await driver.findComponents(ON.type('Button'))).length;
        expect(after).assertEqual(before);
        expect(before >= 27).assertTrue();
        expect(await (await byId(driver, 'gallery_Arc')).getText()).assertEqual('Arc');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1125
     * @tc.name testIndexState0005
     * @tc.desc Verify two presses of the points entry keep the preview canvas alive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0005 begin');
      await runCase('testIndexState0005', async () => {
        const driver: Driver = await page();
        await press(driver, 'gallery_Points', 2);
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
        expect(await (await byId(driver, 'previewCanvas')).getType()).assertEqual('Canvas');
        expect(await (await byId(driver, 'gallery_Points')).getId()).assertEqual('gallery_Points');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1126
     * @tc.name testIndexState0006
     * @tc.desc Verify three presses of the color entry keep it clickable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0006 begin');
      await runCase('testIndexState0006', async () => {
        const driver: Driver = await page();
        await press(driver, 'gallery_Color', 3);
        expect(await (await byId(driver, 'gallery_Color')).isClickable()).assertTrue();
        expect(await (await byId(driver, 'gallery_Color')).getText()).assertEqual('Color');
        expect(await (await byId(driver, 'gallery_Color')).getId()).assertEqual('gallery_Color');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1127
     * @tc.name testIndexState0007
     * @tc.desc Verify two presses of the save restore entry keep its id readable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0007 begin');
      await runCase('testIndexState0007', async () => {
        const driver: Driver = await page();
        await press(driver, 'gallery_SaveRestore', 2);
        expect(await (await byId(driver, 'gallery_SaveRestore')).getId())
          .assertEqual('gallery_SaveRestore');
        expect(await (await byId(driver, 'gallery_SaveRestore')).getText()).assertEqual('SaveRestore');
        expect(await byId(driver, 'renderNodeContainer') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1128
     * @tc.name testIndexState0008
     * @tc.desc Verify three presses of the layer entry keep its reported type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0008 begin');
      await runCase('testIndexState0008', async () => {
        const driver: Driver = await page();
        await press(driver, 'gallery_Layer', 3);
        expect(await (await byId(driver, 'gallery_Layer')).getType()).assertEqual('Button');
        expect(await (await byId(driver, 'gallery_Layer')).getText()).assertEqual('Layer');
        expect(await (await byId(driver, 'gallery_Layer')).isLongClickable()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1129
     * @tc.name testIndexState0009
     * @tc.desc Verify two presses of the transform entry keep its center fixed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0009 begin');
      await runCase('testIndexState0009', async () => {
        const driver: Driver = await page();
        const before: Point = await (await byId(driver, 'gallery_Transform')).getBoundsCenter();
        await press(driver, 'gallery_Transform', 2);
        const after: Point = await (await byId(driver, 'gallery_Transform')).getBoundsCenter();
        expect(after.x).assertEqual(before.x);
        expect(after.y).assertEqual(before.y);
        expect(await (await byId(driver, 'gallery_Transform')).getText()).assertEqual('Transform');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1130
     * @tc.name testIndexState0010
     * @tc.desc Verify three presses of the matrix entry keep the matrix pair resolvable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0010 begin');
      await runCase('testIndexState0010', async () => {
        const driver: Driver = await page();
        await press(driver, 'gallery_Matrix', 3);
        expect(await (await byId(driver, 'gallery_Matrix')).getText()).assertEqual('Matrix');
        expect(await byId(driver, 'gallery_MatrixDraw') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_MatrixDraw')).getText()).assertEqual('MatrixDraw');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1131
     * @tc.name testIndexState0011
     * @tc.desc Verify two presses of the clip entry keep a four character label.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0011 begin');
      await runCase('testIndexState0011', async () => {
        const driver: Driver = await page();
        await press(driver, 'gallery_Clip', 2);
        const label: string = await (await byId(driver, 'gallery_Clip')).getText();
        expect(label).assertEqual('Clip');
        expect(label.length).assertEqual(4);
        expect(await (await byId(driver, 'gallery_Clip')).isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1132
     * @tc.name testIndexState0012
     * @tc.desc Verify three presses of the clip reset entry keep it enabled.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0012 begin');
      await runCase('testIndexState0012', async () => {
        const driver: Driver = await page();
        await press(driver, 'gallery_ClipReset', 3);
        expect(await (await byId(driver, 'gallery_ClipReset')).isEnabled()).assertTrue();
        expect(await (await byId(driver, 'gallery_ClipReset')).getText()).assertEqual('ClipReset');
        expect(await (await byId(driver, 'gallery_ClipReset')).getId()).assertEqual('gallery_ClipReset');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1133
     * @tc.name testIndexState0013
     * @tc.desc Verify two presses of the path arc entry keep a non negative left edge.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0013 begin');
      await runCase('testIndexState0013', async () => {
        const driver: Driver = await page();
        await press(driver, 'gallery_PathArc', 2);
        const box: Rect = await (await byId(driver, 'gallery_PathArc')).getBounds();
        expect(box.left >= 0).assertTrue();
        expect(box.right > box.left).assertTrue();
        expect(await (await byId(driver, 'gallery_PathArc')).getText()).assertEqual('PathArc');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1134
     * @tc.name testIndexState0014
     * @tc.desc Verify two presses of the polygon entry keep its eleven character label.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0014 begin');
      await runCase('testIndexState0014', async () => {
        const driver: Driver = await page();
        await press(driver, 'gallery_PathPolygon', 2);
        const label: string = await (await byId(driver, 'gallery_PathPolygon')).getText();
        expect(label.length).assertEqual(11);
        expect(label).assertEqual('PathPolygon');
        expect(await (await byId(driver, 'gallery_PathPolygon')).isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0014 end');
    });

    // ==================== S2 两个入口交替点击（14 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1135
     * @tc.name testIndexState0015
     * @tc.desc Verify three alternating rounds between rects and clip keep both entries present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0015 begin');
      await runCase('testIndexState0015', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 3; round++) {
          await (await byId(driver, 'gallery_Rects')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_Clip')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect(await (await byId(driver, 'gallery_Rects')).getText()).assertEqual('Rects');
        expect(await (await byId(driver, 'gallery_Clip')).getText()).assertEqual('Clip');
        expect(await byId(driver, 'gallery_ClipReset') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1136
     * @tc.name testIndexState0016
     * @tc.desc Verify two alternating rounds between circle and arc keep both boxes stable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0016 begin');
      await runCase('testIndexState0016', async () => {
        const driver: Driver = await page();
        const circleBox: Rect = await (await byId(driver, 'gallery_Circle')).getBounds();
        const arcBox: Rect = await (await byId(driver, 'gallery_Arc')).getBounds();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'gallery_Circle')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_Arc')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect((await (await byId(driver, 'gallery_Circle')).getBounds()).left)
          .assertEqual(circleBox.left);
        expect((await (await byId(driver, 'gallery_Arc')).getBounds()).left).assertEqual(arcBox.left);
        expect(await (await byId(driver, 'gallery_Arc')).isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1137
     * @tc.name testIndexState0017
     * @tc.desc Verify two alternating rounds between points and color keep the canvas alive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0017 begin');
      await runCase('testIndexState0017', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'gallery_Points')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_Color')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_Points')).getText()).assertEqual('Points');
        expect(await (await byId(driver, 'gallery_Color')).getText()).assertEqual('Color');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1138
     * @tc.name testIndexState0018
     * @tc.desc Verify two alternating rounds between layer and save restore keep both ids.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0018 begin');
      await runCase('testIndexState0018', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'gallery_Layer')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_SaveRestore')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect(await (await byId(driver, 'gallery_Layer')).getId()).assertEqual('gallery_Layer');
        expect(await (await byId(driver, 'gallery_SaveRestore')).getId())
          .assertEqual('gallery_SaveRestore');
        expect(await (await byId(driver, 'gallery_SaveRestore')).isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1139
     * @tc.name testIndexState0019
     * @tc.desc Verify two alternating rounds between matrix and transform keep both centers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0019 begin');
      await runCase('testIndexState0019', async () => {
        const driver: Driver = await page();
        const matrixCenter: Point = await (await byId(driver, 'gallery_Matrix')).getBoundsCenter();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'gallery_Matrix')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_Transform')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect((await (await byId(driver, 'gallery_Matrix')).getBoundsCenter()).x)
          .assertEqual(matrixCenter.x);
        expect(await (await byId(driver, 'gallery_Transform')).getText()).assertEqual('Transform');
        expect(await (await byId(driver, 'gallery_Matrix')).isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1140
     * @tc.name testIndexState0020
     * @tc.desc Verify two alternating rounds between clip reset and clip keep both labels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0020 begin');
      await runCase('testIndexState0020', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'gallery_ClipReset')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_Clip')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect((await (await byId(driver, 'gallery_ClipReset')).getText()).length).assertEqual(9);
        expect(await (await byId(driver, 'gallery_Clip')).getText()).assertEqual('Clip');
        expect(await (await byId(driver, 'gallery_ClipReset')).isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1141
     * @tc.name testIndexState0021
     * @tc.desc Verify two alternating rounds between two path entries keep both labels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0021 begin');
      await runCase('testIndexState0021', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'gallery_PathArc')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_PathPolygon')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect(await (await byId(driver, 'gallery_PathArc')).getText()).assertEqual('PathArc');
        expect(await (await byId(driver, 'gallery_PathPolygon')).getText()).assertEqual('PathPolygon');
        expect(await (await byId(driver, 'gallery_PathBezier')).getText()).assertEqual('PathBezier');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1142
     * @tc.name testIndexState0022
     * @tc.desc Verify two alternating rounds between bezier and conic keep both clickable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0022 begin');
      await runCase('testIndexState0022', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'gallery_PathBezier')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_PathConic')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect(await (await byId(driver, 'gallery_PathBezier')).isClickable()).assertTrue();
        expect(await (await byId(driver, 'gallery_PathConic')).isClickable()).assertTrue();
        expect(await (await byId(driver, 'gallery_PathConic')).getText()).assertEqual('PathConic');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1143
     * @tc.name testIndexState0023
     * @tc.desc Verify two alternating rounds between pen brush and text blob keep both types.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0023 begin');
      await runCase('testIndexState0023', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'gallery_PenBrush')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_TextBlob')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect(await (await byId(driver, 'gallery_PenBrush')).getType()).assertEqual('Button');
        expect(await (await byId(driver, 'gallery_TextBlob')).getType()).assertEqual('Button');
        expect(await (await byId(driver, 'gallery_TextBlob')).getText()).assertEqual('TextBlob');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1144
     * @tc.name testIndexState0024
     * @tc.desc Verify two alternating rounds between glyph and effect keep both boxes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0024 begin');
      await runCase('testIndexState0024', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'gallery_Glyph')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_Effect')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        const glyphBox: Rect = await (await byId(driver, 'gallery_Glyph')).getBounds();
        const effectBox: Rect = await (await byId(driver, 'gallery_Effect')).getBounds();
        expect(glyphBox.bottom > glyphBox.top).assertTrue();
        expect(effectBox.bottom > effectBox.top).assertTrue();
        expect(await (await byId(driver, 'gallery_Effect')).isLongClickable()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1145
     * @tc.name testIndexState0025
     * @tc.desc Verify two alternating rounds between effect and matrix draw keep both labels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0025 begin');
      await runCase('testIndexState0025', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'gallery_Effect')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'gallery_MatrixDraw')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect(await (await byId(driver, 'gallery_Effect')).getText()).assertEqual('Effect');
        expect(await (await byId(driver, 'gallery_MatrixDraw')).getText()).assertEqual('MatrixDraw');
        expect(await (await byId(driver, 'gallery_MatrixDraw')).getId()).assertEqual('gallery_MatrixDraw');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1146
     * @tc.name testIndexState0026
     * @tc.desc Verify a while loop of two alternating rounds between the rect and path buttons keeps both ids.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0026 begin');
      await runCase('testIndexState0026', async () => {
        const driver: Driver = await page();
        let round: number = 0;
        while (round < 2) {
          await (await byId(driver, 'btnDrawRect')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'btnDrawPath')).click();
          await driver.delayMs(UI_WAIT_MS);
          round++;
        }
        expect(await (await byId(driver, 'btnDrawRect')).getId()).assertEqual('btnDrawRect');
        expect(await (await byId(driver, 'btnDrawPath')).getId()).assertEqual('btnDrawPath');
        expect(round).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1147
     * @tc.name testIndexState0027
     * @tc.desc Verify two alternating rounds between the path and text buttons keep both ids.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0027 begin');
      await runCase('testIndexState0027', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'btnDrawPath')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'btnDrawText')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect(await (await byId(driver, 'btnDrawPath')).getId()).assertEqual('btnDrawPath');
        expect(await (await byId(driver, 'btnDrawText')).getId()).assertEqual('btnDrawText');
        expect(await (await byId(driver, 'previewCanvas')).getType()).assertEqual('Canvas');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1148
     * @tc.name testIndexState0028
     * @tc.desc Verify two alternating rounds between the rect and text buttons keep both labels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0028 begin');
      await runCase('testIndexState0028', async () => {
        const driver: Driver = await page();
        for (let round: number = 0; round < 2; round++) {
          await (await byId(driver, 'btnDrawRect')).click();
          await driver.delayMs(UI_WAIT_MS);
          await (await byId(driver, 'btnDrawText')).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect(await (await byId(driver, 'btnDrawRect')).getText()).assertEqual('Draw Rect');
        expect(await (await byId(driver, 'btnDrawText')).getText()).assertEqual('Draw Text');
        expect(await (await byId(driver, 'renderNodeContainer')).isEnabled()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0028 end');
    });

    // ==================== S3 入口分块遍历（13 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1149
     * @tc.name testIndexState0029
     * @tc.desc Verify the first six gallery entries survive one press each.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0029 begin');
      await runCase('testIndexState0029', async () => {
        const driver: Driver = await page();
        for (let index: number = 0; index < 6; index++) {
          await press(driver, GALLERY_IDS[index], 1);
        }
        expect(await (await byId(driver, 'gallery_Rects')).getText()).assertEqual('Rects');
        expect(await byId(driver, 'gallery_Color') !== null).assertTrue();
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1150
     * @tc.name testIndexState0030
     * @tc.desc Verify the second block of six gallery entries survives one press each.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0030 begin');
      await runCase('testIndexState0030', async () => {
        const driver: Driver = await page();
        for (let index: number = 6; index < 12; index++) {
          const entry: Component = await byId(driver, GALLERY_IDS[index]);
          await entry.click();
          await driver.delayMs(UI_WAIT_MS);
        }
        expect(await (await byId(driver, 'gallery_Layer')).getText()).assertEqual('Layer');
        expect(await (await byId(driver, 'gallery_ClipReset')).getText()).assertEqual('ClipReset');
        expect(await byId(driver, 'renderNodeContainer') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1151
     * @tc.name testIndexState0031
     * @tc.desc Verify the third block of six gallery entries remains resolvable after presses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0031 begin');
      await runCase('testIndexState0031', async () => {
        const driver: Driver = await page();
        for (let index: number = 12; index < 18; index++) {
          await (await byId(driver, GALLERY_IDS[index])).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        const found: Array<Component> = await driver.findComponents(ON.id('gallery_PathCombined'));
        expect(found.length).assertEqual(1);
        expect(await (await byId(driver, 'gallery_PathArc')).getText()).assertEqual('PathArc');
        expect(await (await byId(driver, 'gallery_PathConic')).getText()).assertEqual('PathConic');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1152
     * @tc.name testIndexState0032
     * @tc.desc Verify the last block of six gallery entries remains resolvable after presses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0032 begin');
      await runCase('testIndexState0032', async () => {
        const driver: Driver = await page();
        let cursor: number = 18;
        while (cursor < 24) {
          await (await byId(driver, GALLERY_IDS[cursor])).click();
          await driver.delayMs(UI_WAIT_MS);
          cursor++;
        }
        expect(cursor).assertEqual(24);
        expect(await (await byId(driver, 'gallery_PenBrush')).getText()).assertEqual('PenBrush');
        expect(await (await byId(driver, 'gallery_MatrixDraw')).getText()).assertEqual('MatrixDraw');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1153
     * @tc.name testIndexState0033
     * @tc.desc Verify all twenty four gallery ids round trip through the component id read.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0033 begin');
      await runCase('testIndexState0033', async () => {
        const driver: Driver = await page();
        let matched: number = 0;
        for (let index: number = 0; index < GALLERY_IDS.length; index++) {
          if ((await (await byId(driver, GALLERY_IDS[index])).getId()) === GALLERY_IDS[index]) {
            matched++;
          }
        }
        expect(matched).assertEqual(24);
        expect(GALLERY_IDS.length).assertEqual(24);
        expect(GALLERY_IDS.indexOf('gallery_MatrixDraw')).assertEqual(23);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1154
     * @tc.name testIndexState0034
     * @tc.desc Verify all twenty four gallery labels are non empty strings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0034 begin');
      await runCase('testIndexState0034', async () => {
        const driver: Driver = await page();
        let totalChars: number = 0;
        for (let index: number = 0; index < GALLERY_IDS.length; index++) {
          totalChars += (await (await byId(driver, GALLERY_IDS[index])).getText()).length;
        }
        expect(totalChars > 150).assertTrue();
        expect(totalChars < 400).assertTrue();
        expect(totalChars > GALLERY_IDS.length).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1155
     * @tc.name testIndexState0035
     * @tc.desc Verify all twenty four gallery entries report themselves as clickable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0035 begin');
      await runCase('testIndexState0035', async () => {
        const driver: Driver = await page();
        let clickableCount: number = 0;
        for (let index: number = 0; index < GALLERY_IDS.length; index++) {
          if (await (await byId(driver, GALLERY_IDS[index])).isClickable()) {
            clickableCount++;
          }
        }
        expect(clickableCount).assertEqual(24);
        expect(clickableCount > 0).assertTrue();
        expect(GALLERY_IDS.length).assertEqual(24);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1156
     * @tc.name testIndexState0036
     * @tc.desc Verify all twenty four gallery entries report themselves as enabled.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0036 begin');
      await runCase('testIndexState0036', async () => {
        const driver: Driver = await page();
        let enabledCount: number = 0;
        for (let index: number = 0; index < GALLERY_IDS.length; index++) {
          if (await (await byId(driver, GALLERY_IDS[index])).isEnabled()) {
            enabledCount++;
          }
        }
        expect(enabledCount).assertEqual(24);
        expect(enabledCount + 3).assertEqual(27);
        expect(enabledCount > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1157
     * @tc.name testIndexState0037
     * @tc.desc Verify all twenty four gallery entries report the button type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0037 begin');
      await runCase('testIndexState0037', async () => {
        const driver: Driver = await page();
        let buttonTypes: number = 0;
        for (let index: number = 0; index < GALLERY_IDS.length; index++) {
          if ((await (await byId(driver, GALLERY_IDS[index])).getType()) === 'Button') {
            buttonTypes++;
          }
        }
        expect(buttonTypes).assertEqual(24);
        expect(buttonTypes > 20).assertTrue();
        expect(buttonTypes).assertEqual(GALLERY_IDS.length);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1158
     * @tc.name testIndexState0038
     * @tc.desc Verify every gallery entry has a box wider than one pixel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0038 begin');
      await runCase('testIndexState0038', async () => {
        const driver: Driver = await page();
        let narrowest: number = 100000;
        for (let index: number = 0; index < GALLERY_IDS.length; index++) {
          const box: Rect = await (await byId(driver, GALLERY_IDS[index])).getBounds();
          if (box.right - box.left < narrowest) {
            narrowest = box.right - box.left;
          }
        }
        expect(narrowest > 1).assertTrue();
        expect(narrowest < 100000).assertTrue();
        expect(narrowest > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1159
     * @tc.name testIndexState0039
     * @tc.desc Verify every gallery entry has a center below the top edge of the screen.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0039 begin');
      await runCase('testIndexState0039', async () => {
        const driver: Driver = await page();
        let highest: number = 100000;
        for (let index: number = 0; index < GALLERY_IDS.length; index++) {
          const center: Point = await (await byId(driver, GALLERY_IDS[index])).getBoundsCenter();
          if (center.y < highest) {
            highest = center.y;
          }
        }
        expect(highest > 0).assertTrue();
        expect(highest < 100000).assertTrue();
        expect(highest < 2000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1160
     * @tc.name testIndexState0040
     * @tc.desc Verify pressing the first twelve entries does not add or remove buttons.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0040 begin');
      await runCase('testIndexState0040', async () => {
        const driver: Driver = await page();
        const baseline: number = (await driver.findComponents(ON.type('Button'))).length;
        for (let index: number = 0; index < 12; index++) {
          await (await byId(driver, GALLERY_IDS[index])).click();
          await driver.delayMs(UI_WAIT_MS);
        }
        const current: number = (await driver.findComponents(ON.type('Button'))).length;
        expect(current).assertEqual(baseline);
        expect(baseline >= 27).assertTrue();
        expect(current > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1161
     * @tc.name testIndexState0041
     * @tc.desc Verify pressing all entries keeps the preview canvas reachable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0041 begin');
      await runCase('testIndexState0041', async () => {
        const driver: Driver = await page();
        for (let index: number = 0; index < GALLERY_IDS.length; index++) {
          await (await byId(driver, GALLERY_IDS[index])).click();
        }
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
        expect(await (await byId(driver, 'previewCanvas')).getType()).assertEqual('Canvas');
        expect(await (await byId(driver, 'gallery_MatrixDraw')).getText()).assertEqual('MatrixDraw');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0041 end');
    });

    // ==================== S4 页面反复启动稳定性（13 例） ====================

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1162
     * @tc.name testIndexState0042
     * @tc.desc Verify two consecutive launches expose the same number of buttons.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0042 begin');
      await runCase('testIndexState0042', async () => {
        const first: Driver = await page();
        const firstCount: number = (await first.findComponents(ON.type('Button'))).length;
        const second: Driver = await page();
        const secondCount: number = (await second.findComponents(ON.type('Button'))).length;
        expect(firstCount).assertEqual(secondCount);
        expect(firstCount >= 27).assertTrue();
        expect(secondCount > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1163
     * @tc.name testIndexState0043
     * @tc.desc Verify two consecutive launches report the same canvas type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0043 begin');
      await runCase('testIndexState0043', async () => {
        const first: Driver = await page();
        const firstType: string = await (await byId(first, 'previewCanvas')).getType();
        const second: Driver = await page();
        const secondType: string = await (await byId(second, 'previewCanvas')).getType();
        expect(firstType).assertEqual(secondType);
        expect(secondType).assertEqual('Canvas');
        expect(firstType).assertEqual('Canvas');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1164
     * @tc.name testIndexState0044
     * @tc.desc Verify two consecutive launches keep the three legacy button ids.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0044 begin');
      await runCase('testIndexState0044', async () => {
        const driver: Driver = await page();
        const rectId: string = await (await byId(driver, 'btnDrawRect')).getId();
        await page();
        expect(rectId).assertEqual('btnDrawRect');
        expect(await (await byId(driver, 'btnDrawRect')).getId()).assertEqual(rectId);
        expect(await (await byId(driver, 'btnDrawText')).getId()).assertEqual('btnDrawText');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1165
     * @tc.name testIndexState0045
     * @tc.desc Verify three consecutive canvas queries all succeed on one page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0045 begin');
      await runCase('testIndexState0045', async () => {
        const driver: Driver = await page();
        let hits: number = 0;
        for (let attempt: number = 0; attempt < 3; attempt++) {
          const canvas: Array<Component> = await driver.findComponents(ON.id('previewCanvas'));
          if (canvas.length === 1) {
            hits++;
          }
        }
        expect(hits).assertEqual(3);
        expect(hits > 0).assertTrue();
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1166
     * @tc.name testIndexState0046
     * @tc.desc Verify two consecutive launches keep the rects label identical.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0046 begin');
      await runCase('testIndexState0046', async () => {
        const driver: Driver = await page();
        const firstLabel: string = await (await byId(driver, 'gallery_Rects')).getText();
        const again: Driver = await page();
        const secondLabel: string = await (await byId(again, 'gallery_Rects')).getText();
        expect(secondLabel).assertEqual(firstLabel);
        expect(firstLabel.length).assertEqual(5);
        expect(secondLabel).assertEqual('Rects');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1167
     * @tc.name testIndexState0047
     * @tc.desc Verify the gallery scroll container resolves and the last entry stays a button after scrolling.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0047 begin');
      await runCase('testIndexState0047', async () => {
        const driver: Driver = await page();
        const scrolls: Array<Component> = await driver.findComponents(ON.type('Scroll'));
        expect(countOf(scrolls) >= 1).assertTrue();
        await scrolls[0].scrollToBottom();
        await driver.delayMs(UI_WAIT_MS);
        const last: Component = await byId(driver, 'gallery_MatrixDraw');
        const lastType: string = await last.getType();
        const lastId: string = await last.getId();
        const lastText: string = await last.getText();
        expect(lastType).assertEqual('Button');
        expect(lastId).assertEqual('gallery_MatrixDraw');
        expect(lastText).assertEqual('MatrixDraw');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1168
     * @tc.name testIndexState0048
     * @tc.desc Verify the display size stays stable across two launches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0048 begin');
      await runCase('testIndexState0048', async () => {
        const first: Driver = await page();
        const firstSize: Point = await first.getDisplaySize();
        const second: Driver = await page();
        const secondSize: Point = await second.getDisplaySize();
        expect(secondSize.x).assertEqual(firstSize.x);
        expect(secondSize.y).assertEqual(firstSize.y);
        expect(firstSize.x > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1169
     * @tc.name testIndexState0049
     * @tc.desc Verify the canvas stays above the container across two launches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0049 begin');
      await runCase('testIndexState0049', async () => {
        const first: Driver = await page();
        const firstCanvasTop: number = (await (await byId(first, 'previewCanvas')).getBounds()).top;
        const firstBoxTop: number =
          (await (await byId(first, 'renderNodeContainer')).getBounds()).top;
        const second: Driver = await page();
        const secondCanvasTop: number = (await (await byId(second, 'previewCanvas')).getBounds()).top;
        const secondBoxTop: number =
          (await (await byId(second, 'renderNodeContainer')).getBounds()).top;
        expect(firstCanvasTop < firstBoxTop).assertTrue();
        expect(secondCanvasTop < secondBoxTop).assertTrue();
        expect(secondCanvasTop).assertEqual(firstCanvasTop);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1170
     * @tc.name testIndexState0050
     * @tc.desc Verify the gallery stays scrollable after a press on the canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0050 begin');
      await runCase('testIndexState0050', async () => {
        const driver: Driver = await page();
        const center: Point = await (await byId(driver, 'previewCanvas')).getBoundsCenter();
        await driver.click(center.x, center.y);
        await driver.delayMs(UI_WAIT_MS);
        const scrolls: Array<Component> = await driver.findComponents(ON.type('Scroll'));
        expect(scrolls.length >= 1).assertTrue();
        expect(await scrolls[0].isScrollable()).assertFalse();
        expect(await byId(driver, 'previewCanvas') !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1171
     * @tc.name testIndexState0051
     * @tc.desc Verify the gallery stays resolvable after a press on the render node container.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0051 begin');
      await runCase('testIndexState0051', async () => {
        const driver: Driver = await page();
        const box: Rect = await (await byId(driver, 'renderNodeContainer')).getBounds();
        await driver.click(box.left + 1, box.top + 1);
        await driver.delayMs(UI_WAIT_MS);
        expect(await byId(driver, 'gallery_Glyph') !== null).assertTrue();
        expect(await (await byId(driver, 'gallery_Glyph')).getText()).assertEqual('Glyph');
        expect(await (await byId(driver, 'gallery_Glyph')).isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1172
     * @tc.name testIndexState0052
     * @tc.desc Verify two idle waits do not invalidate the located components.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIndexState0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0052 begin');
      await runCase('testIndexState0052', async () => {
        const driver: Driver = await page();
        await driver.delayMs(UI_WAIT_MS);
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_Rects')).getId()).assertEqual('gallery_Rects');
        expect(await (await byId(driver, 'gallery_Clip')).getId()).assertEqual('gallery_Clip');
        expect(await (await byId(driver, 'previewCanvas')).getId()).assertEqual('previewCanvas');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1173
     * @tc.name testIndexState0053
     * @tc.desc Verify the rect gallery entry then the draw rect button keep the canvas a canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0053 begin');
      await runCase('testIndexState0053', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_Rects')).click();
        await driver.delayMs(UI_WAIT_MS);
        const rectButton: Component = await byId(driver, 'btnDrawRect');
        await rectButton.click();
        await driver.delayMs(UI_WAIT_MS);
        const canvas: Component = await byId(driver, 'previewCanvas');
        expect(await canvas.getType()).assertEqual('Canvas');
        expect(await (await byId(driver, 'btnDrawRect')).getText()).assertEqual('Draw Rect');
        expect(await (await byId(driver, 'gallery_Rects')).isClickable()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_UI_1174
     * @tc.name testIndexState0054
     * @tc.desc Verify a full chain from launch through the last entry and the text button.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testIndexState0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0054 begin');
      await runCase('testIndexState0054', async () => {
        const driver: Driver = await page();
        await (await byId(driver, 'gallery_MatrixDraw')).click();
        await driver.delayMs(UI_WAIT_MS);
        await (await byId(driver, 'btnDrawText')).click();
        await driver.delayMs(UI_WAIT_MS);
        expect(await (await byId(driver, 'gallery_MatrixDraw')).getText()).assertEqual('MatrixDraw');
        expect(await (await byId(driver, 'btnDrawText')).getText()).assertEqual('Draw Text');
        expect(await (await byId(driver, 'renderNodeContainer')).getId())
          .assertEqual('renderNodeContainer');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testIndexState0054 end');
    });
  });
}
