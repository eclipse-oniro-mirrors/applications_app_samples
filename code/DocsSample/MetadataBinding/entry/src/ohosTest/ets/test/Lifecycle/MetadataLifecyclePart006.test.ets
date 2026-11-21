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

export default function metadataLifecyclePart006Test(): void {
  describe('metadataLifecyclePart006Test', (): void => {
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_0100
     * @tc.name metadataLifecyclePart006Test001
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then show then show
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_0200
     * @tc.name metadataLifecyclePart006Test002
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then show then hide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageHide();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_0300
     * @tc.name metadataLifecyclePart006Test003
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then show then disappear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.aboutToDisappear();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_0400
     * @tc.name metadataLifecyclePart006Test004
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then show then capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_0500
     * @tc.name metadataLifecyclePart006Test005
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then show then ignore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(ignoredEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_0600
     * @tc.name metadataLifecyclePart006Test006
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then hide then show
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_0700
     * @tc.name metadataLifecyclePart006Test007
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then hide then hide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageHide();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_0800
     * @tc.name metadataLifecyclePart006Test008
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then hide then disappear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.aboutToDisappear();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_0900
     * @tc.name metadataLifecyclePart006Test009
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then hide then capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_1000
     * @tc.name metadataLifecyclePart006Test010
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then hide then ignore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(ignoredEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_1100
     * @tc.name metadataLifecyclePart006Test011
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then disappear then show
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_1200
     * @tc.name metadataLifecyclePart006Test012
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then disappear then hide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageHide();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_1300
     * @tc.name metadataLifecyclePart006Test013
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then disappear then disappear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.aboutToDisappear();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_1400
     * @tc.name metadataLifecyclePart006Test014
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then disappear then capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_1500
     * @tc.name metadataLifecyclePart006Test015
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then disappear then ignore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(ignoredEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_006_1600
     * @tc.name metadataLifecyclePart006Test016
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then capture then show
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart006Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

  });
}
