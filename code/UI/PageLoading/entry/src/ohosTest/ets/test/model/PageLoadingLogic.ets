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

// Transcription of the pageloading HAR timing and naming rules (PageLoading.ets, LoadingHUD.ets, CommodityList.ets,
// CommodityMock.ets) with setTimeout/setInterval replaced by an explicit elapsed time.

// Mirrors MILLISECONDS of PageLoading.ets and the interval of MILLISECONDS / 10 that adds 10 to nowProgress.
export const MILLISECONDS: number = 5000;
export const PROGRESS_STEP: number = 10;
export const TICK_MS: number = MILLISECONDS / 10;
export const PROGRESS_TOTAL: number = 100;

// Mirrors the CommodityList constants.
export const IMAGE_ASPECT_RATIO: number = 1;
export const PRICE_OFFSET: number = -4;
export const BANNER_SHADOW_OFFSET_X: number = 10;
export const BANNER_SHADOW_OFFSET_Y: number = 10;
export const GRADIENT_ANGLE: number = 180;
export const PRODUCT_COUNT: number = 6;

// Mirrors the lottie options of LoadingHUD.initAnimation().
export class LottieOptions {
  public renderer: string = 'canvas';
  public loop: boolean = true;
  public autoplay: boolean = true;
  public name: string = 'pageLoading';
  public path: string = 'common/lottie/pageLoading.json';
}

export function lottieOptions(): LottieOptions {
  return new LottieOptions();
}

// nowProgress after the given elapsed time: one step per TICK_MS (the interval is never cleared).
export function progressAt(elapsedMs: number): number {
  if (elapsedMs < 0) {
    return 0;
  }
  return Math.floor(elapsedMs / TICK_MS) * PROGRESS_STEP;
}

// isLoading stays true until the MILLISECONDS timeout fires.
export function isLoadingAt(elapsedMs: number): boolean {
  return elapsedMs < MILLISECONDS;
}

// The Stack shows LoadingHUD while loading and CommodityList afterwards.
export function visibleViewAt(elapsedMs: number): string {
  return isLoadingAt(elapsedMs) ? 'LoadingHUD' : 'CommodityList';
}

// Mirrors the LoadingHUD text `当前已加载${this.nowProgress}%`.
export function progressText(progress: number): string {
  return `当前已加载${progress}%`;
}

// Value the linear Progress shows: clamped to [0, PROGRESS_TOTAL].
export function clampedProgress(progress: number): number {
  if (progress < 0) {
    return 0;
  }
  return progress > PROGRESS_TOTAL ? PROGRESS_TOTAL : progress;
}

// Filled fraction of the progress bar.
export function progressRatio(progress: number): number {
  return clampedProgress(progress) / PROGRESS_TOTAL;
}

// Ticks needed until the bar is full.
export function ticksToFull(progress: number): number {
  const remaining: number = PROGRESS_TOTAL - clampedProgress(progress);
  return Math.ceil(remaining / PROGRESS_STEP);
}

// Two-digit suffix used by the mock resources (commodity00 ... commodity05).
export function productSuffix(id: number): string {
  return id < 10 ? `0${id}` : `${id}`;
}

// Mirrors the resource names of PRODUCTS_DATA for one product id.
export function productResourceNames(id: number): string[] {
  const suffix: string = productSuffix(id);
  return [`page_loading_commodity${suffix}`, `page_loading_commodity_title${suffix}`,
    `page_loading_commodity_price${suffix}`, `page_loading_commodity_view${suffix}`,
    `page_loading_commodity_insurance${suffix}`];
}

// Mirrors CommodityDataModel.toString(): id followed by two spaces and the title.
export function commodityText(id: number, title: string): string {
  return id.toString() + '  ' + title;
}

// Mirrors the LazyForEach key generator of CommodityList.
export function commodityKey(id: number): string {
  return id.toString();
}

// Whether an id belongs to the PRODUCTS_DATA mock.
export function isMockProduct(id: number): boolean {
  return Number.isInteger(id) && id >= 0 && id < PRODUCT_COUNT;
}

// Mirrors the page lifecycle: elapsed time drives nowProgress and isLoading.
export class LoadingTimeline {
  private elapsed: number = 0;
  private progress: number = 0;
  private loading: boolean = true;
  private events: string[] = [];

  // Advances the clock; every interval tick adds PROGRESS_STEP and the timeout ends loading.
  advance(ms: number): number {
    if (ms <= 0) {
      return this.progress;
    }
    const before: number = this.elapsed;
    this.elapsed += ms;
    const ticks: number = Math.floor(this.elapsed / TICK_MS) - Math.floor(before / TICK_MS);
    for (let i: number = 0; i < ticks; i++) {
      this.progress += PROGRESS_STEP;
      this.events.push(`progress${this.progress}`);
    }
    if (this.loading && this.elapsed >= MILLISECONDS) {
      this.loading = false;
      this.events.push('loaded');
    }
    return this.progress;
  }

  isLoading(): boolean {
    return this.loading;
  }

  nowProgress(): number {
    return this.progress;
  }

  text(): string {
    return progressText(this.progress);
  }

  view(): string {
    return this.loading ? 'LoadingHUD' : 'CommodityList';
  }

  history(): string[] {
    return this.events.slice();
  }
}
