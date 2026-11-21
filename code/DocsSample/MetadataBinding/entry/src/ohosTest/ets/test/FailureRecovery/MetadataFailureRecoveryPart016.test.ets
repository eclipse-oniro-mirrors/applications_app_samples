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

export default function metadataFailureRecoveryPart016Test(): void {
  describe('metadataFailureRecoveryPart016Test', (): void => {
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
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_016_0100
     * @tc.name metadataFailureRecoveryPart016Test001
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: disappear then ignore then capture then show then show; injected code 32100004 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart016Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      const ignoredEvent: number = 0;
      primary.aboutToDisappear();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      primary.screenShotCallback(ignoredEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
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
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageShow();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
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
     * @tc.number SUB_METADATA_BINDING_FAILURERECOVERY_016_0200
     * @tc.name metadataFailureRecoveryPart016Test002
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then show then show then show; injected code 32100004 at step 4 must propagate before retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataFailureRecoveryPart016Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
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
