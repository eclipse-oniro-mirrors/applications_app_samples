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

const DESIGN_WIDTH: number = 1920;

const DESIGN_HEIGHT: number = 1080;

const BASE_FONT_SIZE: number = 16;

const MIN_FONT_SIZE: number = 12;

const MAX_FONT_SIZE: number = 48;

const COMPACT_MAX_WIDTH: number = 720;

const MEDIUM_MAX_WIDTH: number = 1280;

const LAYOUT_COMPACT: string = 'compact';

const LAYOUT_MEDIUM: string = 'medium';

const LAYOUT_EXPANDED: string = 'expanded';

interface ScaleProfile {
  designWidth: number;
  screenWidth: number;
  screenHeight: number;
  density: number;
}

// Converts design values into device pixels
class ContentScaler {
  public static scaleOf(profile: ScaleProfile): number {
    if (profile.designWidth <= 0) {
      return 1;
    }
    return profile.screenWidth / profile.designWidth;
  }

  public static vp2px(value: number, profile: ScaleProfile): number {
    return Math.round(value * profile.density);
  }

  public static px2vp(value: number, profile: ScaleProfile): number {
    if (profile.density <= 0) {
      return 0;
    }
    return value / profile.density;
  }

  public static scaled(value: number, profile: ScaleProfile): number {
    return Math.round(value * ContentScaler.scaleOf(profile));
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public static safeScaled(value: number, profile: ScaleProfile): number {
    return ContentScaler.clamp(ContentScaler.scaled(value, profile), 0, profile.screenWidth);
  }
}

// Scales font sizes and decides text overflow behavior
class TextScaler {
  public static scaledFont(baseSize: number, fontScale: number): number {
    const scaled = Math.round(baseSize * fontScale);
    return ContentScaler.clamp(scaled, MIN_FONT_SIZE, MAX_FONT_SIZE);
  }

  public static isOverflow(textLength: number, charCapacity: number): boolean {
    return charCapacity > 0 && textLength > charCapacity;
  }

  public static charCapacity(width: number, fontSize: number): number {
    if (fontSize <= 0 || width <= 0) {
      return 0;
    }
    return Math.floor(width / fontSize);
  }

  public static visibleText(text: string, capacity: number): string {
    if (capacity <= 0) {
      return '';
    }
    if (text.length <= capacity) {
      return text;
    }
    return text.substring(0, capacity);
  }

  public static maxLines(availableHeight: number, lineHeight: number): number {
    if (lineHeight <= 0 || availableHeight <= 0) {
      return 0;
    }
    return Math.floor(availableHeight / lineHeight);
  }
}

// Chooses a named layout tier from width
class LayoutBreakpoints {
  public static layoutFor(width: number): string {
    if (width <= 0) {
      return LAYOUT_COMPACT;
    }
    if (width <= COMPACT_MAX_WIDTH) {
      return LAYOUT_COMPACT;
    }
    if (width <= MEDIUM_MAX_WIDTH) {
      return LAYOUT_MEDIUM;
    }
    return LAYOUT_EXPANDED;
  }

  public static columnsFor(width: number): number {
    const layout = LayoutBreakpoints.layoutFor(width);
    if (layout === LAYOUT_COMPACT) {
      return 1;
    }
    if (layout === LAYOUT_MEDIUM) {
      return 2;
    }
    return 4;
  }

  public static isWide(width: number): boolean {
    return LayoutBreakpoints.layoutFor(width) === LAYOUT_EXPANDED;
  }

  public static paddingFor(width: number): number {
    return Math.round(width * 0.05);
  }
}

// Audits scaled values against safe bounds
class ScalingAudit {
  public static isPaddingSafe(padding: number, width: number): boolean {
    return padding >= 0 && padding * 2 < width;
  }

  public static isFontSafe(fontSize: number): boolean {
    return fontSize >= MIN_FONT_SIZE && fontSize <= MAX_FONT_SIZE;
  }

  public static audit(profile: ScaleProfile, fontScale: number): string[] {
    const failures: string[] = [];
    const scale = ContentScaler.scaleOf(profile);
    if (!ScaleProfileFactory.isValid(profile) || scale <= 0) {
      failures.push('scale');
    }
    if (!ScalingAudit.isPaddingSafe(LayoutBreakpoints.paddingFor(profile.screenWidth), profile.screenWidth)) {
      failures.push('padding');
    }
    if (!ScalingAudit.isFontSafe(TextScaler.scaledFont(BASE_FONT_SIZE, fontScale))) {
      failures.push('font');
    }
    return failures;
  }
}

// Produces scale profiles for common TV resolutions
class ScaleProfileFactory {
  public static hd(): ScaleProfile {
    return { designWidth: DESIGN_WIDTH, screenWidth: 1280, screenHeight: 720, density: 1 };
  }

  public static fullHd(): ScaleProfile {
    return { designWidth: DESIGN_WIDTH, screenWidth: 1920, screenHeight: 1080, density: 1 };
  }

  public static uhd(): ScaleProfile {
    return { designWidth: DESIGN_WIDTH, screenWidth: 3840, screenHeight: 2160, density: 2 };
  }

  public static invalid(): ScaleProfile {
    return { designWidth: 0, screenWidth: 0, screenHeight: 0, density: 0 };
  }

  public static isValid(profile: ScaleProfile): boolean {
    return profile.designWidth > 0 && profile.screenWidth > 0 &&
      profile.screenHeight > 0 && profile.density > 0;
  }
}

export default function contentScalingTest() {
  describe('ContentScaling_Test', () => {

    it('profile_factory_should_build_valid_profiles', 0, () => {
      expect(ScaleProfileFactory.isValid(ScaleProfileFactory.hd())).assertTrue();
      expect(ScaleProfileFactory.isValid(ScaleProfileFactory.fullHd())).assertTrue();
      expect(ScaleProfileFactory.isValid(ScaleProfileFactory.uhd())).assertTrue();
      expect(ScaleProfileFactory.isValid(ScaleProfileFactory.invalid())).assertFalse();
      expect(ScaleProfileFactory.fullHd().screenWidth).assertEqual(DESIGN_WIDTH);
      expect(DESIGN_HEIGHT).assertEqual(1080);
    });

    it('scaler_should_compute_scale_ratio', 0, () => {
      expect(ContentScaler.scaleOf(ScaleProfileFactory.hd())).assertEqual(1280 / DESIGN_WIDTH);
      expect(ContentScaler.scaleOf(ScaleProfileFactory.fullHd())).assertEqual(1);
      expect(ContentScaler.scaleOf(ScaleProfileFactory.uhd())).assertEqual(2);
      expect(ContentScaler.scaleOf(ScaleProfileFactory.invalid())).assertEqual(1);
    });

    it('scaler_should_convert_vp_and_px', 0, () => {
      const profile = ScaleProfileFactory.uhd();
      expect(ContentScaler.vp2px(10, profile)).assertEqual(20);
      expect(ContentScaler.px2vp(20, profile)).assertEqual(10);
      const invalid = ScaleProfileFactory.invalid();
      expect(ContentScaler.px2vp(20, invalid)).assertEqual(0);
      expect(ContentScaler.vp2px(0, profile)).assertEqual(0);
    });

    it('scaler_should_scale_design_values', 0, () => {
      const uhd = ScaleProfileFactory.uhd();
      expect(ContentScaler.scaled(100, uhd)).assertEqual(200);
      expect(ContentScaler.scaled(100, ScaleProfileFactory.hd())).assertEqual(67);
      expect(ContentScaler.scaled(0, uhd)).assertEqual(0);
      expect(ContentScaler.safeScaled(2000, uhd)).assertEqual(uhd.screenWidth);
      expect(ContentScaler.safeScaled(-10, uhd)).assertEqual(0);
    });

    it('scaler_should_clamp_values', 0, () => {
      expect(ContentScaler.clamp(-5, 0, 100)).assertEqual(0);
      expect(ContentScaler.clamp(150, 0, 100)).assertEqual(100);
      expect(ContentScaler.clamp(50, 0, 100)).assertEqual(50);
      expect(ContentScaler.clamp(0, 0, 0)).assertEqual(0);
    });

    it('text_scaler_should_bound_font_size', 0, () => {
      expect(TextScaler.scaledFont(16, 1)).assertEqual(16);
      expect(TextScaler.scaledFont(16, 2)).assertEqual(32);
      expect(TextScaler.scaledFont(10, 1)).assertEqual(MIN_FONT_SIZE);
      expect(TextScaler.scaledFont(40, 2)).assertEqual(MAX_FONT_SIZE);
      expect(ScalingAudit.isFontSafe(TextScaler.scaledFont(16, 1))).assertTrue();
    });

    it('text_scaler_should_compute_capacity', 0, () => {
      expect(TextScaler.charCapacity(160, 16)).assertEqual(10);
      expect(TextScaler.charCapacity(0, 16)).assertEqual(0);
      expect(TextScaler.charCapacity(160, 0)).assertEqual(0);
      expect(TextScaler.isOverflow(12, 10)).assertTrue();
      expect(TextScaler.isOverflow(10, 10)).assertFalse();
      expect(TextScaler.isOverflow(10, 0)).assertFalse();
    });

    it('text_scaler_should_truncate_text', 0, () => {
      expect(TextScaler.visibleText('abcdefghij', 4)).assertEqual('abcd');
      expect(TextScaler.visibleText('abc', 4)).assertEqual('abc');
      expect(TextScaler.visibleText('abc', 0)).assertEqual('');
      expect(TextScaler.visibleText('abc', -1)).assertEqual('');
    });

    it('text_scaler_should_compute_max_lines', 0, () => {
      expect(TextScaler.maxLines(100, 20)).assertEqual(5);
      expect(TextScaler.maxLines(90, 20)).assertEqual(4);
      expect(TextScaler.maxLines(0, 20)).assertEqual(0);
      expect(TextScaler.maxLines(100, 0)).assertEqual(0);
    });

    it('breakpoints_should_select_layout', 0, () => {
      expect(LayoutBreakpoints.layoutFor(0)).assertEqual(LAYOUT_COMPACT);
      expect(LayoutBreakpoints.layoutFor(720)).assertEqual(LAYOUT_COMPACT);
      expect(LayoutBreakpoints.layoutFor(721)).assertEqual(LAYOUT_MEDIUM);
      expect(LayoutBreakpoints.layoutFor(1280)).assertEqual(LAYOUT_MEDIUM);
      expect(LayoutBreakpoints.layoutFor(1281)).assertEqual(LAYOUT_EXPANDED);
      expect(LayoutBreakpoints.columnsFor(1920)).assertEqual(4);
      expect(LayoutBreakpoints.columnsFor(1000)).assertEqual(2);
      expect(LayoutBreakpoints.columnsFor(600)).assertEqual(1);
    });

    it('breakpoints_should_compute_padding', 0, () => {
      expect(LayoutBreakpoints.paddingFor(1920)).assertEqual(96);
      expect(LayoutBreakpoints.paddingFor(0)).assertEqual(0);
      expect(LayoutBreakpoints.isWide(1920)).assertTrue();
      expect(LayoutBreakpoints.isWide(1080)).assertFalse();
      expect(ScalingAudit.isPaddingSafe(LayoutBreakpoints.paddingFor(1920), 1920)).assertTrue();
    });

    it('audit_should_pass_valid_profiles', 0, () => {
      const profiles: ScaleProfile[] = [
        ScaleProfileFactory.hd(),
        ScaleProfileFactory.fullHd(),
        ScaleProfileFactory.uhd()
      ];
      for (let i = 0; i < profiles.length; i++) {
        expect(ScalingAudit.audit(profiles[i], 1).length).assertEqual(0);
      }
      expect(ScalingAudit.audit(ScaleProfileFactory.invalid(), 1).includes('scale')).assertTrue();
    });

    it('scaling_constants_should_be_stable', 0, () => {
      expect(DESIGN_WIDTH).assertEqual(1920);
      expect(DESIGN_HEIGHT).assertEqual(1080);
      expect(BASE_FONT_SIZE).assertEqual(16);
      expect(MIN_FONT_SIZE).assertEqual(12);
      expect(MAX_FONT_SIZE).assertEqual(48);
      expect(COMPACT_MAX_WIDTH).assertEqual(720);
      expect(MEDIUM_MAX_WIDTH).assertEqual(1280);
      expect(LAYOUT_EXPANDED).assertEqual('expanded');
    });
  });
}

