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

/** Provides Progress Utils helpers for the sample. */
export class ProgressUtils {
  static clamp(value: number, min: number = 0, max: number = 100): number {
    if (max < min) {
      return min;
    }
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return Math.round(value);
  }

  static step(current: number, delta: number, min: number = 0, max: number = 100): number {
    return ProgressUtils.clamp(current + delta, min, max);
  }

  static formatPercent(value: number): string {
    return `${ProgressUtils.clamp(value)}%`;
  }

  static state(value: number): string {
    const progress = ProgressUtils.clamp(value);
    if (progress >= 100) {
      return 'completed';
    }
    if (progress <= 0) {
      return 'idle';
    }
    return 'running';
  }

  static formatState(value: number): string {
    const progress = ProgressUtils.clamp(value);
    return `progress=${progress}, state=${ProgressUtils.state(progress)}`;
  }

  static indicatorIndex(index: number, count: number): number {
    if (count <= 0) {
      return 0;
    }
    return ProgressUtils.clamp(index, 0, count - 1);
  }

  static describeIndicator(index: number, count: number, style: string): string {
    return `index=${ProgressUtils.indicatorIndex(index, count)}/${count}, style=${style}`;
  }
}
