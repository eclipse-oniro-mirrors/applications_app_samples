/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
import { Assert, beforeEach, describe, expect, Hypium, it } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AssertionObservation, LocalExpectService, observeAssertion } from '../AssertionObservation';
import { paceTurn } from '../TestPace';

interface CustomAssert extends Assert {
  myAssertEqual(expectValue: boolean): void;
}

interface CustomResult {
  pass: boolean;
  message: string;
}

function myAssertEqual(actualValue: boolean, expectValue: boolean): CustomResult {
  return {
    pass: actualValue === expectValue,
    message: actualValue === expectValue ? '' : 'expectValue !== actualValue!'
  };
}

export default function customAssertTest(): void {
  describe('customAssertTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitCustomAssertion0001
     * @tc.name testJsunitCustomAssertion0001
     * @tc.desc Exercise registered equality for both booleans and an actually rejected mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitCustomAssertion0001', 0, (): void => {
      try {
        Hypium.registerAssert(myAssertEqual);
        hilog.info(0x0000, 'CustomAssert', 'registered: true/true and false/false');
        (expect(true) as CustomAssert).myAssertEqual(true);
        hilog.info(0x0000, 'CustomAssert', 'myAssertEqual actual=false expected=false');
        (expect(false) as CustomAssert).myAssertEqual(false);
        const failure: AssertionObservation = observeAssertion((service: LocalExpectService): void => {
          hilog.info(0x0000, 'CustomAssert', 'myAssertEqual actual=true expected=false; mismatch must be rejected');
          (service.expect(true) as CustomAssert).myAssertEqual(false);
        });
        hilog.info(0x0000, 'CustomAssert', 'mismatch name=%{public}s message=%{public}s',
          failure.name, failure.message);
        expect(failure.name).assertEqual('AssertException');
        hilog.info(0x0000, 'CustomAssert', 'mismatch message=%{public}s', failure.message);
        expect(failure.message).assertEqual('expectValue !== actualValue!');
        hilog.info(0x0000, 'CustomAssert', 'mismatch reported=%{public}s expected=true', String(failure.reported));
        expect(failure.reported).assertTrue();
      } finally {
        Hypium.unregisterAssert(myAssertEqual);
      }
    });

    /**
     * @tc.number testJsunitUnregisteredAssertion0002
     * @tc.name testJsunitUnregisteredAssertion0002
     * @tc.desc Require an actual Error after unregister, even if the old matcher silently returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitUnregisteredAssertion0002', 0, (): void => {
      let threw: boolean = false;
      let message: string = '';
      let isError: boolean = false;
      try {
        Hypium.registerAssert(myAssertEqual);
        hilog.info(0x0000, 'CustomAssert', 'registered matcher before unregister');
        (expect(true) as CustomAssert).myAssertEqual(true);
        Hypium.unregisterAssert(myAssertEqual);
        try {
          hilog.info(0x0000, 'CustomAssert', 'unregistered myAssertEqual actual=true expected=true; must throw');
          (expect(true) as CustomAssert).myAssertEqual(true);
        } catch (error) {
          threw = true;
          isError = error instanceof Error;
          if (isError) {
            message = (error as Error).message;
          } else {
            throw new Error(String(error));
          }
        }
        hilog.info(0x0000, 'CustomAssert', 'unregistered threw=%{public}s message=%{public}s',
          String(threw), message);
        expect(threw).assertTrue();
        hilog.info(0x0000, 'CustomAssert', 'unregistered isError=%{public}s expected=true', String(isError));
        expect(isError).assertTrue();
        hilog.info(0x0000, 'CustomAssert', 'unregistered message=%{public}s', message);
        expect(message).assertEqual('myAssertEqual is unregistered');
      } finally {
        Hypium.unregisterAssert(myAssertEqual);
      }
    });
  });
}
