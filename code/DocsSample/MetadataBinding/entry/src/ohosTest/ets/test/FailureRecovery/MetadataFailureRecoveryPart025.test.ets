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

export default function metadataFailureRecoveryPart025Test(): void {
  describe('metadataFailureRecoveryPart025Test', (): void => {
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
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_025_0100
     * @tc.name metadataFailureRecoveryPart025Test001
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then hide then capture then hide then hide; injected code 32100005 at step 5 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart025Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.onPageShow();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
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
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      primary.onPageHide();
      const observedStep6: string[] = port.describeCalls();
      const expectedStep6: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep6).assertDeepEquals(expectedStep6);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_025_0200
     * @tc.name metadataFailureRecoveryPart025Test002
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then hide then capture then disappear then disappear; injected code 32100005 at step 5 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart025Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.onPageShow();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
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
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      primary.aboutToDisappear();
      const observedStep6: string[] = port.describeCalls();
      const expectedStep6: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep6).assertDeepEquals(expectedStep6);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_025_0300
     * @tc.name metadataFailureRecoveryPart025Test003
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then hide then capture then capture then capture; injected code 32100001 at step 5 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart025Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.onPageShow();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
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
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      primary.screenShotCallback(captureEvent);
      const observedStep6: string[] = port.describeCalls();
      const expectedStep6: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep6).assertDeepEquals(expectedStep6);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_025_0400
     * @tc.name metadataFailureRecoveryPart025Test004
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then hide then ignore then capture then capture; injected code 32100001 at step 5 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart025Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      const ignoredEvent: number = 0;
      primary.onPageShow();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(ignoredEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
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
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      primary.screenShotCallback(captureEvent);
      const observedStep6: string[] = port.describeCalls();
      const expectedStep6: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep6).assertDeepEquals(expectedStep6);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_025_0500
     * @tc.name metadataFailureRecoveryPart025Test005
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then disappear then show then capture then capture; injected code 32100001 at step 5 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart025Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.onPageShow();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
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
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      primary.screenShotCallback(captureEvent);
      const observedStep6: string[] = port.describeCalls();
      const expectedStep6: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep6).assertDeepEquals(expectedStep6);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_025_0600
     * @tc.name metadataFailureRecoveryPart025Test006
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then disappear then hide then capture then capture; injected code 32100001 at step 5 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart025Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.onPageShow();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageHide();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
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
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      primary.screenShotCallback(captureEvent);
      const observedStep6: string[] = port.describeCalls();
      const expectedStep6: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep6).assertDeepEquals(expectedStep6);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_025_0700
     * @tc.name metadataFailureRecoveryPart025Test007
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then disappear then disappear then capture then capture; injected code 32100001 at step 5 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart025Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.onPageShow();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.aboutToDisappear();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
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
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      primary.screenShotCallback(captureEvent);
      const observedStep6: string[] = port.describeCalls();
      const expectedStep6: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep6).assertDeepEquals(expectedStep6);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_025_0800
     * @tc.name metadataFailureRecoveryPart025Test008
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then disappear then capture then show then show; injected code 32100004 at step 5 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart025Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.onPageShow();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
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
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep5).assertDeepEquals(expectedStep5);
      primary.onPageShow();
      const observedStep6: string[] = port.describeCalls();
      const expectedStep6: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep6).assertDeepEquals(expectedStep6);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

  });
}
