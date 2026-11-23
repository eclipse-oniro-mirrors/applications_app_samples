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
import { Assert, Core } from '@ohos/hypium';

// Hypium records a failed assertion before throwing it. Use a separate record so the
// negative demonstration cannot mark the containing case failed; restore the real record in finally.
class AssertionRecord {
  fail: Error | null = null;
  expectMsg: string = '';
}

interface SpecSelection {
  getCurrentRunningSpec(): AssertionRecord;
  setCurrentRunningSpec(spec: AssertionRecord): void;
}

export interface LocalExpectService {
  expect(value?: Object | null): Assert;
}

export class AssertionObservation {
  name: string = '';
  message: string = '';
  reported: boolean = false;
  userMessage: string = '';
}

export function observeAssertion(action: (localExpect: LocalExpectService) => void): AssertionObservation {
  const core: Core = Core.getInstance();
  const selection: SpecSelection = core.getDefaultService('spec') as SpecSelection;
  const expectService: LocalExpectService = core.getDefaultService('expect') as LocalExpectService;
  const original: AssertionRecord = selection.getCurrentRunningSpec();
  const isolated: AssertionRecord = new AssertionRecord();
  const observation: AssertionObservation = new AssertionObservation();
  selection.setCurrentRunningSpec(isolated);
  try {
    action(expectService);
  } catch (error) {
    const caught: Error = error as Error;
    // Only an expected, actually recorded Hypium assertion may be observed here.
    if (!(caught instanceof Error) || caught.name !== 'AssertException' || isolated.fail !== caught) {
      throw caught instanceof Error ? caught : new Error(String(caught));
    }
    observation.name = caught.name;
    observation.message = caught.message;
    observation.reported = isolated.fail === caught;
    observation.userMessage = isolated.expectMsg;
  } finally {
    selection.setCurrentRunningSpec(original);
  }
  return observation;
}
