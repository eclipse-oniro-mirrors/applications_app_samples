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

import { MediaFilterType } from './MediaModels';
import { Logger } from '../../utils/Logger';
import { Trace } from '../../utils/Trace';

/** Module tag used by every log line emitted from this file. */
const TAG: string = 'ColorMatrixUtil';

// A 4x5 color matrix contains 20 values: 4 rows, each row has 4 channel factors and 1 offset.
const MATRIX_SIZE: number = 20;
const ROW_SIZE: number = 5;
const CHANNEL_COUNT: number = 4;
const OFFSET_INDEX: number = 4;
// effectKit.setColorMatrix expects the offset column to stay inside [-1, 1].
const OFFSET_RANGE: number = 1;
const LUMA_RED: number = 0.2126;
const LUMA_GREEN: number = 0.7152;
const LUMA_BLUE: number = 0.0722;

/**
 * Builds color matrices for contrast, saturation and the preset tint filters.
 * The matrix is consumed by effectKit.Filter.setColorMatrix on the worker thread.
 */
export class ColorMatrixUtil {
  /**
   * Composes the final 4x5 color matrix from the editor parameters.
   * Contrast is applied first, then saturation, then the preset tint.
   * @param contrast Contrast multiplier, one means the identity transform.
   * @param saturation Saturation multiplier, one means the identity transform.
   * @param filter Preset filter selected in the editor.
   * @returns Flat array of 20 matrix values in row major order.
   */
  static build(contrast: number, saturation: number, filter: MediaFilterType): number[] {
    return Trace.withSync('ColorMatrixUtil.build', () => {
      // Log the requested parameters; they are numbers only and contain no user content.
      Logger.debug(TAG, 'build begin, contrast: ' + String(contrast) + ', saturation: ' + String(saturation) +
        ', filter: ' + filter);
      // Start from the neutral matrix so unused stages stay at the identity transform.
      let matrix: number[] = ColorMatrixUtil.identity();
      // Apply the contrast stage only when the multiplier differs from one.
      if (Math.abs(contrast - 1) > 0.001) {
        // Pre-multiply the contrast matrix so it is applied after the accumulated one.
        matrix = ColorMatrixUtil.multiply(ColorMatrixUtil.contrastMatrix(contrast), matrix);
        // Report that the contrast stage took part in the composition.
        Logger.debug(TAG, 'build applied contrast stage');
      }
      // Apply the saturation stage only when the multiplier differs from one.
      if (Math.abs(saturation - 1) > 0.001) {
        // Pre-multiply the saturation matrix so it is applied after the accumulated one.
        matrix = ColorMatrixUtil.multiply(ColorMatrixUtil.saturationMatrix(saturation), matrix);
        // Report that the saturation stage took part in the composition.
        Logger.debug(TAG, 'build applied saturation stage');
      }
      // Build the tint matrix of the selected preset filter.
      const tint: number[] = ColorMatrixUtil.tintMatrix(filter);
      // Compose the tint on top of the accumulated matrix and return the final result.
      const result: number[] = ColorMatrixUtil.multiply(tint, matrix);
      // Report the finished composition with the produced value count.
      Logger.info(TAG, 'build end, value count: ' + String(result.length));
      // Hand the composed matrix back to the caller.
      return result;
    });
  }

  /**
   * Creates the neutral 4x5 matrix with unit factors on the diagonal.
   * @returns Flat array of 20 matrix values in row major order.
   */
  static identity(): number[] {
    return Trace.withSync('ColorMatrixUtil.identity', () => {
      // Allocate the flat result array before filling it entry by entry.
      const matrix: number[] = [];
      // Walk every one of the 20 matrix slots.
      for (let index = 0; index < MATRIX_SIZE; index++) {
        // Compute the row this flat index belongs to.
        const row: number = Math.floor(index / ROW_SIZE);
        // Compute the column this flat index belongs to.
        const column: number = index % ROW_SIZE;
        // Put one on the diagonal and zero everywhere else.
        matrix[index] = row === column ? 1 : 0;
      }
      // Hand the neutral matrix back to the caller.
      return matrix;
    });
  }

  /**
   * Multiplies two 4x5 matrices using the offset aware rule of the color matrix format.
   * @param after Matrix applied after the accumulated one.
   * @param before Accumulated matrix.
   * @returns Flat array of 20 matrix values of the composition.
   */
  static multiply(after: number[], before: number[]): number[] {
    return Trace.withSync('ColorMatrixUtil.multiply', () => {
      // Allocate the flat result array before filling it entry by entry.
      const result: number[] = [];
      // Walk the four colour rows of the composition.
      for (let row = 0; row < CHANNEL_COUNT; row++) {
        // Walk the four channel columns plus the offset column.
        for (let column = 0; column < ROW_SIZE; column++) {
          // Accumulate the dot product of the row and the column in this slot.
          let value: number = 0;
          // Walk the four channel factors of the row.
          for (let channel = 0; channel < CHANNEL_COUNT; channel++) {
            // Add the scaled channel contribution to the accumulator.
            value += after[row * ROW_SIZE + channel] * before[channel * ROW_SIZE + column];
          }
          // The offset column also receives the translation of the first matrix.
          if (column === OFFSET_INDEX) {
            // Add the offset term of the first matrix to the accumulated value.
            value += after[row * ROW_SIZE + OFFSET_INDEX];
          }
          // Store the composed value at the same flat position.
          result[row * ROW_SIZE + column] = value;
        }
      }
      // Hand the composed matrix back to the caller.
      return result;
    });
  }

  /**
   * Builds the contrast matrix that scales the distance to the middle grey point.
   * @param contrast Contrast multiplier.
   * @returns Flat array of 20 matrix values in row major order.
   */
  static contrastMatrix(contrast: number): number[] {
    return Trace.withSync('ColorMatrixUtil.contrastMatrix', () => {
      // The contrast multiplier is used directly as the channel scale factor.
      const scale: number = contrast;
      // Keep the middle gray value stable while scaling the distance to it.
      const offset: number = (1 - scale) * OFFSET_RANGE * 0.5;
      // Log the derived scale and offset so the composition can be verified on device.
      Logger.debug(TAG, 'contrastMatrix scale: ' + String(scale) + ', offset: ' + String(offset));
      // Return the 4x5 contrast matrix with the alpha row kept neutral.
      return [
        scale, 0, 0, 0, offset,
        0, scale, 0, 0, offset,
        0, 0, scale, 0, offset,
        0, 0, 0, 1, 0
      ];
    });
  }

  /**
   * Builds the saturation matrix based on the luminance weights of the colour channels.
   * @param saturation Saturation multiplier, zero produces a full grayscale image.
   * @returns Flat array of 20 matrix values in row major order.
   */
  static saturationMatrix(saturation: number): number[] {
    return Trace.withSync('ColorMatrixUtil.saturationMatrix', () => {
      // Weight of the luma contribution, zero at full saturation.
      const inverse: number = 1 - saturation;
      // Log the requested saturation so the luma weights can be cross checked on device.
      Logger.debug(TAG, 'saturationMatrix saturation: ' + String(saturation));
      // Return the 4x5 saturation matrix with the alpha row kept neutral.
      return [
        inverse * LUMA_RED + saturation, inverse * LUMA_GREEN, inverse * LUMA_BLUE, 0, 0,
        inverse * LUMA_RED, inverse * LUMA_GREEN + saturation, inverse * LUMA_BLUE, 0, 0,
        inverse * LUMA_RED, inverse * LUMA_GREEN, inverse * LUMA_BLUE + saturation, 0, 0,
        0, 0, 0, 1, 0
      ];
    });
  }

  /**
   * Builds the offset only matrix of one preset filter.
   * @param filter Preset filter selected in the editor.
   * @returns Flat array of 20 matrix values in row major order.
   */
  static tintMatrix(filter: MediaFilterType): number[] {
    return Trace.withSync('ColorMatrixUtil.tintMatrix', () => {
      // 0.14 is about 14% of the normalized channel range, strong enough to be visible.
      const tintOffset: number = 0.14;
      // Log the selected preset so the branch taken is visible in the log stream.
      Logger.debug(TAG, 'tintMatrix filter: ' + filter);
      // Pick the matrix that belongs to the selected preset filter.
      switch (filter) {
        case MediaFilterType.WARM:
          // Warm tint: red up, blue down, a small green lift keeps the skin tones natural.
          return [
            1, 0, 0, 0, tintOffset,
            0, 1, 0, 0, tintOffset * 0.3,
            0, 0, 1, 0, -tintOffset,
            0, 0, 0, 1, 0
          ];
        case MediaFilterType.COOL:
          // Cool tint: blue up, red down, a small green lift keeps the shadows neutral.
          return [
            1, 0, 0, 0, -tintOffset,
            0, 1, 0, 0, tintOffset * 0.2,
            0, 0, 1, 0, tintOffset,
            0, 0, 0, 1, 0
          ];
        case MediaFilterType.HIGH_CONTRAST:
          // High contrast preset reuses the fixed contrast matrix around the middle grey point.
          return ColorMatrixUtil.contrastMatrix(1.6);
        default:
          // Every other preset keeps the neutral matrix so no tint is applied.
          return ColorMatrixUtil.identity();
      }
    });
  }
}
