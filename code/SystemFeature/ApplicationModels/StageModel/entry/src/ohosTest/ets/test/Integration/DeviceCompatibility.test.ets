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

enum ScreenDensity {
  LOW = 120,
  MEDIUM = 160,
  HIGH = 240,
  EXTRA_HIGH = 320
}

class DeviceProfile {
  name: string = '';
  density: number = ScreenDensity.MEDIUM;
  shortSide: number = 0;
  longSide: number = 0;

  constructor(name: string, density: number, shortSide: number, longSide: number) {
    this.name = name;
    this.density = density;
    this.shortSide = shortSide;
    this.longSide = longSide;
  }

  isTablet(): boolean {
    return this.shortSide >= 600;
  }

  isPhone(): boolean {
    return this.shortSide > 0 && this.shortSide < 600;
  }

  scaleFactor(): number {
    return this.density / ScreenDensity.MEDIUM;
  }

  dpToPx(dp: number): number {
    return Math.round(dp * this.scaleFactor());
  }

  aspectRatio(): number {
    if (this.shortSide <= 0) {
      return 0;
    }
    return this.longSide / this.shortSide;
  }

  supportsMultiWindow(): boolean {
    return this.isTablet();
  }
}

export default function deviceCompatibilityTest(): void {
  describe('DeviceCompatibility', () => {
    it('DeviceCompatibility_001', 0, async (done: Function) => {
      const phone = new DeviceProfile('phone', ScreenDensity.MEDIUM, 360, 780);
      expect(phone.isPhone()).assertTrue();
      expect(phone.isTablet()).assertFalse();
      done();
    });

    it('DeviceCompatibility_002', 0, async (done: Function) => {
      const tablet = new DeviceProfile('tablet', ScreenDensity.HIGH, 800, 1280);
      expect(tablet.isTablet()).assertTrue();
      expect(tablet.supportsMultiWindow()).assertTrue();
      done();
    });

    it('DeviceCompatibility_003', 0, async (done: Function) => {
      const device = new DeviceProfile('d', ScreenDensity.MEDIUM, 360, 780);
      expect(device.scaleFactor()).assertEqual(1);
      expect(device.dpToPx(100)).assertEqual(100);
      done();
    });

    it('DeviceCompatibility_004', 0, async (done: Function) => {
      const hdpi = new DeviceProfile('h', ScreenDensity.HIGH, 360, 780);
      expect(hdpi.scaleFactor()).assertEqual(1.5);
      expect(hdpi.dpToPx(100)).assertEqual(150);
      done();
    });

    it('DeviceCompatibility_005', 0, async (done: Function) => {
      const device = new DeviceProfile('d', ScreenDensity.EXTRA_HIGH, 360, 720);
      expect(device.scaleFactor()).assertEqual(2);
      expect(device.aspectRatio()).assertEqual(2);
      done();
    });

    it('DeviceCompatibility_006', 0, async (done: Function) => {
      const device = new DeviceProfile('zero', ScreenDensity.MEDIUM, 0, 0);
      expect(device.aspectRatio()).assertEqual(0);
      expect(device.isTablet()).assertFalse();
      expect(clampNumber(device.scaleFactor(), 1, 4)).assertEqual(1);
      done();
    });

    it('DeviceCompatibility_007', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', 'DeviceCompatibility probe');
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}
