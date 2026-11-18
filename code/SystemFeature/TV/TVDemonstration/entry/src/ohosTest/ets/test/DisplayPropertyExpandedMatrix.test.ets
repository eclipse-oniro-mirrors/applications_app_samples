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

import { beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { display } from '@kit.ArkUI';
import { AsyncCallback } from '@kit.BasicServicesKit';
import { keepMainThreadResponsive } from './MainThreadYield';


function buildExpandedDisplay(width: number, height: number, densityDPI: number,
  densityPixels: number): display.Display {
  return {
    id: 7,
    name: 'expanded-display-stub',
    alive: true,
    state: display.DisplayState.STATE_ON,
    refreshRate: 120,
    rotation: 1,
    width: width,
    height: height,
    availableWidth: width,
    availableHeight: height,
    densityDPI: densityDPI,
    orientation: display.Orientation.LANDSCAPE,
    densityPixels: densityPixels,
    scaledDensity: densityPixels,
    xDPI: densityDPI,
    yDPI: densityDPI,
    screenShape: display.ScreenShape.RECTANGLE,
    colorSpaces: [],
    hdrFormats: [],
    getCutoutInfo(): Promise<display.CutoutInfo> {
      return Promise.resolve({
        boundingRects: [],
        waterfallDisplayAreaRects: {
          left: {
            left: 0,
            top: 0,
            width: 0,
            height: 0
          } as display.Rect,
          top: {
            left: 0,
            top: 0,
            width: 0,
            height: 0
          } as display.Rect,
          right: {
            left: 0,
            top: 0,
            width: 0,
            height: 0
          } as display.Rect,
          bottom: {
            left: 0,
            top: 0,
            width: 0,
            height: 0
          } as display.Rect
        } as display.WaterfallDisplayAreaRects
      } as display.CutoutInfo);
    },
    getAvailableArea(): Promise<display.Rect> {
      return Promise.resolve({
        left: 0,
        top: 0,
        width: width,
        height: height
      } as display.Rect);
    },
    on(type: 'availableAreaChange', callback: Callback<display.Rect>): void {
    },
    off(type: 'availableAreaChange', callback?: Callback<display.Rect>): void {
    },
    getDisplayCapability(): string {
      return 'expanded-display-stub';
    },
    hasImmersiveWindow(callback?: AsyncCallback<boolean>): Promise<boolean> {
      return Promise.resolve(false);
    }
  } as display.Display;
}

export default function displayPropertyExpandedMatrixTest(): void {
  describe('DisplayPropertyExpandedMatrixTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    let live: display.Display;

    beforeAll((): void => {
      live = display.getDefaultDisplaySync();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_1000
     * @tc.name displayMockExpanded000
     * @tc.desc Verify mock display 1920x1080, dpi 160.0, density 1.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded000', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1920, 1080, 160.0, 1.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(1080);
      expect(stub.availableWidth).assertEqual(1920);
      expect(stub.availableHeight).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(stub.scaledDensity).assertEqual(1.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_1100
     * @tc.name displayMockExpanded001
     * @tc.desc Verify mock display 1280x1080, dpi 160.0, density 1.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded001', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1280, 1080, 160.0, 1.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(1080);
      expect(stub.availableWidth).assertEqual(1280);
      expect(stub.availableHeight).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(stub.scaledDensity).assertEqual(1.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_1200
     * @tc.name displayMockExpanded002
     * @tc.desc Verify mock display 3840x1080, dpi 160.0, density 1.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded002', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(3840, 1080, 160.0, 1.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1080);
      expect(stub.availableWidth).assertEqual(3840);
      expect(stub.availableHeight).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(stub.scaledDensity).assertEqual(1.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_1300
     * @tc.name displayMockExpanded003
     * @tc.desc Verify mock display 2560x1080, dpi 160.0, density 1.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded003', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(2560, 1080, 160.0, 1.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(1080);
      expect(stub.availableWidth).assertEqual(2560);
      expect(stub.availableHeight).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(stub.scaledDensity).assertEqual(1.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_1400
     * @tc.name displayMockExpanded004
     * @tc.desc Verify mock display 1080x720, dpi 160.0, density 1.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded004', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1080, 720, 160.0, 1.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(720);
      expect(stub.availableWidth).assertEqual(1080);
      expect(stub.availableHeight).assertEqual(720);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(stub.scaledDensity).assertEqual(1.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_1500
     * @tc.name displayMockExpanded005
     * @tc.desc Verify mock display 720x720, dpi 160.0, density 1.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded005', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(720, 720, 160.0, 1.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(720);
      expect(stub.availableWidth).assertEqual(720);
      expect(stub.availableHeight).assertEqual(720);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(stub.scaledDensity).assertEqual(1.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_1600
     * @tc.name displayMockExpanded006
     * @tc.desc Verify mock display 1440x720, dpi 240.0, density 1.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded006', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1440, 720, 240.0, 1.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(720);
      expect(stub.availableWidth).assertEqual(1440);
      expect(stub.availableHeight).assertEqual(720);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(stub.scaledDensity).assertEqual(1.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_1700
     * @tc.name displayMockExpanded007
     * @tc.desc Verify mock display 7680x720, dpi 240.0, density 1.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded007', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(7680, 720, 240.0, 1.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(720);
      expect(stub.availableWidth).assertEqual(7680);
      expect(stub.availableHeight).assertEqual(720);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(stub.scaledDensity).assertEqual(1.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_1800
     * @tc.name displayMockExpanded008
     * @tc.desc Verify mock display 320x2160, dpi 240.0, density 1.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded008', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(320, 2160, 240.0, 1.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(2160);
      expect(stub.availableWidth).assertEqual(320);
      expect(stub.availableHeight).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(stub.scaledDensity).assertEqual(1.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_1900
     * @tc.name displayMockExpanded009
     * @tc.desc Verify mock display 640x2160, dpi 240.0, density 1.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded009', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(640, 2160, 240.0, 1.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(2160);
      expect(stub.availableWidth).assertEqual(640);
      expect(stub.availableHeight).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(stub.scaledDensity).assertEqual(1.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_2000
     * @tc.name displayMockExpanded010
     * @tc.desc Verify mock display 1920x2160, dpi 240.0, density 1.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded010', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1920, 2160, 240.0, 1.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(2160);
      expect(stub.availableWidth).assertEqual(1920);
      expect(stub.availableHeight).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(stub.scaledDensity).assertEqual(1.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_2100
     * @tc.name displayMockExpanded011
     * @tc.desc Verify mock display 1280x2160, dpi 240.0, density 1.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded011', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1280, 2160, 240.0, 1.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(2160);
      expect(stub.availableWidth).assertEqual(1280);
      expect(stub.availableHeight).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(stub.scaledDensity).assertEqual(1.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_2200
     * @tc.name displayMockExpanded012
     * @tc.desc Verify mock display 3840x1440, dpi 320.0, density 1.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded012', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(3840, 1440, 320.0, 1.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1440);
      expect(stub.availableWidth).assertEqual(3840);
      expect(stub.availableHeight).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(stub.scaledDensity).assertEqual(1.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_2300
     * @tc.name displayMockExpanded013
     * @tc.desc Verify mock display 2560x1440, dpi 320.0, density 1.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded013', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(2560, 1440, 320.0, 1.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(1440);
      expect(stub.availableWidth).assertEqual(2560);
      expect(stub.availableHeight).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(stub.scaledDensity).assertEqual(1.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_2400
     * @tc.name displayMockExpanded014
     * @tc.desc Verify mock display 1080x1440, dpi 320.0, density 1.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded014', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1080, 1440, 320.0, 1.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(1440);
      expect(stub.availableWidth).assertEqual(1080);
      expect(stub.availableHeight).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(stub.scaledDensity).assertEqual(1.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_2500
     * @tc.name displayMockExpanded015
     * @tc.desc Verify mock display 720x1440, dpi 320.0, density 1.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded015', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(720, 1440, 320.0, 1.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(1440);
      expect(stub.availableWidth).assertEqual(720);
      expect(stub.availableHeight).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(stub.scaledDensity).assertEqual(1.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_2600
     * @tc.name displayMockExpanded016
     * @tc.desc Verify mock display 1440x1920, dpi 320.0, density 1.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded016', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1440, 1920, 320.0, 1.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(1920);
      expect(stub.availableWidth).assertEqual(1440);
      expect(stub.availableHeight).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(stub.scaledDensity).assertEqual(1.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_2700
     * @tc.name displayMockExpanded017
     * @tc.desc Verify mock display 7680x1920, dpi 320.0, density 1.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded017', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(7680, 1920, 320.0, 1.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(1920);
      expect(stub.availableWidth).assertEqual(7680);
      expect(stub.availableHeight).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(stub.scaledDensity).assertEqual(1.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_2800
     * @tc.name displayMockExpanded018
     * @tc.desc Verify mock display 320x1920, dpi 213.0, density 2.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded018', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(320, 1920, 213.0, 2.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(1920);
      expect(stub.availableWidth).assertEqual(320);
      expect(stub.availableHeight).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(stub.scaledDensity).assertEqual(2.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_2900
     * @tc.name displayMockExpanded019
     * @tc.desc Verify mock display 640x1920, dpi 213.0, density 2.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded019', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(640, 1920, 213.0, 2.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(1920);
      expect(stub.availableWidth).assertEqual(640);
      expect(stub.availableHeight).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(stub.scaledDensity).assertEqual(2.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_3000
     * @tc.name displayMockExpanded020
     * @tc.desc Verify mock display 1920x1280, dpi 213.0, density 2.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded020', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1920, 1280, 213.0, 2.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(1280);
      expect(stub.availableWidth).assertEqual(1920);
      expect(stub.availableHeight).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(stub.scaledDensity).assertEqual(2.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_3100
     * @tc.name displayMockExpanded021
     * @tc.desc Verify mock display 1280x1280, dpi 213.0, density 2.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded021', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1280, 1280, 213.0, 2.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(1280);
      expect(stub.availableWidth).assertEqual(1280);
      expect(stub.availableHeight).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(stub.scaledDensity).assertEqual(2.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_3200
     * @tc.name displayMockExpanded022
     * @tc.desc Verify mock display 3840x1280, dpi 213.0, density 2.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded022', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(3840, 1280, 213.0, 2.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1280);
      expect(stub.availableWidth).assertEqual(3840);
      expect(stub.availableHeight).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(stub.scaledDensity).assertEqual(2.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_3300
     * @tc.name displayMockExpanded023
     * @tc.desc Verify mock display 2560x1280, dpi 213.0, density 2.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded023', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(2560, 1280, 213.0, 2.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(1280);
      expect(stub.availableWidth).assertEqual(2560);
      expect(stub.availableHeight).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(stub.scaledDensity).assertEqual(2.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_3400
     * @tc.name displayMockExpanded024
     * @tc.desc Verify mock display 1080x2560, dpi 400.0, density 2.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded024', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1080, 2560, 400.0, 2.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(2560);
      expect(stub.availableWidth).assertEqual(1080);
      expect(stub.availableHeight).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(stub.scaledDensity).assertEqual(2.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_3500
     * @tc.name displayMockExpanded025
     * @tc.desc Verify mock display 720x2560, dpi 400.0, density 2.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded025', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(720, 2560, 400.0, 2.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(2560);
      expect(stub.availableWidth).assertEqual(720);
      expect(stub.availableHeight).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(stub.scaledDensity).assertEqual(2.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_3600
     * @tc.name displayMockExpanded026
     * @tc.desc Verify mock display 1440x2560, dpi 400.0, density 2.0 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded026', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1440, 2560, 400.0, 2.0);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(2560);
      expect(stub.availableWidth).assertEqual(1440);
      expect(stub.availableHeight).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(stub.scaledDensity).assertEqual(2.0);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_3700
     * @tc.name displayMockExpanded027
     * @tc.desc Verify mock display 7680x2560, dpi 400.0, density 2.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded027', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(7680, 2560, 400.0, 2.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(2560);
      expect(stub.availableWidth).assertEqual(7680);
      expect(stub.availableHeight).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(stub.scaledDensity).assertEqual(2.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_3800
     * @tc.name displayMockExpanded028
     * @tc.desc Verify mock display 320x4320, dpi 400.0, density 2.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded028', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(320, 4320, 400.0, 2.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(4320);
      expect(stub.availableWidth).assertEqual(320);
      expect(stub.availableHeight).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(stub.scaledDensity).assertEqual(2.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_3900
     * @tc.name displayMockExpanded029
     * @tc.desc Verify mock display 640x4320, dpi 400.0, density 2.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded029', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(640, 4320, 400.0, 2.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(4320);
      expect(stub.availableWidth).assertEqual(640);
      expect(stub.availableHeight).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(stub.scaledDensity).assertEqual(2.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_4000
     * @tc.name displayMockExpanded030
     * @tc.desc Verify mock display 1920x4320, dpi 266.667, density 2.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded030', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1920, 4320, 266.667, 2.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(4320);
      expect(stub.availableWidth).assertEqual(1920);
      expect(stub.availableHeight).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(stub.scaledDensity).assertEqual(2.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_4100
     * @tc.name displayMockExpanded031
     * @tc.desc Verify mock display 1280x4320, dpi 266.667, density 2.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded031', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1280, 4320, 266.667, 2.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(4320);
      expect(stub.availableWidth).assertEqual(1280);
      expect(stub.availableHeight).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(stub.scaledDensity).assertEqual(2.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_4200
     * @tc.name displayMockExpanded032
     * @tc.desc Verify mock display 3840x240, dpi 266.667, density 2.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded032', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(3840, 240, 266.667, 2.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(240);
      expect(stub.availableWidth).assertEqual(3840);
      expect(stub.availableHeight).assertEqual(240);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(stub.scaledDensity).assertEqual(2.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_4300
     * @tc.name displayMockExpanded033
     * @tc.desc Verify mock display 2560x240, dpi 266.667, density 2.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded033', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(2560, 240, 266.667, 2.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(240);
      expect(stub.availableWidth).assertEqual(2560);
      expect(stub.availableHeight).assertEqual(240);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(stub.scaledDensity).assertEqual(2.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_4400
     * @tc.name displayMockExpanded034
     * @tc.desc Verify mock display 1080x240, dpi 266.667, density 2.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded034', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1080, 240, 266.667, 2.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(240);
      expect(stub.availableWidth).assertEqual(1080);
      expect(stub.availableHeight).assertEqual(240);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(stub.scaledDensity).assertEqual(2.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_4500
     * @tc.name displayMockExpanded035
     * @tc.desc Verify mock display 720x240, dpi 266.667, density 2.5 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded035', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(720, 240, 266.667, 2.5);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(240);
      expect(stub.availableWidth).assertEqual(720);
      expect(stub.availableHeight).assertEqual(240);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(stub.scaledDensity).assertEqual(2.5);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_4600
     * @tc.name displayMockExpanded036
     * @tc.desc Verify mock display 1440x360, dpi 280.0, density 3.125 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded036', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1440, 360, 280.0, 3.125);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(360);
      expect(stub.availableWidth).assertEqual(1440);
      expect(stub.availableHeight).assertEqual(360);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(stub.scaledDensity).assertEqual(3.125);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_4700
     * @tc.name displayMockExpanded037
     * @tc.desc Verify mock display 7680x360, dpi 280.0, density 3.125 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded037', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(7680, 360, 280.0, 3.125);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(360);
      expect(stub.availableWidth).assertEqual(7680);
      expect(stub.availableHeight).assertEqual(360);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(stub.scaledDensity).assertEqual(3.125);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_4800
     * @tc.name displayMockExpanded038
     * @tc.desc Verify mock display 320x360, dpi 280.0, density 3.125 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded038', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(320, 360, 280.0, 3.125);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(360);
      expect(stub.availableWidth).assertEqual(320);
      expect(stub.availableHeight).assertEqual(360);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(stub.scaledDensity).assertEqual(3.125);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_4900
     * @tc.name displayMockExpanded039
     * @tc.desc Verify mock display 640x360, dpi 280.0, density 3.125 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded039', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(640, 360, 280.0, 3.125);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(360);
      expect(stub.availableWidth).assertEqual(640);
      expect(stub.availableHeight).assertEqual(360);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(stub.scaledDensity).assertEqual(3.125);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_5000
     * @tc.name displayMockExpanded040
     * @tc.desc Verify mock display 1920x1080, dpi 280.0, density 3.125 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded040', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1920, 1080, 280.0, 3.125);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(1080);
      expect(stub.availableWidth).assertEqual(1920);
      expect(stub.availableHeight).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(stub.scaledDensity).assertEqual(3.125);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_5100
     * @tc.name displayMockExpanded041
     * @tc.desc Verify mock display 1280x1080, dpi 280.0, density 3.125 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded041', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1280, 1080, 280.0, 3.125);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(1080);
      expect(stub.availableWidth).assertEqual(1280);
      expect(stub.availableHeight).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(stub.scaledDensity).assertEqual(3.125);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_5200
     * @tc.name displayMockExpanded042
     * @tc.desc Verify mock display 3840x1080, dpi 500.0, density 3.125 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded042', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(3840, 1080, 500.0, 3.125);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1080);
      expect(stub.availableWidth).assertEqual(3840);
      expect(stub.availableHeight).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(stub.scaledDensity).assertEqual(3.125);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_5300
     * @tc.name displayMockExpanded043
     * @tc.desc Verify mock display 2560x1080, dpi 500.0, density 3.125 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded043', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(2560, 1080, 500.0, 3.125);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(1080);
      expect(stub.availableWidth).assertEqual(2560);
      expect(stub.availableHeight).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(stub.scaledDensity).assertEqual(3.125);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_5400
     * @tc.name displayMockExpanded044
     * @tc.desc Verify mock display 1080x720, dpi 500.0, density 3.125 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded044', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1080, 720, 500.0, 3.125);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(720);
      expect(stub.availableWidth).assertEqual(1080);
      expect(stub.availableHeight).assertEqual(720);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(stub.scaledDensity).assertEqual(3.125);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_5500
     * @tc.name displayMockExpanded045
     * @tc.desc Verify mock display 720x720, dpi 500.0, density 1.3333 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded045', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(720, 720, 500.0, 1.3333);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(720);
      expect(stub.availableWidth).assertEqual(720);
      expect(stub.availableHeight).assertEqual(720);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(stub.scaledDensity).assertEqual(1.3333);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_5600
     * @tc.name displayMockExpanded046
     * @tc.desc Verify mock display 1440x720, dpi 500.0, density 1.3333 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded046', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1440, 720, 500.0, 1.3333);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(720);
      expect(stub.availableWidth).assertEqual(1440);
      expect(stub.availableHeight).assertEqual(720);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(stub.scaledDensity).assertEqual(1.3333);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_5700
     * @tc.name displayMockExpanded047
     * @tc.desc Verify mock display 7680x720, dpi 500.0, density 1.3333 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded047', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(7680, 720, 500.0, 1.3333);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(720);
      expect(stub.availableWidth).assertEqual(7680);
      expect(stub.availableHeight).assertEqual(720);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(stub.scaledDensity).assertEqual(1.3333);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_5800
     * @tc.name displayMockExpanded048
     * @tc.desc Verify mock display 320x2160, dpi 96.0, density 1.3333 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded048', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(320, 2160, 96.0, 1.3333);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(2160);
      expect(stub.availableWidth).assertEqual(320);
      expect(stub.availableHeight).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(stub.scaledDensity).assertEqual(1.3333);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_5900
     * @tc.name displayMockExpanded049
     * @tc.desc Verify mock display 640x2160, dpi 96.0, density 1.3333 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded049', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(640, 2160, 96.0, 1.3333);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(2160);
      expect(stub.availableWidth).assertEqual(640);
      expect(stub.availableHeight).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(stub.scaledDensity).assertEqual(1.3333);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_6000
     * @tc.name displayMockExpanded050
     * @tc.desc Verify mock display 1920x2160, dpi 96.0, density 1.3333 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded050', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1920, 2160, 96.0, 1.3333);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(2160);
      expect(stub.availableWidth).assertEqual(1920);
      expect(stub.availableHeight).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(stub.scaledDensity).assertEqual(1.3333);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_6100
     * @tc.name displayMockExpanded051
     * @tc.desc Verify mock display 1280x2160, dpi 96.0, density 1.3333 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded051', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1280, 2160, 96.0, 1.3333);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(2160);
      expect(stub.availableWidth).assertEqual(1280);
      expect(stub.availableHeight).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(stub.scaledDensity).assertEqual(1.3333);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_6200
     * @tc.name displayMockExpanded052
     * @tc.desc Verify mock display 3840x1440, dpi 96.0, density 1.3333 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded052', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(3840, 1440, 96.0, 1.3333);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1440);
      expect(stub.availableWidth).assertEqual(3840);
      expect(stub.availableHeight).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(stub.scaledDensity).assertEqual(1.3333);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_6300
     * @tc.name displayMockExpanded053
     * @tc.desc Verify mock display 2560x1440, dpi 96.0, density 1.3333 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded053', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(2560, 1440, 96.0, 1.3333);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(1440);
      expect(stub.availableWidth).assertEqual(2560);
      expect(stub.availableHeight).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(stub.scaledDensity).assertEqual(1.3333);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_6400
     * @tc.name displayMockExpanded054
     * @tc.desc Verify mock display 1080x1440, dpi 120.0, density 1.6667 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded054', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1080, 1440, 120.0, 1.6667);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(1440);
      expect(stub.availableWidth).assertEqual(1080);
      expect(stub.availableHeight).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(stub.scaledDensity).assertEqual(1.6667);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_6500
     * @tc.name displayMockExpanded055
     * @tc.desc Verify mock display 720x1440, dpi 120.0, density 1.6667 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded055', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(720, 1440, 120.0, 1.6667);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(1440);
      expect(stub.availableWidth).assertEqual(720);
      expect(stub.availableHeight).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(stub.scaledDensity).assertEqual(1.6667);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_6600
     * @tc.name displayMockExpanded056
     * @tc.desc Verify mock display 1440x1920, dpi 120.0, density 1.6667 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded056', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(1440, 1920, 120.0, 1.6667);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(1920);
      expect(stub.availableWidth).assertEqual(1440);
      expect(stub.availableHeight).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(stub.scaledDensity).assertEqual(1.6667);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_6700
     * @tc.name displayMockExpanded057
     * @tc.desc Verify mock display 7680x1920, dpi 120.0, density 1.6667 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded057', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(7680, 1920, 120.0, 1.6667);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(1920);
      expect(stub.availableWidth).assertEqual(7680);
      expect(stub.availableHeight).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(stub.scaledDensity).assertEqual(1.6667);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_6800
     * @tc.name displayMockExpanded058
     * @tc.desc Verify mock display 320x1920, dpi 120.0, density 1.6667 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded058', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(320, 1920, 120.0, 1.6667);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(1920);
      expect(stub.availableWidth).assertEqual(320);
      expect(stub.availableHeight).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(stub.scaledDensity).assertEqual(1.6667);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_6900
     * @tc.name displayMockExpanded059
     * @tc.desc Verify mock display 640x1920, dpi 120.0, density 1.6667 preserves every contract field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayMockExpanded059', 0, (): void => {
      const stub: display.Display = buildExpandedDisplay(640, 1920, 120.0, 1.6667);
      expect(stub.id).assertEqual(7);
      expect(stub.name).assertEqual('expanded-display-stub');
      expect(stub.alive).assertTrue();
      expect(stub.state).assertEqual(display.DisplayState.STATE_ON);
      expect(stub.refreshRate).assertEqual(120);
      expect(stub.rotation).assertEqual(1);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(1920);
      expect(stub.availableWidth).assertEqual(640);
      expect(stub.availableHeight).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(stub.scaledDensity).assertEqual(1.6667);
      expect(stub.orientation).assertEqual(display.Orientation.LANDSCAPE);
      expect(stub.screenShape).assertEqual(display.ScreenShape.RECTANGLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_7000
     * @tc.name displayLiveWidthPositive
     * @tc.desc Verify live default display contract: displayLiveWidthPositive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveWidthPositive', 0, (): void => {
      expect(live.width > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_7100
     * @tc.name displayLiveHeightPositive
     * @tc.desc Verify live default display contract: displayLiveHeightPositive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveHeightPositive', 0, (): void => {
      expect(live.height > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_7200
     * @tc.name displayLiveAvailableWithinBounds
     * @tc.desc Verify live default display contract: displayLiveAvailableWithinBounds
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveAvailableWithinBounds', 0, (): void => {
      expect(live.availableWidth >= 0).assertTrue();
      expect(live.availableHeight >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_7300
     * @tc.name displayLiveAvailableNotWider
     * @tc.desc Verify live default display contract: displayLiveAvailableNotWider
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveAvailableNotWider', 0, (): void => {
      expect(live.availableWidth <= live.width).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_7400
     * @tc.name displayLiveAvailableNotTaller
     * @tc.desc Verify live default display contract: displayLiveAvailableNotTaller
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveAvailableNotTaller', 0, (): void => {
      expect(live.availableHeight <= live.height).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_7500
     * @tc.name displayLiveDensityDPIPositive
     * @tc.desc Verify live default display contract: displayLiveDensityDPIPositive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveDensityDPIPositive', 0, (): void => {
      expect(live.densityDPI > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_7600
     * @tc.name displayLiveDensityPixelsPositive
     * @tc.desc Verify live default display contract: displayLiveDensityPixelsPositive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveDensityPixelsPositive', 0, (): void => {
      expect(live.densityPixels > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_7700
     * @tc.name displayLiveScaledDensityPositive
     * @tc.desc Verify live default display contract: displayLiveScaledDensityPositive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveScaledDensityPositive', 0, (): void => {
      expect(live.scaledDensity > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_7800
     * @tc.name displayLiveXDPIPositive
     * @tc.desc Verify live default display contract: displayLiveXDPIPositive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveXDPIPositive', 0, (): void => {
      expect(live.xDPI > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_7900
     * @tc.name displayLiveYDPIPositive
     * @tc.desc Verify live default display contract: displayLiveYDPIPositive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveYDPIPositive', 0, (): void => {
      expect(live.yDPI > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_8000
     * @tc.name displayLiveIdNonNegative
     * @tc.desc Verify live default display contract: displayLiveIdNonNegative
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveIdNonNegative', 0, (): void => {
      expect(live.id >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_8100
     * @tc.name displayLiveNamePresent
     * @tc.desc Verify live default display contract: displayLiveNamePresent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveNamePresent', 0, (): void => {
      expect(live.name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_8200
     * @tc.name displayLiveRefreshRatePositive
     * @tc.desc Verify live default display contract: displayLiveRefreshRatePositive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveRefreshRatePositive', 0, (): void => {
      expect(live.refreshRate > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_8300
     * @tc.name displayLiveRotationValid
     * @tc.desc Verify live default display contract: displayLiveRotationValid
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveRotationValid', 0, (): void => {
      expect(live.rotation >= 0 && live.rotation <= 3).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_8400
     * @tc.name displayLiveAliveBoolean
     * @tc.desc Verify live default display contract: displayLiveAliveBoolean
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveAliveBoolean', 0, (): void => {
      expect(typeof live.alive).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_8500
     * @tc.name displayLiveColorSpacesArray
     * @tc.desc Verify live default display contract: displayLiveColorSpacesArray
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveColorSpacesArray', 0, (): void => {
      expect(Array.isArray(live.colorSpaces)).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_8600
     * @tc.name displayLiveHdrFormatsArray
     * @tc.desc Verify live default display contract: displayLiveHdrFormatsArray
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveHdrFormatsArray', 0, (): void => {
      expect(Array.isArray(live.hdrFormats)).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_8700
     * @tc.name displayLiveShapeDefined
     * @tc.desc Verify live default display contract: displayLiveShapeDefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveShapeDefined', 0, (): void => {
      expect(live.screenShape !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_8800
     * @tc.name displayLiveOrientationDefined
     * @tc.desc Verify live default display contract: displayLiveOrientationDefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveOrientationDefined', 0, (): void => {
      expect(live.orientation !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EXPANDED_8900
     * @tc.name displayLiveStateDefined
     * @tc.desc Verify live default display contract: displayLiveStateDefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayLiveStateDefined', 0, (): void => {
      expect(live.state !== undefined).assertTrue();
    });

  });
}
