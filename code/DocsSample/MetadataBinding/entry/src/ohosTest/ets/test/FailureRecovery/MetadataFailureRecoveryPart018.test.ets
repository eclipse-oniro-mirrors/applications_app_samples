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

import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  TestType,
  Size,
  Level
} from '@ohos/hypium';
import MetadataBindingController from '../../../../main/ets/model/MetadataBindingController';
import { RecordingMetadataPort } from '../Shared/SharedDriver';
import { BusinessError } from '@kit.BasicServicesKit';

export default function metadataFailureRecoveryPart018Test(): void {
  describe('metadataFailureRecoveryPart018Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      const yieldDelayMs: number = 30;
      await new Promise<void>((resolve): void => {
        setTimeout((): void => {
          resolve();
        }, yieldDelayMs);
      });
    });
    afterEach((): void => {});
    afterAll((): void => {});
    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_0100
     * @tc.name metadataFailureRecoveryPart018Test001
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then capture then hide then hide; injected code 32100005 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('off', 32100005);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.onPageHide();
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100005;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageHide();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_0200
     * @tc.name metadataFailureRecoveryPart018Test002
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then capture then disappear then disappear; injected code 32100005 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('off', 32100005);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.aboutToDisappear();
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100005;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.aboutToDisappear();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_0300
     * @tc.name metadataFailureRecoveryPart018Test003
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then capture then capture then capture; injected code 32100001 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('submit', 32100001);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.screenShotCallback(captureEvent);
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100001;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_0400
     * @tc.name metadataFailureRecoveryPart018Test004
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then ignore then show then show; injected code 32100004 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      const ignoredEvent: number = 0;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('on', 32100004);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.onPageShow();
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100004;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageShow();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_0500
     * @tc.name metadataFailureRecoveryPart018Test005
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then ignore then hide then hide; injected code 32100005 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      const ignoredEvent: number = 0;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('off', 32100005);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.onPageHide();
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100005;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageHide();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_0600
     * @tc.name metadataFailureRecoveryPart018Test006
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then ignore then disappear then disappear; injected code 32100005 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      const ignoredEvent: number = 0;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('off', 32100005);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.aboutToDisappear();
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100005;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.aboutToDisappear();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_0700
     * @tc.name metadataFailureRecoveryPart018Test007
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then ignore then capture then capture; injected code 32100001 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      const ignoredEvent: number = 0;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('submit', 32100001);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.screenShotCallback(captureEvent);
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100001;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_0800
     * @tc.name metadataFailureRecoveryPart018Test008
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then show then show then show; injected code 32100004 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('on', 32100004);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.onPageShow();
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100004;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageShow();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_0900
     * @tc.name metadataFailureRecoveryPart018Test009
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then show then hide then hide; injected code 32100005 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('off', 32100005);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.onPageHide();
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100005;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageHide();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_1000
     * @tc.name metadataFailureRecoveryPart018Test010
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then show then disappear then disappear; injected code 32100005 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('off', 32100005);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.aboutToDisappear();
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100005;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.aboutToDisappear();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_1100
     * @tc.name metadataFailureRecoveryPart018Test011
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then show then capture then capture; injected code 32100001 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('submit', 32100001);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.screenShotCallback(captureEvent);
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100001;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_1200
     * @tc.name metadataFailureRecoveryPart018Test012
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then hide then show then show; injected code 32100004 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('on', 32100004);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.onPageShow();
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100004;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageShow();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_018_1300
     * @tc.name metadataFailureRecoveryPart018Test013
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then disappear then show then show; injected code 32100004 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart018Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.screenShotCallback(captureEvent);
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'submit|test.link',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      port.failNext('on', 32100004);
      let caughtName: string = '';
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        primary.onPageShow();
      } catch (error) {
        const serviceError = error as BusinessError;
        caughtName = serviceError.name;
        caughtCode = serviceError.code;
        caughtMessage = serviceError.message;
      }
      const expectedName: string = 'BusinessError';
      const expectedCode: number = 32100004;
      const expectedMessage: string = 'Injected metadata service failure';
      expect(caughtName).assertEqual(expectedName);
      expect(caughtCode).assertEqual(expectedCode);
      expect(caughtMessage).assertEqual(expectedMessage);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageShow();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

  });
}
