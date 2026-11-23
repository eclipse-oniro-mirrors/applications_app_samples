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

import { describe, expect, it } from '@ohos/hypium';
import { ON, On, Rect } from '@ohos.UiTest';
import { backTo, click, eventually, openFeature, requireComponent, withHome } from './Shared/PerformanceDriver';

async function verifyDfx(entry: string, move: boolean): Promise<void> {
  await withHome(async () => {
    await openFeature('DFX StateManagement');
    await click(ON.id(entry));
    await requireComponent(ON.text('Move'));
    await requireComponent(ON.text('Scale'));
    const target = move ? ON.text('Hello World') : ON.id(`${entry}Image`);
    const before: Rect = await (await requireComponent(target)).getBounds();
    await click(ON.text(move ? 'Move' : 'Scale'));
    await eventually(async () => {
      const after: Rect = await (await requireComponent(target)).getBounds();
      return move ? after.top > before.top : after.right - after.left < before.right - before.left;
    }, move ? 'vertical translation' : 'reduced image width');
    await backTo(ON.id(entry));
  });
}

async function readBounds(selector: On): Promise<Rect> {
  return await (await requireComponent(selector)).getBounds();
}

async function verifyDfxReentry(entry: string): Promise<void> {
  await withHome(async () => {
    await openFeature('DFX StateManagement');
    const page = ON.id(entry);
    const image = ON.id(`${entry}Image`);
    const label = ON.text('Hello World');
    await click(page);
    const initialLabel = await readBounds(label);
    const initialImage = await readBounds(image);
    const initialWidth = initialImage.right - initialImage.left;
    await click(ON.text('Scale'));
    await eventually(async () => {
      const bounds = await readBounds(image);
      return bounds.right - bounds.left < initialWidth;
    }, 'scaled image width');
    const beforeMove = await readBounds(label);
    await click(ON.text('Move'));
    await eventually(async () => {
      const bounds = await readBounds(label);
      return bounds.top > beforeMove.top;
    }, 'moved label');
    await backTo(page);
    await click(page);
    const restoredImage = await readBounds(image);
    const restoredLabel = await readBounds(label);
    const widthRestored = Math.abs(restoredImage.right - restoredImage.left - initialWidth) <= 1;
    const topRestored = Math.abs(restoredLabel.top - initialLabel.top) <= 1;
    expect(widthRestored).assertTrue();
    expect(topRestored).assertTrue();
    await backTo(page);
  });
}

export default function dfxStateManagementTest(): void {
  describe('PerformanceDfxStateManagement', () => {
    /**
     * @tc.number SUB_PERFORMANCE_DFXSTATEMANAGEMENT_0100
     * @tc.name beforeOptimizationMoveTranslatesTheLabel
     * @tc.desc Before Optimization Move Translates The Label.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('beforeOptimizationMoveTranslatesTheLabel', 0, async () => {
      await verifyDfx('dfxBefore', true);
    });

    /**
     * @tc.number SUB_PERFORMANCE_DFXSTATEMANAGEMENT_0200
     * @tc.name beforeOptimizationScaleChangesImageWidth
     * @tc.desc Before Optimization Scale Changes Image Width.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('beforeOptimizationScaleChangesImageWidth', 0, async () => {
      await verifyDfx('dfxBefore', false);
    });

    /**
     * @tc.number SUB_PERFORMANCE_DFXSTATEMANAGEMENT_0300
     * @tc.name afterOptimizationMoveTranslatesTheLabel
     * @tc.desc After Optimization Move Translates The Label.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('afterOptimizationMoveTranslatesTheLabel', 0, async () => {
      await verifyDfx('dfxAfter', true);
    });

    /**
     * @tc.number SUB_PERFORMANCE_DFXSTATEMANAGEMENT_0400
     * @tc.name afterOptimizationScaleChangesImageWidth
     * @tc.desc After Optimization Scale Changes Image Width.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('afterOptimizationScaleChangesImageWidth', 0, async () => {
      await verifyDfx('dfxAfter', false);
    });

    // @tc.number SUB_PERFORMANCE_DFXSTATEMANAGEMENT_0500
    // @tc.name reopeningBaselineDfxRestoresPositionAndWidth
    // @tc.desc Verify router navigation clears Move and Scale state when the baseline page is recreated.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('reopeningBaselineDfxRestoresPositionAndWidth', 0, async () => {
      await verifyDfxReentry('dfxBefore');
    });

    // @tc.number SUB_PERFORMANCE_DFXSTATEMANAGEMENT_0600
    // @tc.name reopeningOptimizedDfxRestoresPositionAndWidth
    // @tc.desc Verify router navigation clears both separately observed states when the optimized page is recreated.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('reopeningOptimizedDfxRestoresPositionAndWidth', 0, async () => {
      await verifyDfxReentry('dfxAfter');
    });
  });
}
