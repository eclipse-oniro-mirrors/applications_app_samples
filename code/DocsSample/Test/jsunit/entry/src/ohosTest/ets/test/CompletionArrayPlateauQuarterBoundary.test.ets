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
import { beforeEach, describe, it } from '@ohos/hypium';
import { ArrayRow, runArrayRows } from './AssertionCompletionSupport';
import { paceTurn } from './TestPace';

async function runAssertion0073(): Promise<void> {
  const rows: ArrayRow[] = [
    {
      label: 'HeadValueCopy',
      matcher: 'assertDeepEquals',
      negate: false,
      passed: true,
      actual: [
        -1.75,
        -1.75,
        -1.75,
        -1.75,
        -1.75,
        -1.75,
        -1.75,
        -1.5,
        -1.5,
        -1.5,
        -1.5,
        -1.5,
        -1.5,
        -1.5,
        -1.25,
        -1.25,
        -1.25,
        -1.25,
        -1.25,
        -1.25,
        -1.25,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -0.75,
        -0.75,
        -0.75,
        -0.75,
        -0.75,
        -0.75,
        -0.75,
        -0.5,
        -0.5,
        -0.5,
