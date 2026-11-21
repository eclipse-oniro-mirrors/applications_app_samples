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

import { expect } from '@ohos/hypium';
import { PlaybackPolicy } from '../../../../main/ets/model/PlaybackPolicy';
import { AVDataSource } from '../../../../main/ets/model/AVDataSource';
import { secondToTime } from '../../../../main/ets/common/utils/CommonUtils';
import { parsePlaybackClock } from './SharedDriver';
import { checkNotificationPlan } from './ModelFixture';

export class ClockVector {
  value: number;
  expected: string;
  seconds: number;

  constructor(value: number, expected: string, seconds: number) {
    this.value = value;
    this.expected = expected;
    this.seconds = seconds;
  }
}

export class SurfaceVector {
  videoWidth: number;
  videoHeight: number;
  width: number;
  height: number;
  expectedWidth: number;
  expectedHeight: number;

  constructor(videoWidth: number, videoHeight: number, width: number, height: number, expectedWidth: number, expectedHeight: number) {
    this.videoWidth = videoWidth;
    this.videoHeight = videoHeight;
    this.width = width;
    this.height = height;
    this.expectedWidth = expectedWidth;
    this.expectedHeight = expectedHeight;
  }
}

export class SeekVector {
  value: number;
  duration: number;
  maximum: number;
  expected: number;

  constructor(value: number, duration: number, maximum: number, expected: number) {
    this.value = value;
    this.duration = duration;
    this.maximum = maximum;
    this.expected = expected;
  }
}

export class ProgressVector {
  position: number;
  duration: number;
  maximum: number;
  expected: number;

  constructor(position: number, duration: number, maximum: number, expected: number) {
    this.position = position;
    this.duration = duration;
    this.maximum = maximum;
    this.expected = expected;
  }
}

export class CatalogVector {
  size: number;
  text: string;
  mode: number;
  readIndex: number;
  expectedItem: string;
  expectedFirst: string;
  expectedLast: string;

  constructor(size: number, text: string, mode: number, readIndex: number, expectedItem: string, expectedFirst: string, expectedLast: string) {
    this.size = size;
    this.text = text;
    this.mode = mode;
    this.readIndex = readIndex;
    this.expectedItem = expectedItem;
    this.expectedFirst = expectedFirst;
    this.expectedLast = expectedLast;
  }
}

export class NotificationVector {
  plan: string;
  index: number;
  left: string;
  right: string;

  constructor(plan: string, index: number, left: string, right: string) {
    this.plan = plan;
    this.index = index;
    this.left = left;
    this.right = right;
  }
}

export class ParserVector {
  text: string;
  expected: number;

  constructor(text: string, expected: number) {
    this.text = text;
    this.expected = expected;
  }
}

function assertNear(actual: number, expected: number): void {
  const tolerance = Math.max(0.000001, Math.abs(expected) * 0.000000001);
  expect(Math.abs(actual - expected) <= tolerance).assertTrue();
}

export function verifyClock(vector: ClockVector): void {
  const formatted = secondToTime(vector.value);
  expect(formatted).assertEqual(vector.expected);
  expect(parsePlaybackClock(formatted)).assertEqual(vector.seconds);
}

export function verifySurface(vector: SurfaceVector): void {
  const fitted = PlaybackPolicy.fitSurface(vector.videoWidth, vector.videoHeight, vector.width, vector.height);
  assertNear(fitted.width, vector.expectedWidth);
  assertNear(fitted.height, vector.expectedHeight);
  expect(fitted.width <= vector.width + 0.000001).assertTrue();
  expect(fitted.height <= vector.height + 0.000001).assertTrue();
  const rotated = PlaybackPolicy.fitSurface(vector.videoHeight, vector.videoWidth, vector.height, vector.width);
  assertNear(rotated.width, vector.expectedHeight);
  assertNear(rotated.height, vector.expectedWidth);
  const repeated = PlaybackPolicy.fitSurface(fitted.width, fitted.height, vector.width, vector.height);
  assertNear(repeated.width, fitted.width);
  assertNear(repeated.height, fitted.height);
}

export function verifySeek(vector: SeekVector): void {
  const actual = PlaybackPolicy.seekPosition(vector.value, vector.duration, vector.maximum);
  assertNear(actual, vector.expected);
  expect(actual >= 0).assertTrue();
  expect(actual <= vector.duration).assertTrue();
  const maximum = PlaybackPolicy.seekPosition(vector.maximum, vector.duration, vector.maximum);
  assertNear(maximum, vector.duration);
  const start = PlaybackPolicy.seekPosition(0, vector.duration, vector.maximum);
  expect(start).assertEqual(0);
}

export function verifyProgress(vector: ProgressVector): void {
  const actual = PlaybackPolicy.sliderPosition(vector.position, vector.duration, vector.maximum);
  expect(actual).assertEqual(vector.expected);
  expect(actual >= 0).assertTrue();
  expect(actual <= vector.maximum).assertTrue();
  const lower = PlaybackPolicy.seekPosition(actual, vector.duration, vector.maximum);
  const upper = PlaybackPolicy.seekPosition(actual + 1, vector.duration, vector.maximum);
  const bounded = Math.max(0, Math.min(vector.duration, vector.position));
  const tolerance = Math.max(0.000001, vector.duration * 0.000000001);
  expect(lower <= bounded + tolerance).assertTrue();
  expect(upper >= bounded - tolerance).assertTrue();
}

export function verifyCatalog(vector: CatalogVector): void {
  const input: string[] = [];
  for (let index = 0; index < vector.size; index++) {
    let item = vector.text;
    if (vector.mode === 0) {
      item += index.toString();
    } else if (vector.mode === 2) {
      item += (vector.size - index - 1).toString();
    } else if (vector.mode === 3) {
      item += (index % 2).toString();
    } else if (vector.mode === 4) {
      item += ((index + Math.floor(vector.size / 2)) % vector.size).toString();
    }
    input.push(item);
  }
  const expected = input.slice();
  const source = new AVDataSource(input);
  const sibling = new AVDataSource(input);
  input[0] = 'external mutation';
  input.splice(0, input.length);
  expect(source.totalCount()).assertEqual(vector.size);
  expect(sibling.totalCount()).assertEqual(vector.size);
  expect(source.getData(0)).assertEqual(vector.expectedFirst);
  expect(source.getData(vector.size - 1)).assertEqual(vector.expectedLast);
  expect(source.getData(vector.readIndex)).assertEqual(vector.expectedItem);
  for (let index = 0; index < expected.length; index++) {
    expect(source.getData(index)).assertEqual(expected[index]);
    expect(sibling.getData(index)).assertEqual(expected[index]);
  }
  expect(source.getData(-1)).assertEqual(undefined);
  expect(source.getData(vector.size)).assertEqual(undefined);
  expect(source.getData(vector.size + 1)).assertEqual(undefined);
  source.dataArray[0] = 'first instance changed';
  expect(sibling.getData(0)).assertEqual(vector.expectedFirst);
  const snapshot = source.totalCount();
  source.addData(vector.readIndex);
  expect(source.totalCount()).assertEqual(snapshot);
  expect(source.getData(0)).assertEqual('first instance changed');
}

export function verifyNotification(vector: NotificationVector): void {
  checkNotificationPlan(vector.plan, vector.index, vector.left, vector.right);
}

export function verifyParser(vector: ParserVector): void {
  expect(parsePlaybackClock(vector.text)).assertEqual(vector.expected);
}
