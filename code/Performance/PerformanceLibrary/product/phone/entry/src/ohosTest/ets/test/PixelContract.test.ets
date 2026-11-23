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
import { execColorInfo, splitRgbaShards } from '@ohos/ThreadDataTransfer';

function pixelBuffer(bytes: number[]): ArrayBuffer {
  const output = new Uint8Array(bytes.length);
  output.set(bytes);
  return output.buffer;
}

function assertPixelBytes(buffer: ArrayBuffer, expected: number[]): void {
  const actual = new Uint8Array(buffer).join(',');
  const wanted = expected.join(',');
  expect(actual).assertEqual(wanted);
}

function primaryPixels(nonDominant: number): number[] {
  return [255, nonDominant, nonDominant, 19,
    nonDominant, 255, nonDominant, 37,
    nonDominant, nonDominant, 255, 73];
}

export default function pixelContractTest(): void {
  describe('PerformancePixelContract', () => {
    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0001
    // @tc.name everyPossibleAlphaByteSurvivesAnActualColorTransformation
    // @tc.desc Verify all 256 alpha values are preserved while primary RGB channels are changed.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('everyPossibleAlphaByteSurvivesAnActualColorTransformation', 0, () => {
      const input: number[] = [];
      const expected: number[] = [];
      for (let alpha = 0; alpha < 256; alpha++) {
        input.push(255, 0, 0, alpha);
        expected.push(255, 128, 128, alpha);
      }
      const buffer = pixelBuffer(input);
      execColorInfo(buffer, 100, 50);
      assertPixelBytes(buffer, expected);
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0002
    // @tc.name alphaCannotInfluenceTheRgbTransformation
    // @tc.desc Verify identical colors with transparent, translucent and opaque alpha produce identical transformed RGB.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('alphaCannotInfluenceTheRgbTransformation', 0, () => {
      const buffer = pixelBuffer([0, 255, 255, 0, 0, 255, 255, 127, 0, 255, 255, 255]);
      execColorInfo(buffer, 100, 75);
      assertPixelBytes(buffer, [64, 255, 255, 0, 64, 255, 255, 127, 64, 255, 255, 255]);
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0003
    // @tc.name onePercentSaturationKeepsTheSmallestSliderStepDistinctFromGray
    // @tc.desc Verify the slider value one produces near-neutral color without losing the dominant channel.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('onePercentSaturationKeepsTheSmallestSliderStepDistinctFromGray', 0, () => {
      const buffer = pixelBuffer(primaryPixels(0));
      execColorInfo(buffer, 100, 1);
      assertPixelBytes(buffer, primaryPixels(252));
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0004
    // @tc.name ninetyNinePercentSaturationKeepsTheLargestSliderStepDistinctFromIdentity
    // @tc.desc Verify the slider value ninety-nine changes nondominant channels rather than taking an identity shortcut.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('ninetyNinePercentSaturationKeepsTheLargestSliderStepDistinctFromIdentity', 0, () => {
      const buffer = pixelBuffer(primaryPixels(0));
      execColorInfo(buffer, 100, 99);
      assertPixelBytes(buffer, primaryPixels(3));
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0005
    // @tc.name threeQuarterSaturationRoundsEachSecondaryChannelCorrectly
    // @tc.desc Verify a three-quarter ratio reaches the rounding case absent from the generated half and quarter matrix.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('threeQuarterSaturationRoundsEachSecondaryChannelCorrectly', 0, () => {
      const buffer = pixelBuffer([255, 255, 0, 41, 0, 255, 255, 43, 255, 0, 255, 47]);
      execColorInfo(buffer, 100, 75);
      assertPixelBytes(buffer, [255, 255, 64, 41, 64, 255, 255, 43, 255, 64, 255, 47]);
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0006
    // @tc.name fractionalPreviousAndTargetValuesStillUseTheirRatio
    // @tc.desc Verify fractional saturation arguments produce the same precise one-half ratio as integer slider values.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('fractionalPreviousAndTargetValuesStillUseTheirRatio', 0, () => {
      const buffer = pixelBuffer(primaryPixels(0));
execColorInfo(buffer, 3.5, 1.75);
      assertPixelBytes(buffer, primaryPixels(128));
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0007
    // @tc.name reducingAnAlreadyPartlySaturatedPixelUsesItsCurrentChroma
    // @tc.desc Verify the algorithm scales existing saturation instead of rebuilding colors as fully saturated primaries.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('reducingAnAlreadyPartlySaturatedPixelUsesItsCurrentChroma', 0, () => {
      const buffer = pixelBuffer([255, 128, 128, 17, 128, 255, 128, 23, 128, 128, 255, 29,
        255, 255, 128, 31, 128, 255, 255, 37, 255, 128, 255, 41]);
      execColorInfo(buffer, 100, 50);
      assertPixelBytes(buffer, [255, 191, 191, 17, 191, 255, 191, 23, 191, 191, 255, 29,
        255, 255, 191, 31, 191, 255, 255, 37, 255, 191, 255, 41]);
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0008
    // @tc.name increasingSaturationRestoresGreenAndAllSecondaryHueSectors
    // @tc.desc Verify increasing saturation exercises the green, yellow, cyan and magenta reconstruction branches.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('increasingSaturationRestoresGreenAndAllSecondaryHueSectors', 0, () => {
      const buffer = pixelBuffer([128, 255, 128, 17, 255, 255, 128, 23,
        128, 255, 255, 29, 255, 128, 255, 31]);
      execColorInfo(buffer, 50, 100);
      assertPixelBytes(buffer, [0, 255, 0, 17, 255, 255, 0, 23,
        0, 255, 255, 29, 255, 0, 255, 31]);
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0009
    // @tc.name successiveSliderReductionsComposeUsingTheUpdatedPreviousValue
    // @tc.desc Verify three actual image updates retain primary hue and the expected final twenty-percent saturation.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('successiveSliderReductionsComposeUsingTheUpdatedPreviousValue', 0, () => {
      const buffer = pixelBuffer(primaryPixels(0));
      execColorInfo(buffer, 100, 80);
      assertPixelBytes(buffer, primaryPixels(51));
      execColorInfo(buffer, 80, 40);
      assertPixelBytes(buffer, primaryPixels(153));
      execColorInfo(buffer, 40, 20);
      assertPixelBytes(buffer, primaryPixels(204));
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0010
    // @tc.name identityAfterReductionDoesNotRestoreLostSaturation
    // @tc.desc Verify equal previous and target values retain the current reduced color instead of the original color.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('identityAfterReductionDoesNotRestoreLostSaturation', 0, () => {
      const buffer = pixelBuffer(primaryPixels(0));
      execColorInfo(buffer, 100, 50);
      execColorInfo(buffer, 50, 50);
      assertPixelBytes(buffer, primaryPixels(128));
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0011
    // @tc.name neutralExtremesStayNeutralWhenSaturationIsIncreased
    // @tc.desc Verify increasing saturation leaves black and white unchanged and preserves their alpha bytes.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('neutralExtremesStayNeutralWhenSaturationIsIncreased', 0, () => {
      const buffer = pixelBuffer([0, 0, 0, 19, 255, 255, 255, 83]);
      execColorInfo(buffer, 25, 100);
      assertPixelBytes(buffer, [0, 0, 0, 19, 255, 255, 255, 83]);
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0012
    // @tc.name zeroSaturationHandlesArbitraryHueAnglesWithoutUsingASectorShortcut
    // @tc.desc Verify irregular RGB hues become white at zero saturation while their individual alpha bytes remain intact.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('zeroSaturationHandlesArbitraryHueAnglesWithoutUsingASectorShortcut', 0, () => {
      const buffer = pixelBuffer([255, 17, 93, 7, 83, 255, 19, 11,
        71, 31, 255, 13, 255, 251, 3, 17, 2, 255, 253, 19]);
      execColorInfo(buffer, 60, 0);
      assertPixelBytes(buffer, [255, 255, 255, 7, 255, 255, 255, 11,
        255, 255, 255, 13, 255, 255, 255, 17, 255, 255, 255, 19]);
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0013
    // @tc.name transformingUnevenShardsMatchesTransformingTheWholeImage
    // @tc.desc Verify decomposition does not change irregular-hue output or introduce shard-boundary dependence.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('transformingUnevenShardsMatchesTransformingTheWholeImage', 0, () => {
      const input = [255, 17, 93, 7, 83, 255, 19, 11, 71, 31, 255, 13,
        255, 251, 3, 17, 2, 255, 253, 19, 255, 0, 0, 23, 0, 255, 0, 29];
      const whole = pixelBuffer(input);
      const source = pixelBuffer(input);
      const shards = splitRgbaShards(source, 3);
      execColorInfo(whole, 100, 75);
      const actual: number[] = [];
      for (const shard of shards) {
        execColorInfo(shard, 100, 75);
        for (const byte of new Uint8Array(shard)) { actual.push(byte); }
      }
      const expected = new Uint8Array(whole).join(',');
      const observedValue1 = actual.join(',');
      expect(observedValue1).assertEqual(expected);
      assertPixelBytes(source, input);
    });

    // @tc.number SUB_PERFORMANCE_PIXELCONTRACT_0014
    // @tc.name interleavedTransformsOfDifferentImagesKeepIndependentSliderHistories
    // @tc.desc Verify updating another image between two changes cannot replace the previous image saturation state.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('interleavedTransformsOfDifferentImagesKeepIndependentSliderHistories', 0, () => {
      const first = pixelBuffer([255, 0, 0, 43]);
      const second = pixelBuffer([0, 255, 0, 47]);
      execColorInfo(first, 100, 80);
      execColorInfo(second, 100, 25);
      execColorInfo(first, 80, 40);
      assertPixelBytes(first, [255, 153, 153, 43]);
      assertPixelBytes(second, [191, 255, 191, 47]);
    });
  });
}
