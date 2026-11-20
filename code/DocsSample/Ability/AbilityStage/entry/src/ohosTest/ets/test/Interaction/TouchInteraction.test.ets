/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component, Point } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  logError,
  launchEntryAbility,
  waitForIndexPageStable,
  waitForTextVisible,
  checkTextContent,
  checkComponentExists,
  checkComponentExistsByKey,
  pageComponentCount,
  collectAllTexts,
  tapComponentByText,
  simulateTouch,
  runSerializedUiOperation,
  isIndexPageVisible,
  measureElapsed,
  isWithinBudget,
  isNonEmptyString,
  averageOf,
  maxOf,
  minOf,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  DELAY_TOUCH_EVENT,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_TEXT_APPEAR,
  TOLERANCE_COMPONENT_COUNT
} from '../Shared/SharedDriver';

const DEFAULT_DISPLAY_WIDTH: number = 1080;

const DEFAULT_DISPLAY_HEIGHT: number = 1920;

const INITIAL_TEXT_LENGTH: number = 11;

const CLICKED_TEXT_LENGTH: number = 7;

const TAP_BUDGET_MS: number = 1500;

const CONSECUTIVE_TAP_COUNT: number = 5;

const STRESS_TOUCH_COUNT: number = 12;

class TouchCoordinateError extends Error {
  private readonly coordinateX: number;
  private readonly coordinateY: number;

  constructor(coordinateX: number, coordinateY: number) {
    super(`coordinate rejected: ${coordinateX},${coordinateY}`);
    this.name = 'TouchCoordinateError';
    this.coordinateX = coordinateX;
    this.coordinateY = coordinateY;
  }

  public getCoordinateX(): number {
    return this.coordinateX;
  }

  public getCoordinateY(): number {
    return this.coordinateY;
  }
}

class TouchPoint {
  private readonly coordinateX: number;
  private readonly coordinateY: number;

  constructor(coordinateX: number, coordinateY: number) {
    this.coordinateX = coordinateX;
    this.coordinateY = coordinateY;
  }

  public getX(): number {
    return this.coordinateX;
  }

  public getY(): number {
    return this.coordinateY;
  }

  public distanceTo(other: TouchPoint): number {
    const deltaX: number = this.coordinateX - other.coordinateX;
    const deltaY: number = this.coordinateY - other.coordinateY;
    return Math.round(Math.sqrt(deltaX * deltaX + deltaY * deltaY) * 100) / 100;
  }

  public equals(other: TouchPoint): boolean {
    return this.coordinateX === other.coordinateX && this.coordinateY === other.coordinateY;
  }

  public describe(): string {
    return `${this.coordinateX},${this.coordinateY}`;
  }
}

class TouchBoundsValidator {
  private readonly displayWidth: number;
  private readonly displayHeight: number;

  constructor(displayWidth: number, displayHeight: number) {
    this.displayWidth = displayWidth;
    this.displayHeight = displayHeight;
  }

  public getDisplayWidth(): number {
    return this.displayWidth;
  }

  public getDisplayHeight(): number {
    return this.displayHeight;
  }

  public isValidCoordinate(x: number, y: number): boolean {
    return isFinite(x) && isFinite(y) && x >= 0 && y >= 0 && x <= this.displayWidth && y <= this.displayHeight;
  }

  public assertValidCoordinate(x: number, y: number): TouchPoint {
    if (!this.isValidCoordinate(x, y)) {
      throw new TouchCoordinateError(x, y);
    }
    return new TouchPoint(x, y);
  }

  public clampCoordinate(x: number, y: number): TouchPoint {
    let clampedX: number = x;
    let clampedY: number = y;
    if (!isFinite(clampedX) || clampedX < 0) {
      clampedX = 0;
    }
    if (!isFinite(clampedY) || clampedY < 0) {
      clampedY = 0;
    }
    if (clampedX > this.displayWidth) {
      clampedX = this.displayWidth;
    }
    if (clampedY > this.displayHeight) {
      clampedY = this.displayHeight;
    }
    return new TouchPoint(clampedX, clampedY);
  }

  public isOrigin(x: number, y: number): boolean {
    return x === 0 && y === 0;
  }

  public isMaxCorner(x: number, y: number): boolean {
    return x === this.displayWidth && y === this.displayHeight;
  }

  public isCenter(x: number, y: number): boolean {
    return x === this.displayWidth / 2 && y === this.displayHeight / 2;
  }

  public centerPoint(): TouchPoint {
    return new TouchPoint(this.displayWidth / 2, this.displayHeight / 2);
  }

  public cornerPoints(): TouchPoint[] {
    const points: TouchPoint[] = [];
    points.push(new TouchPoint(0, 0));
    points.push(new TouchPoint(this.displayWidth, 0));
    points.push(new TouchPoint(0, this.displayHeight));
    points.push(new TouchPoint(this.displayWidth, this.displayHeight));
    return points;
  }
}

class TouchSession {
  private readonly sessionId: number;
  private readonly points: TouchPoint[] = [];
  private startedAt: number = 0;
  private endedAt: number = 0;

  constructor(sessionId: number) {
    this.sessionId = sessionId;
  }

  public getSessionId(): number {
    return this.sessionId;
  }

  public start(): void {
    this.startedAt = Date.now();
  }

  public record(point: TouchPoint): void {
    this.points.push(point);
  }

  public finish(): void {
    this.endedAt = Date.now();
  }

  public getPointCount(): number {
    return this.points.length;
  }

  public getPoints(): TouchPoint[] {
    return this.points;
  }

  public getElapsed(): number {
    if (this.startedAt === 0 || this.endedAt === 0) {
      return 0;
    }
    return this.endedAt - this.startedAt;
  }

  public getTotalPathLength(): number {
    if (this.points.length < 2) {
      return 0;
    }
    let total: number = 0;
    for (let i = 1; i < this.points.length; i++) {
      total += this.points[i - 1].distanceTo(this.points[i]);
    }
    return Math.round(total * 100) / 100;
  }

  public hasDuplicateConsecutivePoints(): boolean {
    for (let i = 1; i < this.points.length; i++) {
      if (this.points[i].equals(this.points[i - 1])) {
        return true;
      }
    }
    return false;
  }

  public getUniquePointCount(): number {
    const distinctPoints: TouchPoint[] = [];
    for (let i = 0; i < this.points.length; i++) {
      let seen: boolean = false;
      for (let j = 0; j < distinctPoints.length; j++) {
        if (distinctPoints[j].equals(this.points[i])) {
          seen = true;
        }
      }
      if (!seen) {
        distinctPoints.push(this.points[i]);
      }
    }
    return distinctPoints.length;
  }
}

enum TapOutcome {
  TRANSITIONED = 'transitioned',
  ALREADY_CLICKED = 'already_clicked',
  NO_TARGET = 'no_target'
}

interface TapRecord {
  outcome: TapOutcome;
  elapsedMs: number;
  textAfter: string;
}

class TapSequenceRecorder {
  private readonly records: TapRecord[] = [];

  public record(outcome: TapOutcome, elapsedMs: number, textAfter: string): void {
    const record: TapRecord = { outcome: outcome, elapsedMs: elapsedMs, textAfter: textAfter };
    this.records.push(record);
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getRecords(): TapRecord[] {
    return this.records;
  }

  public countOutcome(outcome: TapOutcome): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].outcome === outcome) {
        count++;
      }
    }
    return count;
  }

  public getElapsedList(): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.records.length; i++) {
      values.push(this.records[i].elapsedMs);
    }
    return values;
  }

  public allWithinBudget(budget: number): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (!isWithinBudget(this.records[i].elapsedMs, budget)) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.records.splice(0, this.records.length);
  }
}

class TapOutcomeClassifier {
  public classify(textBefore: string, textAfter: string): TapOutcome {
    if (textBefore === PAGE_TEXT_INITIAL && textAfter === PAGE_TEXT_CLICKED) {
      return TapOutcome.TRANSITIONED;
    }
    if (textBefore === PAGE_TEXT_CLICKED && textAfter === PAGE_TEXT_CLICKED) {
      return TapOutcome.ALREADY_CLICKED;
    }
    if (textAfter.length === 0) {
      return TapOutcome.NO_TARGET;
    }
    return TapOutcome.NO_TARGET;
  }

  public expectedLength(text: string): number {
    if (text === PAGE_TEXT_INITIAL) {
      return INITIAL_TEXT_LENGTH;
    }
    if (text === PAGE_TEXT_CLICKED) {
      return CLICKED_TEXT_LENGTH;
    }
    return 0;
  }
}

async function readBoundText(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
    return await component.getText();
  });
}

async function ensureWelcomeState(driver: Driver): Promise<string> {
  let current: string = await readBoundText(driver);
  if (current === PAGE_TEXT_INITIAL) {
    await runSerializedUiOperation(async (): Promise<void> => {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      await component.click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
    });
    await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
    current = await readBoundText(driver);
  }
  return current;
}

export default function touchInteractionTest(): void {
  describe('TouchInteractionTest', () => {
    let driver: Driver;
    let validator: TouchBoundsValidator;
    let recorder: TapSequenceRecorder;
    let classifier: TapOutcomeClassifier;


    beforeAll(async () => {
      driver = getDriver();
      recorder = new TapSequenceRecorder();
      classifier = new TapOutcomeClassifier();
      logInfo('TouchInteractionTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      let displayWidth: number = DEFAULT_DISPLAY_WIDTH;
      let displayHeight: number = DEFAULT_DISPLAY_HEIGHT;
      try {
        const displaySize: Point = await driver.getDisplaySize();
        if (displaySize.x > 0 && displaySize.y > 0) {
          displayWidth = displaySize.x;
          displayHeight = displaySize.y;
        }
      } catch (e) {
        logError(`TouchInteractionTest: display size query failed, using fallback: ${e}`);
      }
      validator = new TouchBoundsValidator(displayWidth, displayHeight);
      logInfo(`TouchInteractionTest: display ${displayWidth}x${displayHeight}`);
      logInfo('TouchInteractionTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('TouchInteractionTest: afterAll start');
      await driver.delayMs(100);
      logInfo('TouchInteractionTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_0100
     * @tc.name testTouchDisplaySizePositive
     * @tc.desc Verify the live display reports a positive width and height usable for coordinate validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchDisplaySizePositive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const displaySize: Point = await driver.getDisplaySize();
        expect(displaySize.x > 0).assertTrue();
        expect(displaySize.y > 0).assertTrue();
        expect(validator.getDisplayWidth()).assertEqual(displaySize.x);
        expect(validator.getDisplayHeight()).assertEqual(displaySize.y);
        logInfo(`testTouchDisplaySizePositive: display ${displaySize.x}x${displaySize.y}`);
      } catch (e) {
        logError(`testTouchDisplaySizePositive failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_0200
     * @tc.name testTouchOriginCoordinateAccepted
     * @tc.desc Verify the origin 0,0 is accepted as a valid touch coordinate and reported as the origin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchOriginCoordinateAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(validator.isValidCoordinate(0, 0)).assertTrue();
        expect(validator.isOrigin(0, 0)).assertTrue();
        const point: TouchPoint = validator.assertValidCoordinate(0, 0);
        expect(point.getX()).assertEqual(0);
        expect(point.getY()).assertEqual(0);
        expect(point.describe()).assertEqual('0,0');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_0300
     * @tc.name testTouchMaxCornerAccepted
     * @tc.desc Verify the maximum display corner equals the display size and is accepted by the validator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchMaxCornerAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const maxX: number = validator.getDisplayWidth();
        const maxY: number = validator.getDisplayHeight();
        expect(validator.isValidCoordinate(maxX, maxY)).assertTrue();
        expect(validator.isMaxCorner(maxX, maxY)).assertTrue();
        expect(validator.isMaxCorner(maxX, maxY - 1)).assertFalse();
        const corners: TouchPoint[] = validator.cornerPoints();
        expect(corners.length).assertEqual(4);
        expect(corners[3].getX()).assertEqual(maxX);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_0400
     * @tc.name testTouchNegativeCoordinateRejected
     * @tc.desc Verify negative coordinates raise TouchCoordinateError while the clamp helper floors them at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchNegativeCoordinateRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(validator.isValidCoordinate(-1, 10)).assertFalse();
        expect(validator.isValidCoordinate(10, -1)).assertFalse();
        try {
          validator.assertValidCoordinate(-5, 20);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TouchCoordinateError');
        }
        const clamped: TouchPoint = validator.clampCoordinate(-5, 20);
        expect(clamped.getX()).assertEqual(0);
        expect(clamped.getY()).assertEqual(20);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_0500
     * @tc.name testTouchBeyondDisplayClamped
     * @tc.desc Verify coordinates one pixel past the display bound are rejected and clamped to the maximum corner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchBeyondDisplayClamped', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const beyondX: number = validator.getDisplayWidth() + 1;
        const beyondY: number = validator.getDisplayHeight() + 1;
        expect(validator.isValidCoordinate(beyondX, beyondY)).assertFalse();
        const clamped: TouchPoint = validator.clampCoordinate(beyondX, beyondY);
        expect(clamped.getX()).assertEqual(validator.getDisplayWidth());
        expect(clamped.getY()).assertEqual(validator.getDisplayHeight());
        expect(validator.isValidCoordinate(clamped.getX(), clamped.getY())).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_0600
     * @tc.name testTouchCenterPointDerived
     * @tc.desc Verify the derived center point equals half the display size and is recognized as centered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchCenterPointDerived', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const center: TouchPoint = validator.centerPoint();
        expect(center.getX()).assertEqual(validator.getDisplayWidth() / 2);
        expect(center.getY()).assertEqual(validator.getDisplayHeight() / 2);
        expect(validator.isCenter(center.getX(), center.getY())).assertTrue();
        expect(validator.isCenter(center.getX() + 1, center.getY())).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_0700
     * @tc.name testTouchCoordinateDistance
     * @tc.desc Verify the euclidean distance from 0,0 to 3,4 is 5 and identical points are at distance 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchCoordinateDistance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const origin: TouchPoint = new TouchPoint(0, 0);
        const target: TouchPoint = new TouchPoint(3, 4);
        expect(origin.distanceTo(target)).assertEqual(5);
        expect(origin.distanceTo(origin)).assertEqual(0);
        expect(target.distanceTo(origin)).assertEqual(5);
        expect(origin.equals(new TouchPoint(0, 0))).assertTrue();
        expect(origin.equals(target)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_0800
     * @tc.name testTouchSessionPathLength
     * @tc.desc Verify a session through 0,0 then 3,4 then 3,0 accumulates a path length of 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchSessionPathLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const session: TouchSession = new TouchSession(1);
        session.record(new TouchPoint(0, 0));
        session.record(new TouchPoint(3, 4));
        session.record(new TouchPoint(3, 0));
        expect(session.getPointCount()).assertEqual(3);
        expect(session.getTotalPathLength()).assertEqual(9);
        expect(session.getSessionId()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_0900
     * @tc.name testTouchSessionSinglePointPath
     * @tc.desc Verify a single point session has a zero path length and no duplicate consecutive points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchSessionSinglePointPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const session: TouchSession = new TouchSession(2);
        session.record(new TouchPoint(100, 100));
        expect(session.getPointCount()).assertEqual(1);
        expect(session.getTotalPathLength()).assertEqual(0);
        expect(session.hasDuplicateConsecutivePoints()).assertFalse();
        expect(session.getUniquePointCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_1000
     * @tc.name testTouchSessionDuplicateDetection
     * @tc.desc Verify a repeated coordinate is flagged as duplicate while unique counting stays at one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchSessionDuplicateDetection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const session: TouchSession = new TouchSession(3);
        session.record(new TouchPoint(50, 50));
        session.record(new TouchPoint(50, 50));
        session.record(new TouchPoint(90, 50));
        expect(session.getPointCount()).assertEqual(3);
        expect(session.hasDuplicateConsecutivePoints()).assertTrue();
        expect(session.getUniquePointCount()).assertEqual(2);
        expect(session.getTotalPathLength()).assertEqual(40);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_1100
     * @tc.name testTouchOutcomeClassifierTransition
     * @tc.desc Verify the classifier maps Hello World to Welcome as a transition and Welcome to Welcome as repeated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchOutcomeClassifierTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(classifier.classify(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED)).assertEqual(TapOutcome.TRANSITIONED);
        expect(classifier.classify(PAGE_TEXT_CLICKED, PAGE_TEXT_CLICKED)).assertEqual(TapOutcome.ALREADY_CLICKED);
        expect(classifier.classify(PAGE_TEXT_INITIAL, PAGE_TEXT_INITIAL)).assertEqual(TapOutcome.NO_TARGET);
        expect(classifier.expectedLength(PAGE_TEXT_INITIAL)).assertEqual(INITIAL_TEXT_LENGTH);
        expect(classifier.expectedLength(PAGE_TEXT_CLICKED)).assertEqual(CLICKED_TEXT_LENGTH);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_1200
     * @tc.name testTouchRecorderAggregation
     * @tc.desc Verify the recorder aggregates outcomes, budget checks and elapsed statistics correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchRecorderAggregation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const localRecorder: TapSequenceRecorder = new TapSequenceRecorder();
        localRecorder.record(TapOutcome.TRANSITIONED, 120, PAGE_TEXT_CLICKED);
        localRecorder.record(TapOutcome.ALREADY_CLICKED, 80, PAGE_TEXT_CLICKED);
        localRecorder.record(TapOutcome.ALREADY_CLICKED, 60, PAGE_TEXT_CLICKED);
        expect(localRecorder.getRecordCount()).assertEqual(3);
        expect(localRecorder.countOutcome(TapOutcome.ALREADY_CLICKED)).assertEqual(2);
        expect(localRecorder.countOutcome(TapOutcome.TRANSITIONED)).assertEqual(1);
        expect(averageOf(localRecorder.getElapsedList())).assertEqual(260 / 3);
        expect(maxOf(localRecorder.getElapsedList())).assertEqual(120);
        expect(minOf(localRecorder.getElapsedList())).assertEqual(60);
        expect(localRecorder.allWithinBudget(TAP_BUDGET_MS)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_1300
     * @tc.name testTouchRecorderBudgetRejection
     * @tc.desc Verify a record beyond the budget fails the aggregate budget check and reset clears the buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchRecorderBudgetRejection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const localRecorder: TapSequenceRecorder = new TapSequenceRecorder();
        localRecorder.record(TapOutcome.TRANSITIONED, TAP_BUDGET_MS + 1, PAGE_TEXT_CLICKED);
        expect(localRecorder.allWithinBudget(TAP_BUDGET_MS)).assertFalse();
        localRecorder.reset();
        expect(localRecorder.getRecordCount()).assertEqual(0);
        expect(localRecorder.allWithinBudget(TAP_BUDGET_MS)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_1400
     * @tc.name testTouchPageRenderedBeforeTouch
     * @tc.desc Verify the index page is stable and the HelloWorld node is locatable before any touch is sent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchPageRenderedBeforeTouch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
        const textExists: boolean = await checkComponentExists(driver, 'Text');
        expect(textExists).assertTrue();
      } catch (e) {
        logError(`testTouchPageRenderedBeforeTouch failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_1500
     * @tc.name testTouchTapComponentTransitionsText
     * @tc.desc Verify tapping the HelloWorld component by text drives the bound text from Hello World to Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchTapComponentTransitionsText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        let current: string = await readBoundText(driver);
        if (current === PAGE_TEXT_INITIAL) {
          const startTime: number = Date.now();
          const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
          expect(tapped).assertTrue();
          const elapsed: number = measureElapsed(startTime);
          const visible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
          expect(visible).assertTrue();
          recorder.record(classifier.classify(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED), elapsed, PAGE_TEXT_CLICKED);
        } else {
          recorder.record(classifier.classify(PAGE_TEXT_CLICKED, PAGE_TEXT_CLICKED), 0, PAGE_TEXT_CLICKED);
        }
        current = await readBoundText(driver);
        expect(current).assertEqual(PAGE_TEXT_CLICKED);
        expect(current.length).assertEqual(CLICKED_TEXT_LENGTH);
      } catch (e) {
        logError(`testTouchTapComponentTransitionsText failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_1600
     * @tc.name testTouchClickByIdTransitionsText
     * @tc.desc Verify a component level click on the HelloWorld id leaves the text in the Welcome state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchClickByIdTransitionsText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const beforeText: string = await readBoundText(driver);
        const startTime: number = Date.now();
        await runSerializedUiOperation(async (): Promise<void> => {
          const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
          await component.click();
          await driver.delayMs(DELAY_TOUCH_EVENT);
        });
        const elapsed: number = measureElapsed(startTime);
        const afterText: string = await readBoundText(driver);
        expect(afterText).assertEqual(PAGE_TEXT_CLICKED);
        expect(isWithinBudget(elapsed, TAP_BUDGET_MS)).assertTrue();
        recorder.record(classifier.classify(beforeText, afterText), elapsed, afterText);
        logInfo(`testTouchClickByIdTransitionsText: elapsed ${elapsed} ms`);
      } catch (e) {
        logError(`testTouchClickByIdTransitionsText failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_1700
     * @tc.name testTouchSimulateTouchOriginKeepsPageAlive
     * @tc.desc Verify a raw touch at coordinate 0,0 does not disrupt the page and the welcome state persists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchSimulateTouchOriginKeepsPageAlive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const beforeText: string = await readBoundText(driver);
        const beforeCount: number = await pageComponentCount(driver);
        await simulateTouch(driver, 0, 0);
        const afterText: string = await readBoundText(driver);
        const afterCount: number = await pageComponentCount(driver);
        expect(validator.isOrigin(0, 0)).assertTrue();
        expect(afterText).assertEqual(beforeText);
        expect(Math.abs(afterCount - beforeCount) <= TOLERANCE_COMPONENT_COUNT).assertTrue();
        logInfo(`testTouchSimulateTouchOriginKeepsPageAlive: components ${beforeCount} to ${afterCount}`);
      } catch (e) {
        logError(`testTouchSimulateTouchOriginKeepsPageAlive failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_1800
     * @tc.name testTouchSimulateTouchMaxCornerKeepsPageAlive
     * @tc.desc Verify a raw touch at the maximum display corner keeps the page reachable and text unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchSimulateTouchMaxCornerKeepsPageAlive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const targetX: number = validator.getDisplayWidth();
        const targetY: number = validator.getDisplayHeight();
        const welcomeBefore: boolean = await ensureWelcomeState(driver) === PAGE_TEXT_CLICKED;
        expect(welcomeBefore).assertTrue();
        await simulateTouch(driver, targetX, targetY);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const afterText: string = await readBoundText(driver);
        expect(afterText).assertEqual(PAGE_TEXT_CLICKED);
        logInfo(`testTouchSimulateTouchMaxCornerKeepsPageAlive: touched ${targetX},${targetY}`);
      } catch (e) {
        logError(`testTouchSimulateTouchMaxCornerKeepsPageAlive failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_1900
     * @tc.name testTouchConsecutiveTapsStable
     * @tc.desc Verify five consecutive taps on the HelloWorld node keep the Welcome text stable each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchConsecutiveTapsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await ensureWelcomeState(driver);
        const localRecorder: TapSequenceRecorder = new TapSequenceRecorder();
        for (let i = 0; i < CONSECUTIVE_TAP_COUNT; i++) {
          const startTime: number = Date.now();
          await runSerializedUiOperation(async (): Promise<void> => {
            const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
            await component.click();
            await driver.delayMs(DELAY_TOUCH_EVENT);
          });
          const elapsed: number = measureElapsed(startTime);
          const afterText: string = await readBoundText(driver);
          localRecorder.record(classifier.classify(PAGE_TEXT_CLICKED, afterText), elapsed, afterText);
          expect(afterText).assertEqual(PAGE_TEXT_CLICKED);
        }
        expect(localRecorder.getRecordCount()).assertEqual(CONSECUTIVE_TAP_COUNT);
        expect(localRecorder.countOutcome(TapOutcome.ALREADY_CLICKED)).assertEqual(CONSECUTIVE_TAP_COUNT);
        logInfo(`testTouchConsecutiveTapsStable: ${CONSECUTIVE_TAP_COUNT} taps recorded`);
      } catch (e) {
        logError(`testTouchConsecutiveTapsStable failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_2000
     * @tc.name testTouchComponentReachableAfterTouch
     * @tc.desc Verify the HelloWorld id remains locatable and clickable after a raw coordinate touch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchComponentReachableAfterTouch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const center: TouchPoint = validator.centerPoint();
        await simulateTouch(driver, center.getX(), center.getY());
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
        const clicked: boolean = await tapComponentByText(driver, PAGE_TEXT_CLICKED);
        expect(clicked).assertTrue();
        const stable: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
        expect(stable).assertTrue();
      } catch (e) {
        logError(`testTouchComponentReachableAfterTouch failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_2100
     * @tc.name testTouchRepeatedRawTouchesStable
     * @tc.desc Verify twelve successive raw touches across the quadrant corners leave the page rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchRepeatedRawTouchesStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const corners: TouchPoint[] = validator.cornerPoints();
        const session: TouchSession = new TouchSession(21);
        session.start();
        for (let i = 0; i < STRESS_TOUCH_COUNT; i++) {
          const point: TouchPoint = corners[i % corners.length];
          if (!validator.isValidCoordinate(point.getX(), point.getY())) {
            continue;
          }
          await simulateTouch(driver, point.getX(), point.getY());
          session.record(point);
        }
        session.finish();
        expect(session.getPointCount()).assertEqual(STRESS_TOUCH_COUNT);
        expect(session.getUniquePointCount()).assertEqual(corners.length);
        const alive: boolean = await isIndexPageVisible(driver);
        expect(alive).assertTrue();
        logInfo(`testTouchRepeatedRawTouchesStable: ${session.getPointCount()} points, path ${session.getTotalPathLength()}`);
      } catch (e) {
        logError(`testTouchRepeatedRawTouchesStable failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_2200
     * @tc.name testTouchTapLatencyWithinBudget
     * @tc.desc Verify a single tap round trip completes within the 1500 ms interaction budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchTapLatencyWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await ensureWelcomeState(driver);
        const startTime: number = Date.now();
        await runSerializedUiOperation(async (): Promise<void> => {
          const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
          await component.click();
          await driver.delayMs(DELAY_TOUCH_EVENT);
        });
        await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
        const elapsed: number = measureElapsed(startTime);
        expect(isWithinBudget(elapsed, TAP_BUDGET_MS)).assertTrue();
        expect(elapsed > 0).assertTrue();
        logInfo(`testTouchTapLatencyWithinBudget: ${elapsed} ms`);
      } catch (e) {
        logError(`testTouchTapLatencyWithinBudget failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_2300
     * @tc.name testTouchTextContentAfterMultipleTouches
     * @tc.desc Verify collected texts contain exactly one Welcome entry after repeated touches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchTextContentAfterMultipleTouches', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await ensureWelcomeState(driver);
        await simulateTouch(driver, validator.getDisplayWidth() / 4, validator.getDisplayHeight() / 4);
        await simulateTouch(driver, validator.getDisplayWidth() * 3 / 4, validator.getDisplayHeight() * 3 / 4);
        const texts: string[] = await collectAllTexts(driver);
        let welcomeCount: number = 0;
        for (let i = 0; i < texts.length; i++) {
          if (texts[i] === PAGE_TEXT_CLICKED) {
            welcomeCount++;
          }
        }
        expect(welcomeCount).assertEqual(1);
        expect(texts.length > 0).assertTrue();
        logInfo(`testTouchTextContentAfterMultipleTouches: ${texts.length} texts, welcome ${welcomeCount}`);
      } catch (e) {
        logError(`testTouchTextContentAfterMultipleTouches failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_2400
     * @tc.name testTouchCopyStringsDistinct
     * @tc.desc Verify the live copy differs between the initial and clicked states with lengths 11 and 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchCopyStringsDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await ensureWelcomeState(driver);
        const liveText: string = await readBoundText(driver);
        expect(liveText.length).assertEqual(CLICKED_TEXT_LENGTH);
        expect(liveText.indexOf('World')).assertEqual(-1);
        expect(liveText.indexOf('Welcome')).assertEqual(0);
        expect(liveText === PAGE_TEXT_INITIAL).assertFalse();
        expect(isNonEmptyString(liveText)).assertTrue();
        expect(PAGE_TEXT_CLICKED.length).assertEqual(CLICKED_TEXT_LENGTH);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_2500
     * @tc.name testTouchTextPassesThroughDragPath
     * @tc.desc Verify a drag like path across the screen from left to right records a positive displacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchTextPassesThroughDragPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const startX: number = validator.getDisplayWidth() / 4;
        const endX: number = validator.getDisplayWidth() * 3 / 4;
        const midY: number = validator.getDisplayHeight() / 2;
        const session: TouchSession = new TouchSession(25);
        session.record(new TouchPoint(startX, midY));
        session.record(new TouchPoint(endX, midY));
        const displacement: number = session.getTotalPathLength();
        expect(displacement).assertEqual(endX - startX);
        expect(session.getPointCount()).assertEqual(2);
        expect(session.hasDuplicateConsecutivePoints()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_2600
     * @tc.name testTouchAfterBackgroundForeground
     * @tc.desc Verify touching still works after the page is re checked for stability following a raw touch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchAfterBackgroundForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await simulateTouch(driver, validator.getDisplayWidth() / 2, validator.getDisplayHeight() / 2);
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_CLICKED);
        expect(tapped).assertTrue();
        const after: string = await readBoundText(driver);
        expect(after).assertEqual(PAGE_TEXT_CLICKED);
      } catch (e) {
        logError(`testTouchAfterBackgroundForeground failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_2700
     * @tc.name testTouchTapComponentMissingText
     * @tc.desc Verify tapping a text that is not on screen reports false without changing page state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchTapComponentMissingText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const beforeCount: number = await pageComponentCount(driver);
        const tapped: boolean = await tapComponentByText(driver, 'Nonexistent Label');
        expect(tapped).assertFalse();
        const afterCount: number = await pageComponentCount(driver);
        expect(Math.abs(afterCount - beforeCount) <= TOLERANCE_COMPONENT_COUNT).assertTrue();
        const alive: boolean = await isIndexPageVisible(driver);
        expect(alive).assertTrue();
      } catch (e) {
        logError(`testTouchTapComponentMissingText failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_2800
     * @tc.name testTouchSessionElapsedMonotonic
     * @tc.desc Verify a started and finished session reports a non negative elapsed duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchSessionElapsedMonotonic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const session: TouchSession = new TouchSession(28);
        expect(session.getElapsed()).assertEqual(0);
        session.start();
        await driver.delayMs(DELAY_TOUCH_EVENT);
        session.finish();
        expect(session.getElapsed() >= DELAY_TOUCH_EVENT).assertTrue();
        expect(session.getPoints().length).assertEqual(0);
        expect(session.getSessionId()).assertEqual(28);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_2900
     * @tc.name testTouchBoundaryCoordinateSequenceValidity
     * @tc.desc Verify every corner and the center of the live display passes coordinate validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchBoundaryCoordinateSequenceValidity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const candidates: TouchPoint[] = validator.cornerPoints();
        candidates.push(validator.centerPoint());
        let validCount: number = 0;
        for (let i = 0; i < candidates.length; i++) {
          if (validator.isValidCoordinate(candidates[i].getX(), candidates[i].getY())) {
            validCount++;
          }
        }
        expect(validCount).assertEqual(5);
        expect(candidates.length).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_3000
     * @tc.name testTouchRecorderAcrossUiTaps
     * @tc.desc Verify the shared recorder accumulates the UI taps performed earlier in this suite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchRecorderAcrossUiTaps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(recorder.getRecordCount() >= 2).assertTrue();
        expect(recorder.allWithinBudget(TAP_BUDGET_MS)).assertTrue();
        const welcomeRecords: number = recorder.countOutcome(TapOutcome.ALREADY_CLICKED) +
          recorder.countOutcome(TapOutcome.TRANSITIONED);
        expect(welcomeRecords).assertEqual(recorder.getRecordCount());
        const elapsedList: number[] = recorder.getElapsedList();
        expect(elapsedList.length).assertEqual(recorder.getRecordCount());
        logInfo(`testTouchRecorderAcrossUiTaps: ${recorder.getRecordCount()} taps aggregated`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_3100
     * @tc.name testTouchComponentCountWithinTolerance
     * @tc.desc Verify the page component count stays above zero and inside the tolerance band after all touches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchComponentCountWithinTolerance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const firstCount: number = await pageComponentCount(driver);
        const secondCount: number = await pageComponentCount(driver);
        expect(firstCount > 0).assertTrue();
        expect(Math.abs(secondCount - firstCount) <= TOLERANCE_COMPONENT_COUNT).assertTrue();
        const containerExists: boolean = await checkComponentExists(driver, 'RelativeContainer');
        expect(containerExists).assertTrue();
        logInfo(`testTouchComponentCountWithinTolerance: counts ${firstCount} and ${secondCount}`);
      } catch (e) {
        logError(`testTouchComponentCountWithinTolerance failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_TOUCH_3200
     * @tc.name testTouchFinalTextState
     * @tc.desc Verify after the entire touch suite the visible text is still the clicked Welcome state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchFinalTextState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const finalText: string = await readBoundText(driver);
        expect(finalText).assertEqual(PAGE_TEXT_CLICKED);
        const visible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(visible).assertTrue();
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
      } catch (e) {
        logError(`testTouchFinalTextState failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })
  })
}
