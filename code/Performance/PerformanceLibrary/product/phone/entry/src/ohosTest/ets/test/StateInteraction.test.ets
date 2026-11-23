/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import { click, eventually, openFeature, requireComponent, withHome } from './Shared/PerformanceDriver';

async function bounds(selector: On): Promise<Rect> {
  return await (await requireComponent(selector)).getBounds();
}

async function verifyIndependentDfxState(entry: string, move: boolean): Promise<void> {
  await withHome(async () => {
    await openFeature('DFX StateManagement');
    await click(ON.id(entry));
    const label = ON.text('Hello World');
    const image = ON.id(entry + 'Image');
    const beforeLabel = await bounds(label);
    const beforeImage = await bounds(image);
    const width = beforeImage.right - beforeImage.left;
    await click(ON.text(move ? 'Move' : 'Scale'));
    await eventually(async () => {
      const actual = await bounds(move ? label : image);
      return move ? actual.top > beforeLabel.top + 1 : actual.right - actual.left < width - 1;
    }, 'requested DFX state changed');
    const afterLabel = await bounds(label);
    const afterImage = await bounds(image);
    const unchanged = move ? Math.abs(afterImage.right - afterImage.left - width) <= 1 :
      Math.abs(afterLabel.top - beforeLabel.top) <= 1;
    expect(unchanged).assertTrue();
  });
}

async function settledMovedTop(label: On, baseline: number): Promise<number> {
  let previous = baseline;
  let stable = 0;
  let result = baseline;
  await eventually(async () => {
    result = (await bounds(label)).top;
    stable = Math.abs(result - previous) <= 1 ? stable + 1 : 0;
    previous = result;
    return result > baseline + 1 && stable >= 3;
  }, 'DFX translation animation settled');
  return result;
}

async function verifyMoveWrap(entry: string): Promise<void> {
  await withHome(async () => {
    await openFeature('DFX StateManagement');
    await click(ON.id(entry));
    const label = ON.text('Hello World');
    const initial = (await bounds(label)).top;
    await click(ON.text('Move'));
    const first = await settledMovedTop(label, initial);
    await click(ON.text('Move'));
    const second = await settledMovedTop(label, initial);
    const wrapped = second > initial && second < first;
    const expectedPosition = initial + (first - initial) * 110 / 180;
    const correctPosition = Math.abs(second - expectedPosition) <= 3;
    expect(wrapped).assertTrue();
    expect(correctPosition).assertTrue();
  });
}

async function verifyScaleCycle(entry: string): Promise<void> {
  await withHome(async () => {
    await openFeature('DFX StateManagement');
    await click(ON.id(entry));
    const image = ON.id(entry + 'Image');
    const original = await bounds(image);
    const initialWidth = original.right - original.left;
    for (const ratio of [1 / 3, 7 / 3, 5 / 3, 1]) {
      await click(ON.text('Scale'));
      await eventually(async () => {
        const actual = await bounds(image);
        return Math.abs(actual.right - actual.left - initialWidth * ratio) <= 3;
      }, 'DFX scale follows the declared modulo cycle');
    }
    const final = await bounds(image);
    const restored = Math.abs(final.right - final.left - initialWidth) <= 3;
    expect(restored).assertTrue();
  });
}

export default function stateInteractionTest(): void {
  describe('PerformanceStateInteraction', () => {
    // @tc.number SUB_PERFORMANCE_STATEINTERACTION_0001
    // @tc.name baselineMoveDoesNotAccidentallyScaleTheImage
    // @tc.desc Verify moving the baseline label leaves image width unchanged.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('baselineMoveDoesNotAccidentallyScaleTheImage', 0, async () => {
      await verifyIndependentDfxState('dfxBefore', true);
    });

    // @tc.number SUB_PERFORMANCE_STATEINTERACTION_0002
    // @tc.name baselineScaleDoesNotAccidentallyTranslateTheLabel
    // @tc.desc Verify scaling the baseline image leaves label position unchanged.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('baselineScaleDoesNotAccidentallyTranslateTheLabel', 0, async () => {
      await verifyIndependentDfxState('dfxBefore', false);
    });

    // @tc.number SUB_PERFORMANCE_STATEINTERACTION_0003
    // @tc.name baselineSecondMoveWrapsToTheDeclaredPosition
    // @tc.desc Verify the baseline translation wraps from 180 to 110 rather than continuing downwards.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('baselineSecondMoveWrapsToTheDeclaredPosition', 0, async () => {
      await verifyMoveWrap('dfxBefore');
    });

    // @tc.number SUB_PERFORMANCE_STATEINTERACTION_0004
    // @tc.name baselineFourScaleUpdatesReturnToTheOriginalWidth
    // @tc.desc Verify the baseline scale follows all four modulo states and restores the original width.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('baselineFourScaleUpdatesReturnToTheOriginalWidth', 0, async () => {
      await verifyScaleCycle('dfxBefore');
    });

    // @tc.number SUB_PERFORMANCE_STATEINTERACTION_0005
    // @tc.name optimizedMoveDoesNotAccidentallyScaleTheImage
    // @tc.desc Verify moving the optimized label leaves image width unchanged.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('optimizedMoveDoesNotAccidentallyScaleTheImage', 0, async () => {
      await verifyIndependentDfxState('dfxAfter', true);
    });

    // @tc.number SUB_PERFORMANCE_STATEINTERACTION_0006
    // @tc.name optimizedScaleDoesNotAccidentallyTranslateTheLabel
    // @tc.desc Verify scaling the optimized image leaves label position unchanged.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('optimizedScaleDoesNotAccidentallyTranslateTheLabel', 0, async () => {
      await verifyIndependentDfxState('dfxAfter', false);
    });

    // @tc.number SUB_PERFORMANCE_STATEINTERACTION_0007
    // @tc.name optimizedSecondMoveWrapsToTheDeclaredPosition
    // @tc.desc Verify the optimized translation wraps from 180 to 110 rather than continuing downwards.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('optimizedSecondMoveWrapsToTheDeclaredPosition', 0, async () => {
      await verifyMoveWrap('dfxAfter');
    });

    // @tc.number SUB_PERFORMANCE_STATEINTERACTION_0008
    // @tc.name optimizedFourScaleUpdatesReturnToTheOriginalWidth
    // @tc.desc Verify the optimized scale follows all four modulo states and restores the original width.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('optimizedFourScaleUpdatesReturnToTheOriginalWidth', 0, async () => {
      await verifyScaleCycle('dfxAfter');
    });
  });
}
