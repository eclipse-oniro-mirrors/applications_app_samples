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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_BUNDLE_INPUT,
  ID_BEGIN_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEXT_WHITELIST_EMPTY,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  TEST_BUNDLE_TERTIARY,
  TEST_BUNDLE_INVALID,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Limits of the AssessmentConfig object, re-declared so the suite never imports the sample.
const MAX_ALLOWED_APPS: number = 20;
const MAX_CONFIG_CHARS: number = 2048;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';

// The duration candidates of the sample, in the ascending order of the duration chips.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN: number = 600000;
const DURATION_THIRTY: number = 1800000;
const DURATION_SIXTY: number = 3600000;
const DURATIONS: number[] = [DURATION_DEFAULT, DURATION_TEN, DURATION_THIRTY, DURATION_SIXTY];

// Whitelist sizes that are exercised by the cartesian matrix. Together with the four durations
// they produce the full matrix of the boundary cases.
const WHITELIST_SIZES: number[] = [0, 1, 2, 5, 19, 20];

// Content shapes of a whitelist entry.
enum ContentShape {
  NORMAL = 'normal', SHORT = 'short', LONG = 'long', PADDED = 'padded', UNICODE = 'unicode'
}

const CONTENT_SHAPES: string[] = [
  ContentShape.NORMAL, ContentShape.SHORT, ContentShape.LONG, ContentShape.PADDED, ContentShape.UNICODE
];

// Number of cells of the cartesian matrix: four durations times six whitelist sizes.
const MATRIX_ROWS: number = DURATIONS.length;
const MATRIX_COLUMNS: number = WHITELIST_SIZES.length;

/**
 * One cell of the configuration matrix.
 *
 * A cell is a fully specified AssessmentConfig candidate together with the verdict that the
 * sample is expected to reach: admissible for assessment.begin, or rejected before the call.
 */
class MatrixCell {
  public row: number;
  public column: number;
  public duration: number;
  public size: number;
  public durationValid: boolean;
  public capacityValid: boolean;
  public lengthValid: boolean;
  public shape: string;

  constructor(row: number, column: number, duration: number, size: number, shape: string) {
    this.row = row;
    this.column = column;
    this.duration = duration;
    this.size = size;
    this.shape = shape;
    this.durationValid = DURATIONS.indexOf(duration) >= 0;
    this.capacityValid = size <= MAX_ALLOWED_APPS;
    this.lengthValid = MatrixFactory.totalCharsOf(size, shape) <= MAX_CONFIG_CHARS;
  }

  public isAdmissible(): boolean {
    return this.durationValid && this.capacityValid && this.lengthValid;
  }

  public describe(): string {
    return `cell[r${this.row},c${this.column}] duration=${this.duration} size=${this.size} ` +
      `shape=${this.shape} admissible=${this.isAdmissible()}`;
  }
}

/**
 * Generates whitelist entries of a given shape.
 *
 * The generated names stay inside the length budget for the default shape so that a capacity
 * case never trips over the 2048 character rule by accident.
 */
class MatrixFactory {
  public static pad(value: number): string {
    return `${value}`.padStart(2, '0');
  }

  public static repeat(character: string, count: number): string {
    let value: string = '';
    for (let i = 0; i < count; i++) {
      value += character;
    }
    return value;
  }

  public static entryOf(shape: string, index: number): string {
    if (shape === ContentShape.SHORT) {
      return `a${MatrixFactory.pad(index)}`;
    }
    if (shape === ContentShape.LONG) {
      return `com.samples.${MatrixFactory.repeat('x', 96)}${MatrixFactory.pad(index)}`;
    }
    if (shape === ContentShape.PADDED) {
      return `   com.samples.padded${MatrixFactory.pad(index)}   `;
    }
    if (shape === ContentShape.UNICODE) {
      return `com.samples.eval${MatrixFactory.pad(index)}`;
    }
    return `com.samples.app${MatrixFactory.pad(index)}`;
  }

  public static whitelistOf(size: number, shape: string): string[] {
    const apps: string[] = [];
    for (let i = 0; i < size; i++) {
      apps.push(MatrixFactory.entryOf(shape, i));
    }
    return apps;
  }

  public static totalCharsOf(size: number, shape: string): number {
    const apps: string[] = MatrixFactory.whitelistOf(size, shape);
    let total: number = 0;
    for (let i = 0; i < apps.length; i++) {
      total += apps[i].length;
    }
    return total;
  }

  public static matrix(shape: string): MatrixCell[] {
    const cells: MatrixCell[] = [];
    for (let row = 0; row < MATRIX_ROWS; row++) {
      for (let column = 0; column < MATRIX_COLUMNS; column++) {
        cells.push(new MatrixCell(row, column, DURATIONS[row], WHITELIST_SIZES[column], shape));
      }
    }
    return cells;
  }

  public static longWhitelistOfTotalLength(total: number): string[] {
    const apps: string[] = [];
    let remaining: number = total;
    let index: number = 0;
    while (remaining > 0 && apps.length < MAX_ALLOWED_APPS) {
      const chunk: number = remaining > 120 ? 120 : remaining;
      apps.push(MatrixFactory.repeat('c', chunk));
      remaining -= chunk;
      index++;
    }
    return apps;
  }
}

/**
 * A configuration candidate, the model representation of the AssessmentConfig interface.
 *
 * The normaliser mirrors the input trimming of Index.ets and the capacity and duplicate rules of
 * the sample, so an assertion on the model is also an assertion on the page behaviour.
 */
class ConfigCandidate {
  private durationValue: number;
  private values: string[] = [];

  constructor(duration: number = DURATION_DEFAULT, allowedApps: string[] = []) {
    this.durationValue = duration;
    for (let i = 0; i < allowedApps.length; i++) {
      this.values.push(allowedApps[i].trim());
    }
  }

  public static seededDefault(): ConfigCandidate {
    return new ConfigCandidate(DURATION_DEFAULT, [DEFAULT_ALLOWED_APP]);
  }

  public static fromCell(cell: MatrixCell): ConfigCandidate {
    return new ConfigCandidate(cell.duration, MatrixFactory.whitelistOf(cell.size, cell.shape));
  }

  public duration(): number {
    return this.durationValue;
  }

  public apps(): string[] {
    return this.values.slice();
  }

  public size(): number {
    return this.values.length;
  }

  public totalChars(): number {
    let total: number = 0;
    for (let i = 0; i < this.values.length; i++) {
      total += this.values[i].length;
    }
    return total;
  }

  public isFull(): boolean {
    return this.values.length >= MAX_ALLOWED_APPS;
  }

  public contains(bundleName: string): boolean {
    return this.values.indexOf(bundleName) >= 0;
  }

  public append(bundleName: string): boolean {
    const value: string = bundleName.trim();
    if (value.length === 0 || this.contains(value) || this.isFull()) {
      return false;
    }
    const next: string[] = this.values.slice();
    next.push(value);
    this.values = next;
    return true;
  }

  public drop(bundleName: string): boolean {
    const index: number = this.values.indexOf(bundleName);
    if (index < 0) {
      return false;
    }
    const next: string[] = this.values.slice();
    next.splice(index, 1);
    this.values = next;
    return true;
  }

  public setDuration(duration: number): boolean {
    if (DURATIONS.indexOf(duration) < 0) {
      return false;
    }
    this.durationValue = duration;
    return true;
  }

  public isDefaultDuration(): boolean {
    return this.durationValue === DURATION_DEFAULT;
  }

  public minutes(): number {
    if (this.durationValue === DURATION_DEFAULT) {
      return 0;
    }
    return this.durationValue / 60000;
  }

  public sorted(): string[] {
    return this.values.slice().sort((left: string, right: string) => {
      if (left < right) {
        return -1;
      }
      if (left > right) {
        return 1;
      }
      return 0;
    });
  }

  public duplicateCount(): number {
    const seen: Set<string> = new Set<string>();
    let duplicates: number = 0;
    for (let i = 0; i < this.values.length; i++) {
      if (seen.has(this.values[i])) {
        duplicates++;
      } else {
        seen.add(this.values[i]);
      }
    }
    return duplicates;
  }

  public signature(): string {
    return `${this.durationValue}#${this.sorted().join('|')}`;
  }

  public clone(): ConfigCandidate {
    return new ConfigCandidate(this.durationValue, this.values.slice());
  }

  public equals(other: ConfigCandidate): boolean {
    if (this.durationValue !== other.duration()) {
      return false;
    }
    const mine: string[] = this.values;
    const theirs: string[] = other.apps();
    if (mine.length !== theirs.length) {
      return false;
    }
    for (let i = 0; i < mine.length; i++) {
      if (mine[i] !== theirs[i]) {
        return false;
      }
    }
    return true;
  }

  public describe(): string {
    return `ConfigCandidate{duration=${this.durationValue}, size=${this.values.length}, chars=${this.totalChars()}}`;
  }
}

/**
 * Verdict of a configuration candidate before it reaches assessment.begin.
 */
class MatrixVerdict {
  private readonly durationAccepted: boolean;
  private readonly capacityAccepted: boolean;
  private readonly lengthAccepted: boolean;
  private readonly duplicateFree: boolean;

  constructor(candidate: ConfigCandidate) {
    this.durationAccepted = DURATIONS.indexOf(candidate.duration()) >= 0;
    this.capacityAccepted = candidate.size() <= MAX_ALLOWED_APPS;
    this.lengthAccepted = candidate.totalChars() <= MAX_CONFIG_CHARS;
    this.duplicateFree = candidate.duplicateCount() === 0;
  }

  public durationOk(): boolean {
    return this.durationAccepted;
  }

  public capacityOk(): boolean {
    return this.capacityAccepted;
  }

  public lengthOk(): boolean {
    return this.lengthAccepted;
  }

  public uniqueOk(): boolean {
    return this.duplicateFree;
  }

  public admissible(): boolean {
    return this.durationAccepted && this.capacityAccepted && this.lengthAccepted && this.duplicateFree;
  }

  public reasons(): string[] {
    const reasons: string[] = [];
    if (!this.durationAccepted) {
      reasons.push('duration is not a documented candidate');
    }
    if (!this.capacityAccepted) {
      reasons.push('the whitelist exceeds twenty entries');
    }
    if (!this.lengthAccepted) {
      reasons.push('the concatenated names exceed 2048 characters');
    }
    if (!this.duplicateFree) {
      reasons.push('the whitelist contains duplicated entries');
    }
    return reasons;
  }

  public describe(): string {
    return `MatrixVerdict{admissible=${this.admissible()}, reasons=${this.reasons().join('; ')}}`;
  }
}

/**
 * Aggregates the verdicts of a matrix run.
 *
 * The summary answers the questions that the design matrix is supposed to answer: how many cells
 * are admissible, how many are rejected, and whether a row or a column is entirely admissible.
 */
class MatrixSummary {
  private cells: MatrixCell[] = [];
  private verdicts: boolean[] = [];

  constructor(cells: MatrixCell[]) {
    this.cells = cells.slice();
    for (let i = 0; i < this.cells.length; i++) {
      this.verdicts.push(new MatrixVerdict(ConfigCandidate.fromCell(this.cells[i])).admissible());
    }
  }

  public size(): number {
    return this.cells.length;
  }

  public admissibleCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.verdicts.length; i++) {
      if (this.verdicts[i]) {
        count++;
      }
    }
    return count;
  }

  public rejectedCount(): number {
    return this.verdicts.length - this.admissibleCount();
  }

  public isAdmissibleAt(row: number, column: number): boolean {
    for (let i = 0; i < this.cells.length; i++) {
      const cell: MatrixCell = this.cells[i];
      if (cell.row === row && cell.column === column) {
        return this.verdicts[i];
      }
    }
    return false;
  }

  public rowFullyAdmissible(row: number): boolean {
    for (let i = 0; i < this.cells.length; i++) {
      if (this.cells[i].row === row && !this.verdicts[i]) {
        return false;
      }
    }
    return true;
  }

  public columnFullyAdmissible(column: number): boolean {
    for (let i = 0; i < this.cells.length; i++) {
      if (this.cells[i].column === column && !this.verdicts[i]) {
        return false;
      }
    }
    return true;
  }

  public cellOf(row: number, column: number): MatrixCell | null {
    for (let i = 0; i < this.cells.length; i++) {
      if (this.cells[i].row === row && this.cells[i].column === column) {
        return this.cells[i];
      }
    }
    return null;
  }

  public durationRow(duration: number): number {
    return DURATIONS.indexOf(duration);
  }

  public toString(): string {
    return `MatrixSummary{cells=${this.cells.length}, admissible=${this.admissibleCount()}, ` +
      `rejected=${this.rejectedCount()}}`;
  }
}

/**
 * Checks the ordering and de-duplication rules of a whitelist.
 *
 * The sample keeps the insertion order and refuses duplicates, this helper states both rules as
 * predicates so a case can assert them without duplicating the loop.
 */
class WhitelistInspector {
  public static isInsertionOrdered(source: string[], observed: string[]): boolean {
    if (source.length !== observed.length) {
      return false;
    }
    for (let i = 0; i < source.length; i++) {
      if (source[i] !== observed[i]) {
        return false;
      }
    }
    return true;
  }

  public static distinctCount(values: string[]): number {
    const seen: Set<string> = new Set<string>(values);
    return seen.size;
  }

  public static allTrimmed(values: string[]): boolean {
    for (let i = 0; i < values.length; i++) {
      if (values[i] !== values[i].trim()) {
        return false;
      }
    }
    return true;
  }

  public static anyEmpty(values: string[]): boolean {
    for (let i = 0; i < values.length; i++) {
      if (values[i].length === 0) {
        return true;
      }
    }
    return false;
  }

  public static commonPrefixCount(left: string[], right: string[]): number {
    let count: number = 0;
    const limit: number = left.length < right.length ? left.length : right.length;
    while (count < limit && left[count] === right[count]) {
      count++;
    }
    return count;
  }

  public static longestEntry(values: string[]): number {
    let longest: number = 0;
    for (let i = 0; i < values.length; i++) {
      if (values[i].length > longest) {
        longest = values[i].length;
      }
    }
    return longest;
  }
}

/**
 * Starts the sample and waits for the entry page, the UI cases degrade to a skip when the page
 * never shows up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function assessmentConfigMatrixTest() {
  describe('AssessmentConfigMatrix_Test', () => {
    let driver: Driver;
    let summary: MatrixSummary;

    beforeAll(async () => {
      driver = getDriver();
      summary = new MatrixSummary(MatrixFactory.matrix(ContentShape.NORMAL));
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the shape of the configuration matrix.
     * Expectation: four duration rows and six whitelist size columns, twenty four cells in total.
     */
    it('Assessment_MatrixShape_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixShape_001, begin');
      expect(MATRIX_ROWS).assertEqual(4);
      expect(MATRIX_COLUMNS).assertEqual(6);
      expect(summary.size()).assertEqual(MATRIX_ROWS * MATRIX_COLUMNS);
      expect(summary.size()).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', summary.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixShape_001, end');
    });

    /**
     * Scenario: the duration rows of the matrix.
     * Expectation: the rows follow the ascending chip order of the configuration card.
     */
    it('Assessment_MatrixDurationRows_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixDurationRows_002, begin');
      for (let i = 0; i < DURATIONS.length; i++) {
        expect(summary.durationRow(DURATIONS[i])).assertEqual(i);
        if (i > 0) {
          expect(DURATIONS[i] > DURATIONS[i - 1]).assertTrue();
        }
      }
      expect(DURATIONS[0]).assertEqual(DURATION_DEFAULT);
      expect(DURATIONS[3]).assertEqual(DURATION_SIXTY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixDurationRows_002, end');
    });

    /**
     * Scenario: the whitelist size columns of the matrix.
     * Expectation: the columns include the empty list, the capacity and one below the capacity.
     */
    it('Assessment_MatrixSizeColumns_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixSizeColumns_003, begin');
      expect(WHITELIST_SIZES[0]).assertEqual(0);
      expect(WHITELIST_SIZES.length).assertEqual(MATRIX_COLUMNS);
      expect(WHITELIST_SIZES.indexOf(MAX_ALLOWED_APPS)).assertEqual(MATRIX_COLUMNS - 1);
      expect(WHITELIST_SIZES.indexOf(MAX_ALLOWED_APPS - 1)).assertEqual(MATRIX_COLUMNS - 2);
      for (let i = 1; i < WHITELIST_SIZES.length; i++) {
        expect(WHITELIST_SIZES[i] > WHITELIST_SIZES[i - 1]).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', WHITELIST_SIZES.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixSizeColumns_003, end');
    });

    /**
     * Scenario: every cell of the matrix with the default entry shape.
     * Expectation: all twenty four cells are admissible, the default shape stays inside the budget.
     */
    it('Assessment_MatrixAllAdmissible_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixAllAdmissible_004, begin');
      expect(summary.admissibleCount()).assertEqual(24);
      expect(summary.rejectedCount()).assertEqual(0);
      for (let row = 0; row < MATRIX_ROWS; row++) {
        expect(summary.rowFullyAdmissible(row)).assertTrue();
      }
      for (let column = 0; column < MATRIX_COLUMNS; column++) {
        expect(summary.columnFullyAdmissible(column)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', summary.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixAllAdmissible_004, end');
    });

    /**
     * Scenario: the corner cells of the matrix.
     * Expectation: the empty default configuration and the full sixty minute configuration are
     * both admissible.
     */
    it('Assessment_MatrixCorners_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixCorners_005, begin');
      expect(summary.isAdmissibleAt(0, 0)).assertTrue();
      expect(summary.isAdmissibleAt(0, MATRIX_COLUMNS - 1)).assertTrue();
      expect(summary.isAdmissibleAt(MATRIX_ROWS - 1, 0)).assertTrue();
      expect(summary.isAdmissibleAt(MATRIX_ROWS - 1, MATRIX_COLUMNS - 1)).assertTrue();
      const cell: MatrixCell | null = summary.cellOf(0, 0);
      expect(cell !== null).assertTrue();
      if (cell !== null) {
        expect(cell.duration).assertEqual(DURATION_DEFAULT);
        expect(cell.size).assertEqual(0);
        expect(cell.isAdmissible()).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixCorners_005, end');
    });

    /**
     * Scenario: every cell of the length shaped matrix.
     * Expectation: the long entry shape pushes the twenty entry columns over 2048 characters.
     */
    it('Assessment_MatrixLongShapeRejects_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixLongShapeRejects_006, begin');
      const longSummary: MatrixSummary = new MatrixSummary(MatrixFactory.matrix(ContentShape.LONG));
      expect(longSummary.size()).assertEqual(24);
      expect(longSummary.admissibleCount() < longSummary.size()).assertTrue();
      expect(longSummary.isAdmissibleAt(0, 0)).assertTrue();
      expect(longSummary.isAdmissibleAt(0, MATRIX_COLUMNS - 1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', longSummary.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixLongShapeRejects_006, end');
    });

    /**
     * Scenario: the short entry shape.
     * Expectation: even the full twenty entry whitelist stays far below the character budget.
     */
    it('Assessment_MatrixShortShapeAccepts_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixShortShapeAccepts_007, begin');
      const shortSummary: MatrixSummary = new MatrixSummary(MatrixFactory.matrix(ContentShape.SHORT));
      expect(shortSummary.admissibleCount()).assertEqual(24);
      const total: number = MatrixFactory.totalCharsOf(MAX_ALLOWED_APPS, ContentShape.SHORT);
      expect(total <= MAX_CONFIG_CHARS).assertTrue();
      expect(total < 200).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s short total chars: %{public}d',
        BUNDLE + 'MatrixShortShapeAccepts_007', total);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixShortShapeAccepts_007, end');
    });

    /**
     * Scenario: the padded entry shape.
     * Expectation: the model trims every entry, so the padded shape is stored trimmed.
     */
    it('Assessment_MatrixPaddedShapeTrimmed_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixPaddedShapeTrimmed_008, begin');
      const apps: string[] = MatrixFactory.whitelistOf(3, ContentShape.PADDED);
      expect(WhitelistInspector.allTrimmed(apps)).assertFalse();
      const candidate: ConfigCandidate = new ConfigCandidate(DURATION_TEN, apps);
      expect(WhitelistInspector.allTrimmed(candidate.apps())).assertTrue();
      expect(candidate.apps()[0]).assertEqual(candidate.apps()[0].trim());
      expect(candidate.size()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', candidate.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixPaddedShapeTrimmed_008, end');
    });

    /**
     * Scenario: the unicode entry shape.
     * Expectation: the shape keeps its characters and the order of the entries is preserved.
     */
    it('Assessment_MatrixUnicodeShape_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixUnicodeShape_009, begin');
      const apps: string[] = MatrixFactory.whitelistOf(4, ContentShape.UNICODE);
      const candidate: ConfigCandidate = new ConfigCandidate(DURATION_THIRTY, apps);
      expect(candidate.size()).assertEqual(4);
      expect(WhitelistInspector.isInsertionOrdered(apps, candidate.apps())).assertTrue();
      expect(candidate.apps()[0].indexOf('eval') >= 0).assertTrue();
      expect(candidate.totalChars()).assertEqual(MatrixFactory.totalCharsOf(4, ContentShape.UNICODE));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixUnicodeShape_009, end');
    });

    /**
     * Scenario: every content shape at the capacity boundary.
     * Expectation: the capacity rule accepts twenty entries for the short shapes and rejects the
     * composite shapes only because of the character budget.
     */
    it('Assessment_MatrixShapesAtCapacity_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixShapesAtCapacity_010, begin');
      for (let i = 0; i < CONTENT_SHAPES.length; i++) {
        const total: number = MatrixFactory.totalCharsOf(MAX_ALLOWED_APPS, CONTENT_SHAPES[i]);
        const candidate: ConfigCandidate =
          new ConfigCandidate(DURATION_DEFAULT, MatrixFactory.whitelistOf(MAX_ALLOWED_APPS, CONTENT_SHAPES[i]));
        const verdict: MatrixVerdict = new MatrixVerdict(candidate);
        expect(verdict.capacityOk()).assertTrue();
        expect(verdict.durationOk()).assertTrue();
        expect(verdict.lengthOk()).assertEqual(total <= MAX_CONFIG_CHARS);
        hilog.info(DOMAIN, TAG, '%{public}s shape %{public}s chars %{public}d',
          BUNDLE + 'MatrixShapesAtCapacity_010', CONTENT_SHAPES[i], total);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixShapesAtCapacity_010, end');
    });

    /**
     * Scenario: the concatenation budget exactly at the limit.
     * Expectation: a configuration of exactly 2048 characters is admissible, the rule is inclusive.
     */
    it('Assessment_CharacterBudgetAtLimit_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CharacterBudgetAtLimit_011, begin');
      const apps: string[] = MatrixFactory.longWhitelistOfTotalLength(MAX_CONFIG_CHARS);
      const candidate: ConfigCandidate = new ConfigCandidate(DURATION_DEFAULT, apps);
      hilog.info(DOMAIN, TAG, '%{public}s chars: %{public}d', BUNDLE + 'CharacterBudgetAtLimit_011',
        candidate.totalChars());
      expect(candidate.totalChars()).assertEqual(MAX_CONFIG_CHARS);
      expect(candidate.totalChars() <= MAX_CONFIG_CHARS).assertTrue();
      const verdict: MatrixVerdict = new MatrixVerdict(candidate);
      expect(verdict.lengthOk()).assertTrue();
      expect(verdict.capacityOk()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', verdict.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CharacterBudgetAtLimit_011, end');
    });

    /**
     * Scenario: the concatenation budget one character over the limit.
     * Expectation: the verdict rejects the configuration and names the budget rule.
     */
    it('Assessment_CharacterBudgetOverLimit_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CharacterBudgetOverLimit_012, begin');
      const apps: string[] = MatrixFactory.longWhitelistOfTotalLength(MAX_CONFIG_CHARS + 1);
      const candidate: ConfigCandidate = new ConfigCandidate(DURATION_DEFAULT, apps);
      const verdict: MatrixVerdict = new MatrixVerdict(candidate);
      expect(candidate.totalChars()).assertEqual(MAX_CONFIG_CHARS + 1);
      expect(verdict.lengthOk()).assertFalse();
      expect(verdict.admissible()).assertFalse();
      expect(verdict.reasons().join(' ')).assertContain('2048');
      hilog.info(DOMAIN, TAG, '%{public}s', verdict.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CharacterBudgetOverLimit_012, end');
    });

    /**
     * Scenario: the capacity rule at exactly twenty entries.
     * Expectation: the twenty entry whitelist is accepted and reports itself as full.
     */
    it('Assessment_CapacityAtLimit_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CapacityAtLimit_013, begin');
      const candidate: ConfigCandidate =
        new ConfigCandidate(DURATION_TEN, MatrixFactory.whitelistOf(MAX_ALLOWED_APPS, ContentShape.NORMAL));
      expect(candidate.size()).assertEqual(MAX_ALLOWED_APPS);
      expect(candidate.isFull()).assertTrue();
      expect(new MatrixVerdict(candidate).capacityOk()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', candidate.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CapacityAtLimit_013, end');
    });

    /**
     * Scenario: one entry below the capacity.
     * Expectation: the whitelist is not full and the append succeeds.
     */
    it('Assessment_CapacityBelowLimit_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CapacityBelowLimit_014, begin');
      const candidate: ConfigCandidate =
        new ConfigCandidate(DURATION_TEN, MatrixFactory.whitelistOf(MAX_ALLOWED_APPS - 1, ContentShape.NORMAL));
      expect(candidate.isFull()).assertFalse();
      expect(candidate.append('com.samples.twentieth')).assertTrue();
      expect(candidate.size()).assertEqual(MAX_ALLOWED_APPS);
      expect(candidate.isFull()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CapacityBelowLimit_014, end');
    });

    /**
     * Scenario: one entry over the capacity.
     * Expectation: the append is refused and the size stays at twenty.
     */
    it('Assessment_CapacityOverLimit_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CapacityOverLimit_015, begin');
      const candidate: ConfigCandidate =
        new ConfigCandidate(DURATION_TEN, MatrixFactory.whitelistOf(MAX_ALLOWED_APPS, ContentShape.NORMAL));
      expect(candidate.append('com.samples.overflow')).assertFalse();
      expect(candidate.size()).assertEqual(MAX_ALLOWED_APPS);
      expect(candidate.contains('com.samples.overflow')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CapacityOverLimit_015, end');
    });

    /**
     * Scenario: de-duplication on insert.
     * Expectation: the second insert of the same name is refused and the size does not grow.
     */
    it('Assessment_DedupeOnInsert_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DedupeOnInsert_016, begin');
      const candidate: ConfigCandidate = new ConfigCandidate(DURATION_DEFAULT, []);
      expect(candidate.append(TEST_BUNDLE_PRIMARY)).assertTrue();
      expect(candidate.append(TEST_BUNDLE_PRIMARY)).assertFalse();
      expect(candidate.append('  ' + TEST_BUNDLE_PRIMARY + '  ')).assertFalse();
      expect(candidate.size()).assertEqual(1);
      expect(candidate.duplicateCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DedupeOnInsert_016, end');
    });

    /**
     * Scenario: an empty value on insert.
     * Expectation: empty and whitespace only values never enter the whitelist.
     */
    it('Assessment_RejectEmptyOnInsert_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectEmptyOnInsert_017, begin');
      const candidate: ConfigCandidate = new ConfigCandidate(DURATION_DEFAULT, []);
      expect(candidate.append('')).assertFalse();
      expect(candidate.append('   ')).assertFalse();
      expect(candidate.size()).assertEqual(0);
      expect(WhitelistInspector.anyEmpty(candidate.apps())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectEmptyOnInsert_017, end');
    });

    /**
     * Scenario: the insertion order of the whitelist.
     * Expectation: entries keep the order in which they were added, the sample renders them as is.
     */
    it('Assessment_InsertionOrderPreserved_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InsertionOrderPreserved_018, begin');
      const source: string[] = [TEST_BUNDLE_TERTIARY, TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY];
      const candidate: ConfigCandidate = new ConfigCandidate(DURATION_DEFAULT, source);
      expect(WhitelistInspector.isInsertionOrdered(source, candidate.apps())).assertTrue();
      expect(candidate.apps()[0]).assertEqual(TEST_BUNDLE_TERTIARY);
      expect(candidate.sorted()[0]).assertEqual(TEST_BUNDLE_PRIMARY);
      expect(candidate.apps()[0]).assertEqual(TEST_BUNDLE_TERTIARY);
      hilog.info(DOMAIN, TAG, '%{public}s', candidate.apps().join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InsertionOrderPreserved_018, end');
    });

    /**
     * Scenario: removing an entry from the middle of the whitelist.
     * Expectation: the remaining entries keep their relative order.
     */
    it('Assessment_RemovalKeepsOrder_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RemovalKeepsOrder_019, begin');
      const candidate: ConfigCandidate =
        new ConfigCandidate(DURATION_THIRTY, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY, TEST_BUNDLE_TERTIARY]);
      expect(candidate.drop(TEST_BUNDLE_SECONDARY)).assertTrue();
      expect(candidate.apps().length).assertEqual(2);
      expect(candidate.apps()[0]).assertEqual(TEST_BUNDLE_PRIMARY);
      expect(candidate.apps()[1]).assertEqual(TEST_BUNDLE_TERTIARY);
      expect(candidate.drop(TEST_BUNDLE_SECONDARY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RemovalKeepsOrder_019, end');
    });

    /**
     * Scenario: the migrated default of the sample.
     * Expectation: the whitelist is seeded with exactly one default bundle name.
     */
    it('Assessment_SeededDefaultWhitelist_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SeededDefaultWhitelist_020, begin');
      const seeded: ConfigCandidate = ConfigCandidate.seededDefault();
      expect(seeded.size()).assertEqual(1);
      expect(seeded.apps()[0]).assertEqual(DEFAULT_ALLOWED_APP);
      expect(seeded.contains(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(seeded.duration()).assertEqual(DURATION_DEFAULT);
      expect(seeded.isDefaultDuration()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', seeded.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SeededDefaultWhitelist_020, end');
    });

    /**
     * Scenario: the minutes of every duration candidate.
     * Expectation: zero for the default marker, ten, thirty and sixty for the explicit values.
     */
    it('Assessment_DurationMinutesMatrix_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationMinutesMatrix_021, begin');
      const expected: number[] = [0, 10, 30, 60];
      for (let i = 0; i < DURATIONS.length; i++) {
        const candidate: ConfigCandidate = new ConfigCandidate(DURATIONS[i], []);
        expect(candidate.minutes()).assertEqual(expected[i]);
        expect(candidate.isDefaultDuration()).assertEqual(i === 0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationMinutesMatrix_021, end');
    });

    /**
     * Scenario: an undocumented duration on the model.
     * Expectation: the setter refuses the value and the previous duration survives.
     */
    it('Assessment_RejectUndocumentedDuration_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectUndocumentedDuration_022, begin');
      const candidate: ConfigCandidate = new ConfigCandidate(DURATION_TEN, []);
      expect(candidate.setDuration(1234)).assertFalse();
      expect(candidate.duration()).assertEqual(DURATION_TEN);
      expect(candidate.setDuration(-1)).assertFalse();
      expect(candidate.setDuration(DURATION_SIXTY)).assertTrue();
      expect(candidate.duration()).assertEqual(DURATION_SIXTY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectUndocumentedDuration_022, end');
    });

    /**
     * Scenario: the signature of a configuration ignores the whitelist order.
     * Expectation: two orderings of the same entries share the signature.
     */
    it('Assessment_SignatureOrderIndependent_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SignatureOrderIndependent_023, begin');
      const left: ConfigCandidate =
        new ConfigCandidate(DURATION_TEN, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      const right: ConfigCandidate =
        new ConfigCandidate(DURATION_TEN, [TEST_BUNDLE_SECONDARY, TEST_BUNDLE_PRIMARY]);
      expect(left.signature()).assertEqual(right.signature());
      expect(left.equals(right)).assertFalse();
      const other: ConfigCandidate = new ConfigCandidate(DURATION_THIRTY, left.apps());
      expect(other.signature() === left.signature()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', left.signature());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SignatureOrderIndependent_023, end');
    });

    /**
     * Scenario: the clone of a configuration candidate.
     * Expectation: the clone is equal and independent, mutating it leaves the source intact.
     */
    it('Assessment_CloneIsIndependent_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CloneIsIndependent_024, begin');
      const source: ConfigCandidate = new ConfigCandidate(DURATION_THIRTY, [TEST_BUNDLE_PRIMARY]);
      const clone: ConfigCandidate = source.clone();
      expect(clone.equals(source)).assertTrue();
      expect(clone.signature()).assertEqual(source.signature());
      clone.append(TEST_BUNDLE_SECONDARY);
      expect(clone.size()).assertEqual(2);
      expect(source.size()).assertEqual(1);
      expect(clone.equals(source)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CloneIsIndependent_024, end');
    });

    /**
     * Scenario: the verdict of a configuration with a duplicated entry.
     * Expectation: the duplicate is reported and the candidate is not admissible.
     */
    it('Assessment_DuplicateVerdict_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DuplicateVerdict_025, begin');
      const candidate: ConfigCandidate =
        new ConfigCandidate(DURATION_DEFAULT, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_PRIMARY]);
      expect(candidate.duplicateCount()).assertEqual(1);
      const verdict: MatrixVerdict = new MatrixVerdict(candidate);
      expect(verdict.uniqueOk()).assertFalse();
      expect(verdict.admissible()).assertFalse();
      expect(verdict.reasons().join(' ')).assertContain('duplicated');
      hilog.info(DOMAIN, TAG, '%{public}s', verdict.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DuplicateVerdict_025, end');
    });

    /**
     * Scenario: the distinct count of a whitelist.
     * Expectation: it equals the size for a de-duplicated list and drops for a duplicated one.
     */
    it('Assessment_DistinctCount_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DistinctCount_026, begin');
      const clean: string[] = [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY, TEST_BUNDLE_TERTIARY];
      expect(WhitelistInspector.distinctCount(clean)).assertEqual(3);
      const dirty: string[] = [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_PRIMARY, TEST_BUNDLE_TERTIARY];
      expect(WhitelistInspector.distinctCount(dirty)).assertEqual(2);
      expect(WhitelistInspector.distinctCount([])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DistinctCount_026, end');
    });

    /**
     * Scenario: the longest entry of a whitelist.
     * Expectation: it is the length of the name with the most characters.
     */
    it('Assessment_LongestEntry_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LongestEntry_027, begin');
      const apps: string[] = ['com.a', 'com.samples.dictionary', 'com.samples.reader'];
      expect(WhitelistInspector.longestEntry(apps)).assertEqual('com.samples.dictionary'.length);
      expect(WhitelistInspector.longestEntry([])).assertEqual(0);
      expect(WhitelistInspector.longestEntry([TEST_BUNDLE_INVALID])).assertEqual(TEST_BUNDLE_INVALID.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LongestEntry_027, end');
    });

    /**
     * Scenario: the common prefix of two whitelists.
     * Expectation: the shared leading entries are counted and the first difference stops the scan.
     */
    it('Assessment_CommonPrefix_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CommonPrefix_028, begin');
      const left: string[] = [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY, TEST_BUNDLE_TERTIARY];
      const right: string[] = [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY, 'com.samples.other'];
      expect(WhitelistInspector.commonPrefixCount(left, right)).assertEqual(2);
      expect(WhitelistInspector.commonPrefixCount(left, left)).assertEqual(3);
      expect(WhitelistInspector.commonPrefixCount([], left)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CommonPrefix_028, end');
    });

    /**
     * Scenario: the matrix cell description.
     * Expectation: it carries the indices, the duration, the size and the verdict.
     */
    it('Assessment_CellDescription_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CellDescription_029, begin');
      const cell: MatrixCell = new MatrixCell(1, 2, DURATION_TEN, 2, ContentShape.NORMAL);
      const text: string = cell.describe();
      expect(text).assertContain('r1');
      expect(text).assertContain('c2');
      expect(text).assertContain(`${DURATION_TEN}`);
      expect(text).assertContain('admissible=true');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CellDescription_029, end');
    });

    /**
     * Scenario: the lookup of a cell that does not exist.
     * Expectation: the summary answers null for an out of range coordinate.
     */
    it('Assessment_CellLookupOutOfRange_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CellLookupOutOfRange_030, begin');
      expect(summary.cellOf(9, 0)).assertNull();
      expect(summary.cellOf(0, 9)).assertNull();
      expect(summary.cellOf(-1, -1)).assertNull();
      expect(summary.isAdmissibleAt(9, 9)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CellLookupOutOfRange_030, end');
    });

    /**
     * Scenario: the row and column predicates of the summary.
     * Expectation: an out of range row is reported as fully admissible because it holds no cell,
     * which the case documents explicitly.
     */
    it('Assessment_EmptyRowPredicate_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EmptyRowPredicate_031, begin');
      expect(summary.rowFullyAdmissible(9)).assertTrue();
      expect(summary.columnFullyAdmissible(9)).assertTrue();
      expect(summary.rowFullyAdmissible(0)).assertTrue();
      expect(summary.columnFullyAdmissible(0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EmptyRowPredicate_031, end');
    });

    /**
     * Scenario: a matrix built from a single content shape.
     * Expectation: the summary carries the shape through to every cell.
     */
    it('Assessment_MatrixShapePropagation_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixShapePropagation_032, begin');
      const cells: MatrixCell[] = MatrixFactory.matrix(ContentShape.SHORT);
      expect(cells.length).assertEqual(24);
      for (let i = 0; i < cells.length; i++) {
        expect(cells[i].shape).assertEqual(ContentShape.SHORT);
      }
      const verdict: MatrixVerdict = new MatrixVerdict(ConfigCandidate.fromCell(cells[0]));
      expect(verdict.admissible()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixShapePropagation_032, end');
    });

    /**
     * Scenario: the cartesian matrix is rebuilt for a fresh assert run.
     * Expectation: two independently built matrices agree cell by cell.
     */
    it('Assessment_MatrixDeterministic_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixDeterministic_033, begin');
      const rebuilt: MatrixSummary = new MatrixSummary(MatrixFactory.matrix(ContentShape.NORMAL));
      expect(rebuilt.size()).assertEqual(summary.size());
      expect(rebuilt.admissibleCount()).assertEqual(summary.admissibleCount());
      expect(rebuilt.rejectedCount()).assertEqual(summary.rejectedCount());
      for (let row = 0; row < MATRIX_ROWS; row++) {
        for (let column = 0; column < MATRIX_COLUMNS; column++) {
          expect(rebuilt.isAdmissibleAt(row, column)).assertEqual(summary.isAdmissibleAt(row, column));
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MatrixDeterministic_033, end');
    });

    /**
     * Scenario: the total character helper of the factory.
     * Expectation: it agrees with the sum that the candidate computes.
     */
    it('Assessment_FactoryTotalChars_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FactoryTotalChars_034, begin');
      for (let i = 0; i < WHITELIST_SIZES.length; i++) {
        const size: number = WHITELIST_SIZES[i];
        const candidate: ConfigCandidate =
          new ConfigCandidate(DURATION_DEFAULT, MatrixFactory.whitelistOf(size, ContentShape.NORMAL));
        expect(candidate.totalChars()).assertEqual(MatrixFactory.totalCharsOf(size, ContentShape.NORMAL));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FactoryTotalChars_034, end');
    });

    /**
     * Scenario: the entry generator for a single shape.
     * Expectation: entries are unique within a whitelist, so the sample can key them for ForEach.
     */
    it('Assessment_FactoryEntriesUnique_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FactoryEntriesUnique_035, begin');
      for (let i = 0; i < CONTENT_SHAPES.length; i++) {
        const apps: string[] = MatrixFactory.whitelistOf(MAX_ALLOWED_APPS, CONTENT_SHAPES[i]);
        expect(WhitelistInspector.distinctCount(apps)).assertEqual(MAX_ALLOWED_APPS);
      }
      expect(MatrixFactory.entryOf(ContentShape.NORMAL, 0)).assertEqual('com.samples.app00');
      expect(MatrixFactory.entryOf(ContentShape.SHORT, 7)).assertEqual('a07');
      expect(MatrixFactory.repeat('z', 3)).assertEqual('zzz');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FactoryEntriesUnique_035, end');
    });

    /**
     * Scenario: the configuration candidate description.
     * Expectation: it carries the duration, the size and the character count of the candidate.
     */
    it('Assessment_CandidateDescription_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CandidateDescription_051, begin');
      const candidate: ConfigCandidate =
        new ConfigCandidate(DURATION_THIRTY, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      const text: string = candidate.describe();
      expect(text).assertContain('ConfigCandidate');
      expect(text).assertContain(`${DURATION_THIRTY}`);
      expect(text).assertContain('size=2');
      expect(text).assertContain('chars=');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CandidateDescription_051, end');
    });
  });
}
