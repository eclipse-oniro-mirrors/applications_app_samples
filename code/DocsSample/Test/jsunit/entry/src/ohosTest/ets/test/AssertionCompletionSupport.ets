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
import { Assert, Core, expect } from '@ohos/hypium';
import { AssertionObservation, LocalExpectService, observeAssertion } from './AssertionObservation';
import { paceTurn } from './TestPace';

export interface ExpectedRow {
  label: string;
  matcher: string;
  negate: boolean;
  passed: boolean;
  message: string;
}

export interface NumericRow extends ExpectedRow {
  actual: number;
  expected: number;
}

export interface StringRow extends ExpectedRow {
  actual: string;
  expected: string;
}

export interface ArrayRow extends ExpectedRow {
  actual: number[];
  expected: number[];
}

interface RunningRecord {
  fail: Error | null | undefined;
  expectMsg: string | undefined;
}

interface RunningSelection {
  getCurrentRunningSpec(): RunningRecord;
}

function applyNumeric(local: LocalExpectService, row: NumericRow): void {
  let assertion: Assert = local.expect(row.actual).message(row.label);
  if (row.negate) {
    assertion = assertion.not();
  }
  switch (row.matcher) {
    case 'assertEqual':
      assertion.assertEqual(row.expected);
      break;
    case 'assertLarger':
      assertion.assertLarger(row.expected);
      break;
    case 'assertLess':
      assertion.assertLess(row.expected);
      break;
    case 'assertLargerOrEqual':
      assertion.assertLargerOrEqual(row.expected);
      break;
    case 'assertLessOrEqual':
      assertion.assertLessOrEqual(row.expected);
      break;
    default:
      throw new Error('Unsupported numeric matcher: ' + row.matcher);
  }
}

function verifyRow(selection: RunningSelection, original: RunningRecord,
  failure: Error | null | undefined, userMessage: string | undefined,
  row: ExpectedRow, observed: AssertionObservation,
  recover: (local: LocalExpectService) => void): void {
  console.info('[AssertionCompletion] ' + row.label + ' name=' + observed.name + ' passed=' + row.passed);
  expect(observed.name).assertEqual(row.passed ? '' : 'AssertException');
  console.info('[AssertionCompletion] ' + row.label + ' reported=' + observed.reported + ' passed=' + row.passed);
  expect(observed.reported).assertEqual(!row.passed);
  console.info('[AssertionCompletion] ' + row.label + ' message=' + observed.message + ' expected=' + row.message);
  expect(observed.message).assertEqual(row.message);
  console.info('[AssertionCompletion] ' + row.label + ' userMessage=' + observed.userMessage);
  expect(observed.userMessage).assertEqual(row.passed ? '' : row.label);
  console.info('[AssertionCompletion] ' + row.label + ' original selected=' +
    (selection.getCurrentRunningSpec() === original));
  expect(selection.getCurrentRunningSpec()).assertEqual(original);
  console.info('[AssertionCompletion] clean probe after ' + row.label);
  const clean: AssertionObservation = observeAssertion(recover);
  console.info('[AssertionCompletion] ' + row.label + ' clean name=' + clean.name);
  expect(clean.name).assertEqual('');
  console.info('[AssertionCompletion] ' + row.label + ' clean reported=' + clean.reported);
  expect(clean.reported).assertEqual(false);
  console.info('[AssertionCompletion] ' + row.label + ' clean message=' + clean.message);
  expect(clean.message).assertEqual('');
  console.info('[AssertionCompletion] ' + row.label + ' clean userMessage=' + clean.userMessage);
  expect(clean.userMessage).assertEqual('');
  console.info('[AssertionCompletion] ' + row.label + ' restored selection=' +
    (selection.getCurrentRunningSpec() === original) + ' failure=' + (original.fail === failure) +
    ' userMessage=' + (original.expectMsg === userMessage));
  expect(selection.getCurrentRunningSpec() === original && original.fail === failure &&
    original.expectMsg === userMessage).assertTrue();
}

export async function runNumericRows(rows: NumericRow[]): Promise<void> {
  const selection: RunningSelection = Core.getInstance().getDefaultService('spec') as RunningSelection;
  const original: RunningRecord = selection.getCurrentRunningSpec();
  const failure: Error | null | undefined = original.fail;
  const userMessage: string | undefined = original.expectMsg;
  let groupCount: number = 0;
  for (const row of rows) {
    console.info('[AssertionCompletion] numeric begin ' + row.label + ' ' + row.matcher +
      ' not=' + row.negate + ' actual=' + row.actual + ' expected=' + row.expected);
    const observed: AssertionObservation = observeAssertion((local: LocalExpectService): void => {
      applyNumeric(local, row);
    });
    verifyRow(selection, original, failure, userMessage, row, observed,
      (local: LocalExpectService): void => {
        local.expect(0.125).assertLessOrEqual(0.25);
      });
    groupCount++;
    if (groupCount === 16) {
      await paceTurn();
      groupCount = 0;
    }
  }
}

export async function runStringRows(rows: StringRow[]): Promise<void> {
  const selection: RunningSelection = Core.getInstance().getDefaultService('spec') as RunningSelection;
  const original: RunningRecord = selection.getCurrentRunningSpec();
  const failure: Error | null | undefined = original.fail;
  const userMessage: string | undefined = original.expectMsg;
  let groupCount: number = 0;
  for (const row of rows) {
    console.info('[AssertionCompletion] string begin ' + row.label + ' actual=' + JSON.stringify(row.actual) +
      ' expected=' + JSON.stringify(row.expected) + ' not=' + row.negate);
    const observed: AssertionObservation = observeAssertion((local: LocalExpectService): void => {
      let assertion: Assert = local.expect(row.actual).message(row.label);
      if (row.negate) {
        assertion = assertion.not();
      }
      assertion.assertEqual(row.expected);
    });
    verifyRow(selection, original, failure, userMessage, row, observed,
      (local: LocalExpectService): void => {
        local.expect('restored').not().assertEqual('recorded');
      });
    groupCount++;
    if (groupCount === 16) {
      await paceTurn();
      groupCount = 0;
    }
  }
}

export async function runArrayRows(rows: ArrayRow[]): Promise<void> {
  const selection: RunningSelection = Core.getInstance().getDefaultService('spec') as RunningSelection;
  const original: RunningRecord = selection.getCurrentRunningSpec();
  const failure: Error | null | undefined = original.fail;
  const userMessage: string | undefined = original.expectMsg;
  let groupCount: number = 0;
  for (const row of rows) {
    console.info('[AssertionCompletion] array begin ' + row.label + ' actual=' + JSON.stringify(row.actual) +
      ' expected=' + JSON.stringify(row.expected) + ' not=' + row.negate);
    const observed: AssertionObservation = observeAssertion((local: LocalExpectService): void => {
      let assertion: Assert = local.expect(row.actual).message(row.label);
      if (row.negate) {
        assertion = assertion.not();
      }
      assertion.assertDeepEquals(row.expected);
    });
    verifyRow(selection, original, failure, userMessage, row, observed,
      (local: LocalExpectService): void => {
        local.expect([0.25, -0.5, 0]).assertDeepEquals([0.25, -0.5, 0]);
      });
    groupCount++;
    if (groupCount === 16) {
      await paceTurn();
      groupCount = 0;
    }
  }
}
