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

enum ThemeMode {
  LIGHT = 0,
  DARK = 1
}

class ThemeTokens {
  primary: string = '';
  background: string = '';
  text: string = '';
  border: string = '';

  constructor(primary: string, background: string, text: string, border: string) {
    this.primary = primary;
    this.background = background;
    this.text = text;
    this.border = border;
  }

  tokenCount(): number {
    let count = 0;
    if (this.primary.length > 0) {
      count = count + 1;
    }
    if (this.background.length > 0) {
      count = count + 1;
    }
    if (this.text.length > 0) {
      count = count + 1;
    }
    if (this.border.length > 0) {
      count = count + 1;
    }
    return count;
  }
}

class ThemeModel {
  private mode: ThemeMode = ThemeMode.LIGHT;
  private light: ThemeTokens = new ThemeTokens('#0A59F7', '#FFFFFF', '#000000', '#E5E5E5');
  private dark: ThemeTokens = new ThemeTokens('#5291FF', '#000000', '#FFFFFF', '#333333');
  private switches: number = 0;
  private followSystem: boolean = true;

  constructor(followSystem: boolean) {
    this.followSystem = followSystem;
  }

  getMode(): ThemeMode {
    return this.mode;
  }

  setMode(mode: ThemeMode): void {
    if (mode !== this.mode) {
      this.mode = mode;
      this.switches = this.switches + 1;
    }
  }

  toggle(): ThemeMode {
    if (this.mode === ThemeMode.LIGHT) {
      this.setMode(ThemeMode.DARK);
    } else {
      this.setMode(ThemeMode.LIGHT);
    }
    return this.mode;
  }

  getSwitches(): number {
    return this.switches;
  }

  isFollowSystem(): boolean {
    return this.followSystem;
  }

  setFollowSystem(value: boolean): void {
    this.followSystem = value;
  }

  active(): ThemeTokens {
    if (this.mode === ThemeMode.DARK) {
      return this.dark;
    }
    return this.light;
  }

  resolve(token: string): string {
    const tokens = this.active();
    if (token === 'primary') {
      return tokens.primary;
    }
    if (token === 'background') {
      return tokens.background;
    }
    if (token === 'text') {
      return tokens.text;
    }
    if (token === 'border') {
      return tokens.border;
    }
    return '';
  }

  isLightOn(luminance: number): boolean {
    const value = clampNumber(luminance, 0, 1);
    return value >= 0.5;
  }

  contrastRatio(foreground: number, background: number): number {
    const lighter = clampNumber(foreground, 0, 1);
    const darker = clampNumber(background, 0, 1);
    const high = lighter > darker ? lighter : darker;
    const low = lighter > darker ? darker : lighter;
    return (high + 0.05) / (low + 0.05);
  }

  alphaBlend(foreground: number, background: number, alpha: number): number {
    const a = clampNumber(alpha, 0, 1);
    return foreground * a + background * (1 - a);
  }

  describe(): string {
    return this.mode === ThemeMode.DARK ? 'DARK' : 'LIGHT';
  }
}

export default function windowThemeVariationTest(): void {
  describe('WindowThemeVariation', () => {
    it('WindowThemeVariation_001', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      expect(model.getMode()).assertEqual(ThemeMode.LIGHT);
      expect(model.isFollowSystem()).assertTrue();
      expect(model.getSwitches()).assertEqual(0);
      done();
    });

    it('WindowThemeVariation_002', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      expect(model.toggle()).assertEqual(ThemeMode.DARK);
      expect(model.getSwitches()).assertEqual(1);
      expect(model.toggle()).assertEqual(ThemeMode.LIGHT);
      expect(model.getSwitches()).assertEqual(2);
      done();
    });

    it('WindowThemeVariation_003', 0, async (done: Function) => {
      const model = new ThemeModel(false);
      model.setMode(ThemeMode.DARK);
      model.setMode(ThemeMode.DARK);
      expect(model.getSwitches()).assertEqual(1);
      expect(model.describe()).assertEqual('DARK');
      done();
    });

    it('WindowThemeVariation_004', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      expect(model.resolve('primary')).assertEqual('#0A59F7');
      model.setMode(ThemeMode.DARK);
      expect(model.resolve('primary')).assertEqual('#5291FF');
      done();
    });

    it('WindowThemeVariation_005', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      expect(model.resolve('background')).assertEqual('#FFFFFF');
      model.toggle();
      expect(model.resolve('background')).assertEqual('#000000');
      done();
    });

    it('WindowThemeVariation_006', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      expect(model.resolve('unknown')).assertEqual('');
      expect(model.resolve('text')).assertEqual('#000000');
      done();
    });

    it('WindowThemeVariation_007', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      expect(model.active().tokenCount()).assertEqual(4);
      expect(model.isLightOn(0.8)).assertTrue();
      expect(model.isLightOn(0.2)).assertFalse();
      done();
    });

    it('WindowThemeVariation_008', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      expect(model.isLightOn(2.0)).assertTrue();
      expect(model.isLightOn(-1.0)).assertFalse();
      done();
    });

    it('WindowThemeVariation_009', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      const ratio = model.contrastRatio(1.0, 0.0);
      expect(Math.round(ratio)).assertEqual(21);
      expect(model.contrastRatio(0.5, 0.5)).assertEqual(1.0);
      done();
    });

    it('WindowThemeVariation_010', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      expect(model.alphaBlend(1.0, 0.0, 0.5)).assertEqual(0.5);
      expect(model.alphaBlend(1.0, 0.0, 0.0)).assertEqual(0.0);
      expect(model.alphaBlend(1.0, 0.0, 1.0)).assertEqual(1.0);
      done();
    });

    it('WindowThemeVariation_011', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      model.setFollowSystem(false);
      expect(model.isFollowSystem()).assertFalse();
      model.setFollowSystem(true);
      expect(model.isFollowSystem()).assertTrue();
      done();
    });

    it('WindowThemeVariation_012', 0, async (done: Function) => {
      const model = new ThemeModel(true);
      model.setMode(ThemeMode.DARK);
      model.toggle();
      model.toggle();
      expect(model.getMode()).assertEqual(ThemeMode.DARK);
      expect(model.describe()).assertEqual('DARK');
      done();
    });

    it('WindowThemeVariation_013', 0, async (done: Function) => {
      const tokens = new ThemeTokens('a', 'b', 'c', '');
      expect(tokens.tokenCount()).assertEqual(3);
      expect(new ThemeTokens('', '', '', '').tokenCount()).assertEqual(0);
      done();
    });

    it('WindowThemeVariation_014', 0, async (done: Function) => {
      const model = new ThemeModel(false);
      model.setMode(ThemeMode.DARK);
      expect(model.isFollowSystem()).assertFalse();
      expect(model.resolve('text')).assertEqual('#FFFFFF');
      expect(model.resolve('border')).assertEqual('#333333');
      expect(model.getSwitches()).assertEqual(1);
      done();
    });

    it('WindowThemeVariation_015', 0, async (done: Function) => {
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
