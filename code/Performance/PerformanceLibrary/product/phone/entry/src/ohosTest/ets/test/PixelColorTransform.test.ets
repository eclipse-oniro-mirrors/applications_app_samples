import { describe, expect, it } from '@ohos/hypium';
import { execColorInfo } from '@ohos/ThreadDataTransfer';

function rgbaBuffer(values: number[]): ArrayBuffer {
  const buffer = new ArrayBuffer(values.length);
  const pixels = new Uint8Array(buffer);
  pixels.set(values);
  return buffer;
}

function expectBytes(actual: ArrayBuffer, expected: number[]): void {
  const bytes = new Uint8Array(actual);
  expect(bytes.length).assertEqual(expected.length);
  for (let index = 0; index < expected.length; index++) {
    expect(bytes[index]).assertEqual(expected[index]);
  }
}

export default function pixelColorTransformTest(): void {
  describe('PerformancePixelColorTransform', () => {
    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_0100
     * @tc.name redIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('redIdentity', 0, () => {
      const buffer = rgbaBuffer([255, 0, 0, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [255, 0, 0, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_0200
     * @tc.name redHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('redHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 0, 0, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [255, 128, 128, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_0300
     * @tc.name redZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('redZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 0, 0, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_0400
     * @tc.name yellowIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('yellowIdentity', 0, () => {
      const buffer = rgbaBuffer([255, 255, 0, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [255, 255, 0, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_0500
     * @tc.name yellowHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('yellowHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 255, 0, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [255, 255, 128, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_0600
     * @tc.name yellowZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('yellowZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 255, 0, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_0700
     * @tc.name greenIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('greenIdentity', 0, () => {
      const buffer = rgbaBuffer([0, 255, 0, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [0, 255, 0, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_0800
     * @tc.name greenHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('greenHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 255, 0, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [128, 255, 128, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_0900
     * @tc.name greenZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('greenZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 255, 0, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_1000
     * @tc.name cyanIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('cyanIdentity', 0, () => {
      const buffer = rgbaBuffer([0, 255, 255, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [0, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_1100
     * @tc.name cyanHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('cyanHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 255, 255, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [128, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_1200
     * @tc.name cyanZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('cyanZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 255, 255, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_1300
     * @tc.name blueIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('blueIdentity', 0, () => {
      const buffer = rgbaBuffer([0, 0, 255, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [0, 0, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_1400
     * @tc.name blueHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('blueHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 0, 255, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [128, 128, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_1500
     * @tc.name blueZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('blueZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 0, 255, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_1600
     * @tc.name magentaIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('magentaIdentity', 0, () => {
      const buffer = rgbaBuffer([255, 0, 255, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [255, 0, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_1700
     * @tc.name magentaHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('magentaHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 0, 255, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [255, 128, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_1800
     * @tc.name magentaZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('magentaZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 0, 255, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_1900
     * @tc.name orangeIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('orangeIdentity', 0, () => {
      const buffer = rgbaBuffer([255, 128, 0, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [255, 128, 0, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_2000
     * @tc.name orangeHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('orangeHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 128, 0, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [255, 191, 128, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_2100
     * @tc.name orangeZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('orangeZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 128, 0, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_2200
     * @tc.name limeIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('limeIdentity', 0, () => {
      const buffer = rgbaBuffer([128, 255, 0, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [128, 255, 0, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_2300
     * @tc.name limeHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('limeHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([128, 255, 0, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [191, 255, 128, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_2400
     * @tc.name limeZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('limeZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([128, 255, 0, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_2500
     * @tc.name springIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('springIdentity', 0, () => {
      const buffer = rgbaBuffer([0, 255, 128, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [0, 255, 128, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_2600
     * @tc.name springHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('springHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 255, 128, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [128, 255, 191, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_2700
     * @tc.name springZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('springZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 255, 128, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_2800
     * @tc.name azureIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('azureIdentity', 0, () => {
      const buffer = rgbaBuffer([0, 128, 255, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [0, 128, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_2900
     * @tc.name azureHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('azureHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 128, 255, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [128, 191, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_3000
     * @tc.name azureZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('azureZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 128, 255, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_3100
     * @tc.name violetIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('violetIdentity', 0, () => {
      const buffer = rgbaBuffer([128, 0, 255, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [128, 0, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_3200
     * @tc.name violetHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('violetHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([128, 0, 255, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [191, 128, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_3300
     * @tc.name violetZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('violetZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([128, 0, 255, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_3400
     * @tc.name roseIdentity
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('roseIdentity', 0, () => {
      const buffer = rgbaBuffer([255, 0, 128, 173]);
      const result = execColorInfo(buffer, 100, 100);
      expectBytes(result, [255, 0, 128, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_3500
     * @tc.name roseHalfSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('roseHalfSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 0, 128, 173]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [255, 128, 191, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_3600
     * @tc.name roseZeroSaturation
     * @tc.desc Validate an independent HSV sector or boundary against analytical RGB values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('roseZeroSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 0, 128, 173]);
      const result = execColorInfo(buffer, 100, 0);
      expectBytes(result, [255, 255, 255, 173]);
      expect(result === buffer).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_3700
     * @tc.name darkRedPreservesValueWhileReducingSaturation
     * @tc.desc Reducing saturation must preserve the value of a non full brightness pixel.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('darkRedPreservesValueWhileReducingSaturation', 0, () => {
      const buffer = rgbaBuffer([128, 0, 0, 61]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [128, 64, 64, 61]);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_3800
     * @tc.name darkYellowPreservesValueWhileReducingSaturation
     * @tc.desc Reducing saturation must preserve the value of a non full brightness pixel.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('darkYellowPreservesValueWhileReducingSaturation', 0, () => {
      const buffer = rgbaBuffer([128, 128, 0, 61]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [128, 128, 64, 61]);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_3900
     * @tc.name darkGreenPreservesValueWhileReducingSaturation
     * @tc.desc Reducing saturation must preserve the value of a non full brightness pixel.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('darkGreenPreservesValueWhileReducingSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 128, 0, 61]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [64, 128, 64, 61]);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_4000
     * @tc.name darkCyanPreservesValueWhileReducingSaturation
     * @tc.desc Reducing saturation must preserve the value of a non full brightness pixel.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('darkCyanPreservesValueWhileReducingSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 128, 128, 61]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [64, 128, 128, 61]);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_4100
     * @tc.name darkBluePreservesValueWhileReducingSaturation
     * @tc.desc Reducing saturation must preserve the value of a non full brightness pixel.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('darkBluePreservesValueWhileReducingSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 0, 128, 61]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [64, 64, 128, 61]);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_4200
     * @tc.name darkMagentaPreservesValueWhileReducingSaturation
     * @tc.desc Reducing saturation must preserve the value of a non full brightness pixel.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('darkMagentaPreservesValueWhileReducingSaturation', 0, () => {
      const buffer = rgbaBuffer([128, 0, 128, 61]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [128, 64, 128, 61]);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_4300
     * @tc.name blackRemainsNeutralAtReducedSaturation
     * @tc.desc An achromatic pixel stays neutral and keeps its alpha byte.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('blackRemainsNeutralAtReducedSaturation', 0, () => {
      const buffer = rgbaBuffer([0, 0, 0, 29]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [0, 0, 0, 29]);
      expect(result === buffer).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_4400
     * @tc.name middleGrayRemainsNeutralAtReducedSaturation
     * @tc.desc An achromatic pixel stays neutral and keeps its alpha byte.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('middleGrayRemainsNeutralAtReducedSaturation', 0, () => {
      const buffer = rgbaBuffer([102, 102, 102, 29]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [102, 102, 102, 29]);
      expect(result === buffer).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_4500
     * @tc.name whiteRemainsNeutralAtReducedSaturation
     * @tc.desc An achromatic pixel stays neutral and keeps its alpha byte.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('whiteRemainsNeutralAtReducedSaturation', 0, () => {
      const buffer = rgbaBuffer([255, 255, 255, 29]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [255, 255, 255, 29]);
      expect(result === buffer).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_4600
     * @tc.name emptyBufferReturnsWithoutCreatingPixels
     * @tc.desc An empty valid buffer stays empty and preserves its identity.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('emptyBufferReturnsWithoutCreatingPixels', 0, () => {
      const buffer = new ArrayBuffer(0);
      const result = execColorInfo(buffer, 100, 50);
      expect(result.byteLength).assertEqual(0);
      expect(result === buffer).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_4700
     * @tc.name multiplePixelsPreserveStrideAndAllAlphaBytes
     * @tc.desc Every RGBA pixel is transformed independently with no alpha or stride corruption.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('multiplePixelsPreserveStrideAndAllAlphaBytes', 0, () => {
      const buffer = rgbaBuffer([255, 0, 0, 0, 0, 255, 0, 1,
        0, 0, 255, 127, 255, 255, 0, 255]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [255, 128, 128, 0, 128, 255, 128, 1,
        128, 128, 255, 127, 255, 255, 128, 255]);
      expect(result === buffer).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_4800
     * @tc.name separateBuffersDoNotModifyEachOther
     * @tc.desc Transforming one image must not mutate a separate image buffer.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('separateBuffersDoNotModifyEachOther', 0, () => {
      const first = rgbaBuffer([255, 0, 0, 19]);
      const second = rgbaBuffer([0, 255, 0, 31]);
      execColorInfo(first, 100, 50);
      expectBytes(first, [255, 128, 128, 19]);
      expectBytes(second, [0, 255, 0, 31]);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_4900
     * @tc.name restoringReducedSaturationKeepsHueAndAlpha
     * @tc.desc A supported slider increase restores saturation after an earlier decrease.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('restoringReducedSaturationKeepsHueAndAlpha', 0, () => {
      const buffer = rgbaBuffer([255, 0, 0, 83, 0, 0, 255, 97]);
      execColorInfo(buffer, 100, 50);
      expectBytes(buffer, [255, 128, 128, 83, 128, 128, 255, 97]);
      execColorInfo(buffer, 50, 100);
      expectBytes(buffer, [255, 0, 0, 83, 0, 0, 255, 97]);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_5000
     * @tc.name equivalentSliderRatiosProduceEqualImages
     * @tc.desc Conversion uses the ratio between slider states rather than an absolute slider value.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('equivalentSliderRatiosProduceEqualImages', 0, () => {
      const first = rgbaBuffer([0, 255, 255, 47]);
      const second = rgbaBuffer([0, 255, 255, 47]);
      execColorInfo(first, 100, 50);
      execColorInfo(second, 80, 40);
      expectBytes(first, [128, 255, 255, 47]);
      expectBytes(second, [128, 255, 255, 47]);
    });

    /**
     * @tc.number SUB_PERFORMANCE_PIXELCOLOR_5100
     * @tc.name mutatingReturnedBufferIsVisibleThroughOriginalBuffer
     * @tc.desc The caller can reuse the returned in place buffer without an implicit copy.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mutatingReturnedBufferIsVisibleThroughOriginalBuffer', 0, () => {
      const buffer = rgbaBuffer([255, 0, 255, 199]);
      const result = execColorInfo(buffer, 100, 50);
      expectBytes(result, [255, 128, 255, 199]);
      new Uint8Array(result)[3] = 17;
      expect(new Uint8Array(buffer)[3]).assertEqual(17);
    });

  });
}
