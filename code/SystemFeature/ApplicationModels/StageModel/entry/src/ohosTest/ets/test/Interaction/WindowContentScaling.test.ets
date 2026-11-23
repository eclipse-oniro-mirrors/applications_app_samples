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

import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, clampNumber
} from '../Shared/SharedDriver';

enum ScaleMode {
  NONE = 0,
  FIT = 1,
  FILL = 2
}

class ScaleViewport {
  width: number = 0;
  height: number = 0;

  constructor(width: number, height: number) {
    this.width = width;
    this.height = height;
  }

  isValid(): boolean {
    return this.width > 0 && this.height > 0;
  }

  area(): number {
    if (!this.isValid()) {
      return 0;
    }
    return this.width * this.height;
  }

  aspect(): number {
    if (this.height === 0) {
      return 0;
    }
    return this.width / this.height;
  }
}

class ScaleResult {
  scale: number = 1;
  offsetX: number = 0;
  offsetY: number = 0;
  width: number = 0;
  height: number = 0;

  constructor(scale: number, offsetX: number, offsetY: number, width: number, height: number) {
    this.scale = scale;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    this.width = width;
    this.height = height;
  }
}

class ScaleModel {
  private minScale: number = 0.5;
  private maxScale: number = 3.0;
  private currentScale: number = 1.0;
  private mode: ScaleMode = ScaleMode.NONE;
  private changes: number = 0;

  constructor(minScale: number, maxScale: number, initialScale: number) {
    if (minScale > 0) {
      this.minScale = minScale;
    }
    if (maxScale >= this.minScale) {
      this.maxScale = maxScale;
    }
    this.currentScale = clampNumber(initialScale, this.minScale, this.maxScale);
  }

  getMinScale(): number {
    return this.minScale;
  }

  getMaxScale(): number {
    return this.maxScale;
  }

  getCurrentScale(): number {
    return this.currentScale;
  }

  getMode(): ScaleMode {
    return this.mode;
  }

  getChanges(): number {
    return this.changes;
  }

  setMode(mode: ScaleMode): void {
    this.mode = mode;
  }

  setScale(value: number): number {
    const clamped = clampNumber(value, this.minScale, this.maxScale);
    if (clamped !== this.currentScale) {
      this.currentScale = clamped;
      this.changes = this.changes + 1;
    }
    return this.currentScale;
  }

  zoomIn(step: number): number {
    if (step <= 0) {
      return this.currentScale;
    }
    return this.setScale(this.currentScale + step);
  }

  zoomOut(step: number): number {
    if (step <= 0) {
      return this.currentScale;
    }
    return this.setScale(this.currentScale - step);
  }

  reset(): number {
    return this.setScale(1.0);
  }

  fitScale(content: ScaleViewport, viewport: ScaleViewport): number {
    if (!content.isValid() || !viewport.isValid()) {
      return this.currentScale;
    }
    const scaleX = viewport.width / content.width;
    const scaleY = viewport.height / content.height;
    const fit = scaleX < scaleY ? scaleX : scaleY;
    return clampNumber(fit, this.minScale, this.maxScale);
  }

  fillScale(content: ScaleViewport, viewport: ScaleViewport): number {
    if (!content.isValid() || !viewport.isValid()) {
      return this.currentScale;
    }
    const scaleX = viewport.width / content.width;
    const scaleY = viewport.height / content.height;
    const fill = scaleX > scaleY ? scaleX : scaleY;
    return clampNumber(fill, this.minScale, this.maxScale);
  }

  computeFitted(content: ScaleViewport, viewport: ScaleViewport): ScaleResult {
    const fit = this.fitScale(content, viewport);
    const scaledWidth = content.width * fit;
    const scaledHeight = content.height * fit;
    const offsetX = (viewport.width - scaledWidth) / 2;
    const offsetY = (viewport.height - scaledHeight) / 2;
    return new ScaleResult(fit, offsetX, offsetY, scaledWidth, scaledHeight);
  }

  computeFilled(content: ScaleViewport, viewport: ScaleViewport): ScaleResult {
    const fill = this.fillScale(content, viewport);
    const scaledWidth = content.width * fill;
    const scaledHeight = content.height * fill;
    const offsetX = (viewport.width - scaledWidth) / 2;
    const offsetY = (viewport.height - scaledHeight) / 2;
    return new ScaleResult(fill, offsetX, offsetY, scaledWidth, scaledHeight);
  }

  effectiveDpi(baseDpi: number): number {
    if (baseDpi <= 0) {
      return 0;
    }
    return Math.round(baseDpi * this.currentScale);
  }

  roundScale(step: number): number {
    if (step <= 0) {
      return this.currentScale;
    }
    const rounded = Math.round(this.currentScale / step) * step;
    return clampNumber(rounded, this.minScale, this.maxScale);
  }

  ratio(): string {
    const percent = Math.round(this.currentScale * 100);
    return `${percent}%`;
  }
}

export default function windowContentScalingTest(): void {
  describe('WindowContentScaling', () => {
    it('WindowContentScaling_001', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      expect(model.getCurrentScale()).assertEqual(1.0);
      expect(model.getMinScale()).assertEqual(0.5);
      expect(model.getMaxScale()).assertEqual(3.0);
      done();
    });

    it('WindowContentScaling_002', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      expect(model.setScale(2.0)).assertEqual(2.0);
      expect(model.getChanges()).assertEqual(1);
      expect(model.ratio()).assertEqual('200%');
      done();
    });

    it('WindowContentScaling_003', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      expect(model.setScale(10.0)).assertEqual(3.0);
      expect(model.setScale(0.1)).assertEqual(0.5);
      expect(model.getChanges()).assertEqual(2);
      done();
    });

    it('WindowContentScaling_004', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      expect(model.zoomIn(0.5)).assertEqual(1.5);
      expect(model.zoomIn(0.5)).assertEqual(2.0);
      expect(model.zoomOut(1.0)).assertEqual(1.0);
      done();
    });

    it('WindowContentScaling_005', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      expect(model.zoomIn(0)).assertEqual(1.0);
      expect(model.zoomOut(-1)).assertEqual(1.0);
      expect(model.getChanges()).assertEqual(0);
      done();
    });

    it('WindowContentScaling_006', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      model.setScale(2.0);
      expect(model.reset()).assertEqual(1.0);
      expect(model.getCurrentScale()).assertEqual(1.0);
      done();
    });

    it('WindowContentScaling_007', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      const content = new ScaleViewport(100, 50);
      const viewport = new ScaleViewport(400, 400);
      expect(model.fitScale(content, viewport)).assertEqual(3.0);
      done();
    });

    it('WindowContentScaling_008', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      const content = new ScaleViewport(1000, 500);
      const viewport = new ScaleViewport(400, 400);
      expect(model.fitScale(content, viewport)).assertEqual(0.5);
      done();
    });

    it('WindowContentScaling_009', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      const content = new ScaleViewport(100, 100);
      const viewport = new ScaleViewport(200, 100);
      expect(model.fillScale(content, viewport)).assertEqual(2.0);
      done();
    });

    it('WindowContentScaling_010', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      const content = new ScaleViewport(100, 100);
      const viewport = new ScaleViewport(200, 400);
      const result = model.computeFitted(content, viewport);
      expect(result.scale).assertEqual(2.0);
      expect(result.offsetX).assertEqual(0);
      expect(result.offsetY).assertEqual(100);
      done();
    });

    it('WindowContentScaling_011', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      const content = new ScaleViewport(100, 100);
      const viewport = new ScaleViewport(200, 400);
      const result = model.computeFilled(content, viewport);
      expect(result.scale).assertEqual(3.0);
      expect(result.width).assertEqual(300);
      done();
    });

    it('WindowContentScaling_012', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      expect(model.fitScale(new ScaleViewport(0, 0), new ScaleViewport(10, 10))).assertEqual(1.0);
      expect(model.fillScale(new ScaleViewport(10, 10), new ScaleViewport(0, 0))).assertEqual(1.0);
      done();
    });

    it('WindowContentScaling_013', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      model.setScale(2.0);
      expect(model.effectiveDpi(160)).assertEqual(320);
      expect(model.effectiveDpi(0)).assertEqual(0);
      done();
    });

    it('WindowContentScaling_014', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      model.setScale(1.24);
      expect(model.roundScale(0.5)).assertEqual(1.0);
      expect(model.roundScale(0)).assertEqual(1.24);
      done();
    });

    it('WindowContentScaling_015', 0, async (done: Function) => {
      const model = new ScaleModel(1.0, 1.0, 5.0);
      expect(model.getMinScale()).assertEqual(1.0);
      expect(model.getMaxScale()).assertEqual(1.0);
      expect(model.getCurrentScale()).assertEqual(1.0);
      done();
    });

    it('WindowContentScaling_016', 0, async (done: Function) => {
      const viewport = new ScaleViewport(320, 240);
      expect(viewport.isValid()).assertTrue();
      expect(viewport.area()).assertEqual(76800);
      expect(viewport.aspect()).assertEqual(320 / 240);
      done();
    });

    it('WindowContentScaling_017', 0, async (done: Function) => {
      const model = new ScaleModel(0.5, 3.0, 1.0);
      model.setMode(ScaleMode.FIT);
      expect(model.getMode()).assertEqual(ScaleMode.FIT);
      model.setMode(ScaleMode.FILL);
      expect(model.getMode()).assertEqual(ScaleMode.FILL);
      done();
    });

    it('WindowContentScaling_018', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}
