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


/**
 * Pure latitude and longitude grid helpers used by the grid matrix suites.
 */
export class GeoGridUtil {
  /**
   * Clamp an axis index into the valid cell range.
   * An empty axis maps to index zero.
   * @param index the index to clamp
   * @param count the cell count of the axis
   * @returns the clamped index
   */
  public static clampGridIndex(index: number, count: number): number {
    if (count <= 0 || !Number.isFinite(index)) {
      return 0;
    }
    let safeIndex: number = Math.trunc(index);
    if (safeIndex < 0) {
      safeIndex = 0;
    }
    if (safeIndex > count - 1) {
      safeIndex = count - 1;
    }
    return safeIndex;
  }

  /**
   * Wrap a longitude index around the antimeridian.
   * An empty axis maps to index zero.
   * @param index the index to wrap
   * @param count the cell count of the longitude axis
   * @returns the wrapped index inside the axis range
   */
  public static wrapLongitudeIndex(index: number, count: number): number {
    if (count <= 0 || !Number.isFinite(index)) {
      return 0;
    }
    const truncated: number = Math.trunc(index);
    return ((truncated % count) + count) % count;
  }

  /**
   * Check that a latitude is finite and inside the closed range from -90 to 90.
   * @param value the latitude to validate
   * @returns true when the latitude is valid
   */
  public static isValidLatitude(value: number): boolean {
    return Number.isFinite(value) && value >= -90 && value <= 90;
  }

  /**
   * Check that a longitude is finite and inside the closed range from -180 to 180.
   * @param value the longitude to validate
   * @returns true when the longitude is valid
   */
  public static isValidLongitude(value: number): boolean {
    return Number.isFinite(value) && value >= -180 && value <= 180;
  }

  /**
   * Map a latitude onto its grid row index.
   * @param latitude the latitude to locate
   * @param step the cell size in degrees
   * @returns the row index, or -1 for invalid input
   */
  public static latitudeIndex(latitude: number, step: number): number {
    if (!GeoGridUtil.isValidLatitude(latitude) || step <= 0) {
      return -1;
    }
    return Math.floor((latitude + 90) / step);
  }

  /**
   * Map a longitude onto its grid column index.
   * @param longitude the longitude to locate
   * @param step the cell size in degrees
   * @returns the column index, or -1 for invalid input
   */
  public static longitudeIndex(longitude: number, step: number): number {
    if (!GeoGridUtil.isValidLongitude(longitude) || step <= 0) {
      return -1;
    }
    return Math.floor((longitude + 180) / step);
  }

  /**
   * Compute the center latitude of a grid row.
   * @param index the grid row index
   * @param step the cell size in degrees
   * @returns the center latitude, or 0 for invalid input
   */
  public static centerLatitude(index: number, step: number): number {
    if (index < 0 || step <= 0) {
      return 0;
    }
    return -90 + (index + 0.5) * step;
  }

  /**
   * Compute the center longitude of a grid column.
   * @param index the grid column index
   * @param step the cell size in degrees
   * @returns the center longitude, or 0 for invalid input
   */
  public static centerLongitude(index: number, step: number): number {
    if (index < 0 || step <= 0) {
      return 0;
    }
    return -180 + (index + 0.5) * step;
  }

  /**
   * Build the canonical key of a grid cell.
   * @param latitudeCell the grid row index
   * @param longitudeCell the grid column index
   * @returns the cell key in row colon column form
   */
  public static gridKey(latitudeCell: number, longitudeCell: number): string {
    return latitudeCell.toString() + ':' + longitudeCell.toString();
  }

  /**
   * Build the keys of the eight surrounding cells.
   * @param latitudeCell the grid row index
   * @param longitudeCell the grid column index
   * @returns the neighbor keys, excluding the center cell
   */
  public static neighborKeys(latitudeCell: number, longitudeCell: number): string[] {
    const keys: string[] = [];
    for (let rowOffset = -1; rowOffset <= 1; rowOffset++) {
      for (let columnOffset = -1; columnOffset <= 1; columnOffset++) {
        if (rowOffset === 0 && columnOffset === 0) {
          continue;
        }
        keys.push(GeoGridUtil.gridKey(latitudeCell + rowOffset, longitudeCell + columnOffset));
      }
    }
    return keys;
  }

  /**
   * Count the latitude cells of a full meridian span.
   * @param step the cell size in degrees
   * @returns the cell count, or 0 for an invalid step
   */
  public static latitudeCellCount(step: number): number {
    if (step <= 0) {
      return 0;
    }
    return Math.floor(180 / step);
  }

  /**
   * Count the longitude cells of a full parallel span.
   * @param step the cell size in degrees
   * @returns the cell count, or 0 for an invalid step
   */
  public static longitudeCellCount(step: number): number {
    if (step <= 0) {
      return 0;
    }
    return Math.floor(360 / step);
  }
}
