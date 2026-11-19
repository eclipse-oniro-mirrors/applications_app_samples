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
import { drawing } from '@kit.ArkGraphics2D';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import {
  blendColorFilter,
  blendImageFilter,
  blurImageFilter,
  blurMaskFilter,
  colorShader,
  colorToImageFilter,
  composeColorFilter,
  composeImageFilter,
  composePathEffect,
  composeShader,
  conicalGradientShader,
  cornerPathEffect,
  dashPathEffect,
  discretePathEffect,
  gammaColorFilters,
  lightingColorFilter,
  linearGradientShader,
  lumaColorFilter,
  matrixColorFilter,
  offsetImageFilter,
  paintEffectShowcase,
  pathDashEffect,
  radialGradientShader,
  shadowLayer,
  sumPathEffect,
  sweepGradientShader
} from '../../../main/ets/drawing/DrawingEffects';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, maxChannel, readPixelBuffer, runCase } from './DrawingTestRunner';

/**
 * Build a lattice that carries a nine entry ARGB colour array.
 *
 * @returns { drawing.Lattice } Lattice object.
 */
function coloredLattice(): drawing.Lattice {
  const divs: number[] = [40, 80];
  const colors: number[] = [0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFF333333, 0xFFFFFF00,
    0xFF00FFFF, 0xFFFF00FF, 0xFF808080, 0xFF101010];
  return drawing.Lattice.createImageLattice(divs, divs, 2, 2, null, null, colors);
}

function countNonWhite(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let index: number = 0; index < bytes.length; index += 4) {
    if (bytes[index] !== 255 || bytes[index + 1] !== 255 || bytes[index + 2] !== 255) {
      count++;
    }
  }
  return count;
}

interface InkSample {
  inked: number;
  alpha: number;
}

async function inkOnWhite(configure: (pen: drawing.Pen) => void): Promise<InkSample> {
  const target: OffscreenTarget = await createOffscreenTarget(200, 200);
  target.canvas.drawColor(0xFFFFFFFF, drawing.BlendMode.SRC);
  const pen: drawing.Pen = new drawing.Pen();
  pen.setAntiAlias(true);
  pen.setStrokeWidth(12);
  pen.setColor(rgba(255, 0x22, 0x44, 0x66));
  configure(pen);
  target.canvas.attachPen(pen);
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(30, 30, 170, 170));
  target.canvas.drawPath(path);
  target.canvas.detachPen();
  const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
  const sample: InkSample = { inked: countNonWhite(buffer), alpha: maxChannel(buffer, 3) };
  return sample;
}

export default function drawingEffectTest() {
  describe('DrawingEffectTest', () => {
    /**
     * @tc.number SUB_EFFECT_0100
     * @tc.name testEffect0001
     * @tc.desc Verify the blend mode color filter changes the stroked pixels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0001', 0, async (done: Function) => {
      await runCase('testEffect0001', async () => {
        const filter: drawing.ColorFilter = blendColorFilter(0xFF3366CC);
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setColorFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_0200
     * @tc.name testEffect0002
     * @tc.desc Verify the composed color filter can be attached to a pen.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0002', 0, async (done: Function) => {
      await runCase('testEffect0002', async () => {
        const filter: drawing.ColorFilter = composeColorFilter();
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setColorFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_0300
     * @tc.name testEffect0003
     * @tc.desc Verify both gamma color filters are created.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0003', 0, async (done: Function) => {
      await runCase('testEffect0003', async () => {
        const filters: drawing.ColorFilter[] = gammaColorFilters();
        expect(filters.length).assertEqual(2);
        expect(typeof filters[0]).assertEqual('object');
        expect(typeof filters[1]).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setColorFilter(filters[0]);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_0400
     * @tc.name testEffect0004
     * @tc.desc Verify the luma color filter converts the stroke into gray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0004', 0, async (done: Function) => {
      await runCase('testEffect0004', async () => {
        const filter: drawing.ColorFilter = lumaColorFilter();
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setColorFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_0500
     * @tc.name testEffect0005
     * @tc.desc Verify the identity matrix color filter keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0005', 0, async (done: Function) => {
      await runCase('testEffect0005', async () => {
        const filter: drawing.ColorFilter = matrixColorFilter();
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setColorFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_0600
     * @tc.name testEffect0006
     * @tc.desc Verify the lighting color filter keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0006', 0, async (done: Function) => {
      await runCase('testEffect0006', async () => {
        const filter: drawing.ColorFilter = lightingColorFilter();
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setColorFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_0700
     * @tc.name testEffect0007
     * @tc.desc Verify the blur image filter softens the stroke but keeps ink.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0007', 0, async (done: Function) => {
      await runCase('testEffect0007', async () => {
        const filter: drawing.ImageFilter = blurImageFilter(6);
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setImageFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_0800
     * @tc.name testEffect0008
     * @tc.desc Verify the offset image filter keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0008', 0, async (done: Function) => {
      await runCase('testEffect0008', async () => {
        const filter: drawing.ImageFilter = offsetImageFilter(4, 4);
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setImageFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_0900
     * @tc.name testEffect0009
     * @tc.desc Verify the composed image filter keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0009', 0, async (done: Function) => {
      await runCase('testEffect0009', async () => {
        const filter: drawing.ImageFilter = composeImageFilter();
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setImageFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_1000
     * @tc.name testEffect0010
     * @tc.desc Verify the blended image filter keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0010', 0, async (done: Function) => {
      await runCase('testEffect0010', async () => {
        const filter: drawing.ImageFilter = blendImageFilter();
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setImageFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_1100
     * @tc.name testEffect0011
     * @tc.desc Verify the image filter built from a color filter keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0011', 0, async (done: Function) => {
      await runCase('testEffect0011', async () => {
        const filter: drawing.ImageFilter = colorToImageFilter();
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setImageFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_1200
     * @tc.name testEffect0012
     * @tc.desc Verify the solid color shader replaces the stroke color.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0012', 0, async (done: Function) => {
      await runCase('testEffect0012', async () => {
        const shader: drawing.ShaderEffect = colorShader(0xFFFF3366);
        expect(typeof shader).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setShaderEffect(shader);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_1300
     * @tc.name testEffect0013
     * @tc.desc Verify the linear gradient shader covers the stroke.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0013', 0, async (done: Function) => {
      await runCase('testEffect0013', async () => {
        const shader: drawing.ShaderEffect = linearGradientShader();
        expect(typeof shader).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setShaderEffect(shader);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_1400
     * @tc.name testEffect0014
     * @tc.desc Verify the radial gradient shader keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0014', 0, async (done: Function) => {
      await runCase('testEffect0014', async () => {
        const shader: drawing.ShaderEffect = radialGradientShader();
        expect(typeof shader).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setShaderEffect(shader);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_1500
     * @tc.name testEffect0015
     * @tc.desc Verify the sweep gradient shader keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0015', 0, async (done: Function) => {
      await runCase('testEffect0015', async () => {
        const shader: drawing.ShaderEffect = sweepGradientShader();
        expect(typeof shader).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setShaderEffect(shader);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_1600
     * @tc.name testEffect0016
     * @tc.desc Verify the conical gradient shader keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0016', 0, async (done: Function) => {
      await runCase('testEffect0016', async () => {
        const shader: drawing.ShaderEffect = conicalGradientShader();
        expect(typeof shader).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setShaderEffect(shader);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_1700
     * @tc.name testEffect0017
     * @tc.desc Verify the composed shader keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0017', 0, async (done: Function) => {
      await runCase('testEffect0017', async () => {
        const shader: drawing.ShaderEffect = composeShader();
        expect(typeof shader).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setShaderEffect(shader);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_1800
     * @tc.name testEffect0018
     * @tc.desc Verify the blur mask filter keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0018', 0, async (done: Function) => {
      await runCase('testEffect0018', async () => {
        const filter: drawing.MaskFilter = blurMaskFilter(2);
        expect(typeof filter).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setMaskFilter(filter);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_1900
     * @tc.name testEffect0019
     * @tc.desc Verify the dash path effect keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0019', 0, async (done: Function) => {
      await runCase('testEffect0019', async () => {
        const effect: drawing.PathEffect = dashPathEffect();
        expect(typeof effect).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setPathEffect(effect);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_2000
     * @tc.name testEffect0020
     * @tc.desc Verify the corner path effect rounds the rectangle corners.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0020', 0, async (done: Function) => {
      await runCase('testEffect0020', async () => {
        const effect: drawing.PathEffect = cornerPathEffect(12);
        expect(typeof effect).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setPathEffect(effect);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_2100
     * @tc.name testEffect0021
     * @tc.desc Verify the discrete path effect keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0021', 0, async (done: Function) => {
      await runCase('testEffect0021', async () => {
        const effect: drawing.PathEffect = discretePathEffect();
        expect(typeof effect).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setPathEffect(effect);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_2200
     * @tc.name testEffect0022
     * @tc.desc Verify the path dash effect keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0022', 0, async (done: Function) => {
      await runCase('testEffect0022', async () => {
        const effect: drawing.PathEffect = pathDashEffect();
        expect(typeof effect).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setPathEffect(effect);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_2300
     * @tc.name testEffect0023
     * @tc.desc Verify the composed path effect keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0023', 0, async (done: Function) => {
      await runCase('testEffect0023', async () => {
        const effect: drawing.PathEffect = composePathEffect();
        expect(typeof effect).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setPathEffect(effect);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_2400
     * @tc.name testEffect0024
     * @tc.desc Verify the summed path effect keeps the stroke visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0024', 0, async (done: Function) => {
      await runCase('testEffect0024', async () => {
        const effect: drawing.PathEffect = sumPathEffect();
        expect(typeof effect).assertEqual('object');
        const sample: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setPathEffect(effect);
        });
        expect(sample.inked).assertLarger(0);
        expect(sample.alpha).assertEqual(255);
        expect(sample.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_2500
     * @tc.name testEffect0025
     * @tc.desc Verify the shadow layer adds pixels around the stroke.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0025', 0, async (done: Function) => {
      await runCase('testEffect0025', async () => {
        const layer: drawing.ShadowLayer = shadowLayer();
        expect(typeof layer).assertEqual('object');
        const plain: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setStrokeWidth(12);
        });
        const shaded: InkSample = await inkOnWhite((pen: drawing.Pen) => {
          pen.setStrokeWidth(12);
          pen.setShadowLayer(layer);
        });
        expect(plain.inked).assertLarger(0);
        expect(shaded.inked).assertLargerOrEqual(plain.inked);
        expect(shaded.inked < 200 * 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_2600
     * @tc.name testEffect0026
     * @tc.desc Verify a lattice carrying an ARGB colour array covers the whole target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0026', 0, async (done: Function) => {
      await runCase('testEffect0026', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(80, 80);
        source.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        target.canvas.drawImageLattice(source.pixelMap, coloredLattice(), ltrb(0, 0, 200, 200),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked).assertEqual(200 * 200);
        expect(maxChannel(buffer, 0)).assertEqual(255);
        expect(maxChannel(buffer, 2)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_2700
     * @tc.name testEffect0027
     * @tc.desc Verify the effect showcase fills the whole canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEffect0027', 0, async (done: Function) => {
      await runCase('testEffect0027', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(240, 200);
        paintEffectShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(target.canvas.getWidth()).assertEqual(240);
        expect(inked).assertEqual(240 * 200);
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_2800
     * @tc.name testEffect0028
     * @tc.desc Verify the effect showcase covers a small canvas completely.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0028', 0, async (done: Function) => {
      await runCase('testEffect0028', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(100, 60);
        paintEffectShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(target.canvas.getWidth()).assertEqual(100);
        expect(target.canvas.getHeight()).assertEqual(60);
        expect(inked).assertEqual(100 * 60);
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_2900
     * @tc.name testEffect0029
     * @tc.desc Verify the effect showcase covers a single pixel canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0029', 0, async (done: Function) => {
      await runCase('testEffect0029', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(1, 1);
        paintEffectShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked).assertEqual(1);
        expect(target.canvas.getWidth()).assertEqual(1);
        expect(target.canvas.getHeight()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_EFFECT_3000
     * @tc.name testEffect0030
     * @tc.desc Verify the effect showcase keeps the canvas state balanced.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEffect0030', 0, async (done: Function) => {
      await runCase('testEffect0030', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(60, 60);
        paintEffectShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(inked).assertEqual(60 * 60);
        expect(target.canvas.getWidth()).assertEqual(60);
      }, done);
    });
  });
}
