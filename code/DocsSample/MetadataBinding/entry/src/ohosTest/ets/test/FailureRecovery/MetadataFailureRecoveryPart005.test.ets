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

export default function metadataFailureRecoveryPart005Test(): void {
  describe('metadataFailureRecoveryPart005Test', (): void => {
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
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_005_0100
     * @tc.name metadataFailureRecoveryPart005Test001
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then hide then capture then hide then hide; injected code 32100005 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart005Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageHide();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_005_0200
     * @tc.name metadataFailureRecoveryPart005Test002
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then hide then capture then disappear then disappear; injected code 32100005 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart005Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.aboutToDisappear();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_005_0300
     * @tc.name metadataFailureRecoveryPart005Test003
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then hide then capture then capture then capture; injected code 32100001 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart005Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_005_0400
     * @tc.name metadataFailureRecoveryPart005Test004
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then hide then ignore then capture then capture; injected code 32100001 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart005Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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

  });
}
