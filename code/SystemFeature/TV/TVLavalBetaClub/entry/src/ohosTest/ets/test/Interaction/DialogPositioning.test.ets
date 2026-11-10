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

const SCREEN_WIDTH: number = 1920;

const SCREEN_HEIGHT: number = 1080;

const DIALOG_WIDTH: number = 800;

const DIALOG_HEIGHT: number = 500;

const SAFE_MARGIN: number = 48;

const ALIGN_CENTER: string = 'center';

const ALIGN_ABOVE: string = 'above';

const ALIGN_BELOW: string = 'below';

const ALIGN_LEFT: string = 'left';

const ALIGN_RIGHT: string = 'right';

interface Rect {
  x: number;
  y: number;
  width: number;
  height: number;
}

interface Anchor {
  x: number;
  y: number;
  width: number;
  height: number;
}

// Computes dialog rectangles inside the screen safe area
class DialogPositioner {
  public static center(screenWidth: number, screenHeight: number,
    dialogWidth: number, dialogHeight: number): Rect {
    return {
      x: Math.round((screenWidth - dialogWidth) / 2),
      y: Math.round((screenHeight - dialogHeight) / 2),
      width: dialogWidth,
      height: dialogHeight
    };
  }

  public static clampToScreen(rect: Rect, screenWidth: number, screenHeight: number,
    margin: number = SAFE_MARGIN): Rect {
    let x = rect.x;
    let y = rect.y;
    if (x < margin) {
      x = margin;
    }
    if (y < margin) {
      y = margin;
    }
    const maxX = screenWidth - rect.width - margin;
    const maxY = screenHeight - rect.height - margin;
    if (x > maxX) {
      x = maxX < margin ? margin : maxX;
    }
    if (y > maxY) {
      y = maxY < margin ? margin : maxY;
    }
    return { x: x, y: y, width: rect.width, height: rect.height };
  }

  public static resolveAbove(anchor: Anchor, dialogWidth: number,
    dialogHeight: number, gap: number): Rect {
    return {
      x: Math.round(anchor.x + anchor.width / 2 - dialogWidth / 2),
      y: anchor.y - dialogHeight - gap,
      width: dialogWidth,
      height: dialogHeight
    };
  }

  public static resolveBelow(anchor: Anchor, dialogWidth: number,
    dialogHeight: number, gap: number): Rect {
    return {
      x: Math.round(anchor.x + anchor.width / 2 - dialogWidth / 2),
      y: anchor.y + anchor.height + gap,
      width: dialogWidth,
      height: dialogHeight
    };
  }

  public static resolveLeft(anchor: Anchor, dialogWidth: number, gap: number): Rect {
    return {
      x: anchor.x - dialogWidth - gap,
      y: anchor.y,
      width: dialogWidth,
      height: 0
    };
  }

  public static resolveRight(anchor: Anchor, dialogWidth: number, gap: number): Rect {
    return {
      x: anchor.x + anchor.width + gap,
      y: anchor.y,
      width: dialogWidth,
      height: 0
    };
  }
}

// Validates that dialog rectangles are fully visible
class PositionValidator {
  public static isInsideScreen(rect: Rect, screenWidth: number, screenHeight: number): boolean {
    return rect.x >= 0 && rect.y >= 0 &&
      rect.x + rect.width <= screenWidth && rect.y + rect.height <= screenHeight;
  }

  public static respectsMargin(rect: Rect, screenWidth: number, screenHeight: number,
    margin: number): boolean {
    return rect.x >= margin && rect.y >= margin &&
      rect.x + rect.width <= screenWidth - margin &&
      rect.y + rect.height <= screenHeight - margin;
  }

  public static overlaps(first: Rect, second: Rect): boolean {
    return first.x < second.x + second.width && second.x < first.x + first.width &&
      first.y < second.y + second.height && second.y < first.y + first.height;
  }

  public static isCentered(rect: Rect, screenWidth: number, screenHeight: number,
    tolerance: number): boolean {
    const expectedX = (screenWidth - rect.width) / 2;
    const expectedY = (screenHeight - rect.height) / 2;
    return Math.abs(rect.x - expectedX) <= tolerance &&
      Math.abs(rect.y - expectedY) <= tolerance;
  }

  public static area(rect: Rect): number {
    return rect.width * rect.height;
  }
}

// Chooses the best alignment when space is limited
class AlignmentResolver {
  public static resolve(anchor: Anchor, dialogHeight: number,
    screenHeight: number, gap: number): string {
    const spaceAbove = anchor.y;
    const spaceBelow = screenHeight - (anchor.y + anchor.height);
    if (spaceAbove >= dialogHeight + gap && spaceAbove >= spaceBelow) {
      return ALIGN_ABOVE;
    }
    if (spaceBelow >= dialogHeight + gap) {
      return ALIGN_BELOW;
    }
    return ALIGN_CENTER;
  }

  public static horizontalFor(anchor: Anchor, dialogWidth: number,
    screenWidth: number): string {
    const spaceLeft = anchor.x;
    const spaceRight = screenWidth - (anchor.x + anchor.width);
    if (spaceLeft >= dialogWidth && spaceLeft >= spaceRight) {
      return ALIGN_LEFT;
    }
    if (spaceRight >= dialogWidth) {
      return ALIGN_RIGHT;
    }
    return ALIGN_CENTER;
  }

  public static isKnown(alignment: string): boolean {
    return alignment === ALIGN_CENTER || alignment === ALIGN_ABOVE ||
      alignment === ALIGN_BELOW || alignment === ALIGN_LEFT || alignment === ALIGN_RIGHT;
  }
}

// Produces the final dialog rectangle for a screen and anchor
class DialogLayoutEngine {
  public static layout(screenWidth: number, screenHeight: number,
    dialogWidth: number, dialogHeight: number, margin: number): Rect {
    const centered = DialogPositioner.center(screenWidth, screenHeight, dialogWidth, dialogHeight);
    return DialogPositioner.clampToScreen(centered, screenWidth, screenHeight, margin);
  }

  public static layoutForAnchor(anchor: Anchor, screenWidth: number, screenHeight: number,
    dialogWidth: number, dialogHeight: number, gap: number, margin: number): Rect {
    const vertical = AlignmentResolver.resolve(anchor, dialogHeight, screenHeight, gap);
    let rect: Rect;
    if (vertical === ALIGN_ABOVE) {
      rect = DialogPositioner.resolveAbove(anchor, dialogWidth, dialogHeight, gap);
    } else if (vertical === ALIGN_BELOW) {
      rect = DialogPositioner.resolveBelow(anchor, dialogWidth, dialogHeight, gap);
    } else {
      rect = DialogPositioner.center(screenWidth, screenHeight, dialogWidth, dialogHeight);
    }
    return DialogPositioner.clampToScreen(rect, screenWidth, screenHeight, margin);
  }

  public static isPlayable(rect: Rect, screenWidth: number, screenHeight: number,
    margin: number): boolean {
    return PositionValidator.isInsideScreen(rect, screenWidth, screenHeight) &&
      PositionValidator.respectsMargin(rect, screenWidth, screenHeight, margin);
  }
}

export default function dialogPositioningTest() {
  describe('DialogPositioning_Test', () => {

    it('positioner_should_center_dialog', 0, () => {
      const rect = DialogPositioner.center(SCREEN_WIDTH, SCREEN_HEIGHT, DIALOG_WIDTH, DIALOG_HEIGHT);
      expect(rect.x).assertEqual(560);
      expect(rect.y).assertEqual(290);
      expect(rect.width).assertEqual(DIALOG_WIDTH);
      expect(rect.height).assertEqual(DIALOG_HEIGHT);
      expect(PositionValidator.isCentered(rect, SCREEN_WIDTH, SCREEN_HEIGHT, 0)).assertTrue();
      expect(PositionValidator.isInsideScreen(rect, SCREEN_WIDTH, SCREEN_HEIGHT)).assertTrue();
    });

    it('positioner_should_clamp_to_margins', 0, () => {
      const topLeft: Rect = { x: 0, y: 0, width: DIALOG_WIDTH, height: DIALOG_HEIGHT };
      const clamped = DialogPositioner.clampToScreen(topLeft, SCREEN_WIDTH, SCREEN_HEIGHT, SAFE_MARGIN);
      expect(clamped.x).assertEqual(SAFE_MARGIN);
      expect(clamped.y).assertEqual(SAFE_MARGIN);
      expect(PositionValidator.respectsMargin(clamped, SCREEN_WIDTH, SCREEN_HEIGHT, SAFE_MARGIN))
        .assertTrue();
    });

    it('positioner_should_clamp_bottom_right', 0, () => {
      const bottomRight: Rect = {
        x: SCREEN_WIDTH - 10, y: SCREEN_HEIGHT - 10, width: DIALOG_WIDTH, height: DIALOG_HEIGHT
      };
      const clamped = DialogPositioner.clampToScreen(bottomRight, SCREEN_WIDTH, SCREEN_HEIGHT, SAFE_MARGIN);
      expect(clamped.x).assertEqual(SCREEN_WIDTH - DIALOG_WIDTH - SAFE_MARGIN);
      expect(clamped.y).assertEqual(SCREEN_HEIGHT - DIALOG_HEIGHT - SAFE_MARGIN);
      expect(PositionValidator.isInsideScreen(clamped, SCREEN_WIDTH, SCREEN_HEIGHT)).assertTrue();
    });

    it('positioner_should_resolve_above_anchor', 0, () => {
      const anchor: Anchor = { x: 800, y: 600, width: 200, height: 60 };
      const rect = DialogPositioner.resolveAbove(anchor, 400, 200, 20);
      expect(rect.x).assertEqual(700);
      expect(rect.y).assertEqual(380);
      expect(rect.width).assertEqual(400);
      expect(rect.height).assertEqual(200);
    });

    it('positioner_should_resolve_below_anchor', 0, () => {
      const anchor: Anchor = { x: 800, y: 300, width: 200, height: 60 };
      const rect = DialogPositioner.resolveBelow(anchor, 400, 200, 20);
      expect(rect.x).assertEqual(700);
      expect(rect.y).assertEqual(380);
      expect(rect.y).assertLarger(anchor.y + anchor.height);
    });

    it('positioner_should_resolve_horizontal_sides', 0, () => {
      const anchor: Anchor = { x: 900, y: 400, width: 200, height: 60 };
      const left = DialogPositioner.resolveLeft(anchor, 300, 20);
      expect(left.x).assertEqual(580);
      expect(left.y).assertEqual(400);
      const right = DialogPositioner.resolveRight(anchor, 300, 20);
      expect(right.x).assertEqual(1120);
      expect(right.x).assertLarger(anchor.x + anchor.width);
    });

    it('validator_should_detect_out_of_bounds', 0, () => {
      const rect: Rect = { x: 1900, y: 0, width: 100, height: 100 };
      expect(PositionValidator.isInsideScreen(rect, SCREEN_WIDTH, SCREEN_HEIGHT)).assertFalse();
      rect.x = -1;
      expect(PositionValidator.isInsideScreen(rect, SCREEN_WIDTH, SCREEN_HEIGHT)).assertFalse();
      rect.x = 100;
      rect.y = 1000;
      expect(PositionValidator.isInsideScreen(rect, SCREEN_WIDTH, SCREEN_HEIGHT)).assertFalse();
      rect.y = 100;
      expect(PositionValidator.isInsideScreen(rect, SCREEN_WIDTH, SCREEN_HEIGHT)).assertTrue();
    });

    it('validator_should_detect_overlap', 0, () => {
      const first: Rect = { x: 0, y: 0, width: 100, height: 100 };
      const overlapping: Rect = { x: 50, y: 50, width: 100, height: 100 };
      const separate: Rect = { x: 200, y: 200, width: 50, height: 50 };
      expect(PositionValidator.overlaps(first, overlapping)).assertTrue();
      expect(PositionValidator.overlaps(first, separate)).assertFalse();
      expect(PositionValidator.area(first)).assertEqual(10000);
    });

    it('validator_should_check_centering_tolerance', 0, () => {
      const rect = DialogPositioner.center(SCREEN_WIDTH, SCREEN_HEIGHT, DIALOG_WIDTH, DIALOG_HEIGHT);
      expect(PositionValidator.isCentered(rect, SCREEN_WIDTH, SCREEN_HEIGHT, 0)).assertTrue();
      rect.x += 2;
      expect(PositionValidator.isCentered(rect, SCREEN_WIDTH, SCREEN_HEIGHT, 0)).assertFalse();
      expect(PositionValidator.isCentered(rect, SCREEN_WIDTH, SCREEN_HEIGHT, 2)).assertTrue();
    });

    it('alignment_should_prefer_above_when_space_allows', 0, () => {
      const anchor: Anchor = { x: 800, y: 800, width: 200, height: 60 };
      expect(AlignmentResolver.resolve(anchor, 200, SCREEN_HEIGHT, 20)).assertEqual(ALIGN_ABOVE);
      expect(AlignmentResolver.isKnown(ALIGN_ABOVE)).assertTrue();
      expect(AlignmentResolver.isKnown('unknown')).assertFalse();
    });

    it('alignment_should_fall_back_below_or_center', 0, () => {
      const highAnchor: Anchor = { x: 800, y: 50, width: 200, height: 60 };
      expect(AlignmentResolver.resolve(highAnchor, 200, SCREEN_HEIGHT, 20)).assertEqual(ALIGN_BELOW);
      const hugeDialog: Anchor = { x: 800, y: 300, width: 200, height: 60 };
      expect(AlignmentResolver.resolve(hugeDialog, 1000, SCREEN_HEIGHT, 20)).assertEqual(ALIGN_CENTER);
    });

    it('alignment_should_resolve_horizontal_sides', 0, () => {
      const leftAnchor: Anchor = { x: 1600, y: 300, width: 100, height: 60 };
      expect(AlignmentResolver.horizontalFor(leftAnchor, 300, SCREEN_WIDTH)).assertEqual(ALIGN_LEFT);
      const rightAnchor: Anchor = { x: 100, y: 300, width: 100, height: 60 };
      expect(AlignmentResolver.horizontalFor(rightAnchor, 300, SCREEN_WIDTH)).assertEqual(ALIGN_RIGHT);
      const centerAnchor: Anchor = { x: 900, y: 300, width: 100, height: 60 };
      expect(AlignmentResolver.horizontalFor(centerAnchor, 1000, SCREEN_WIDTH)).assertEqual(ALIGN_CENTER);
    });

    it('layout_engine_should_produce_playable_rect', 0, () => {
      const rect = DialogLayoutEngine.layout(SCREEN_WIDTH, SCREEN_HEIGHT, DIALOG_WIDTH, DIALOG_HEIGHT,
        SAFE_MARGIN);
      expect(DialogLayoutEngine.isPlayable(rect, SCREEN_WIDTH, SCREEN_HEIGHT, SAFE_MARGIN)).assertTrue();
      const anchor: Anchor = { x: 1600, y: 900, width: 200, height: 60 };
      const anchored = DialogLayoutEngine.layoutForAnchor(anchor, SCREEN_WIDTH, SCREEN_HEIGHT,
        DIALOG_WIDTH, DIALOG_HEIGHT, 20, SAFE_MARGIN);
      expect(DialogLayoutEngine.isPlayable(anchored, SCREEN_WIDTH, SCREEN_HEIGHT, SAFE_MARGIN))
        .assertTrue();
      expect(PositionValidator.isInsideScreen(anchored, SCREEN_WIDTH, SCREEN_HEIGHT)).assertTrue();
    });

    it('dialog_constants_should_be_stable', 0, () => {
      expect(SCREEN_WIDTH).assertEqual(1920);
      expect(SCREEN_HEIGHT).assertEqual(1080);
      expect(DIALOG_WIDTH).assertEqual(800);
      expect(DIALOG_HEIGHT).assertEqual(500);
      expect(SAFE_MARGIN).assertEqual(48);
      expect(ALIGN_CENTER).assertEqual('center');
    });
  });
}

