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

export default function metadataLifecyclePart014Test(): void {
  describe('metadataLifecyclePart014Test', (): void => {
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_0100
     * @tc.name metadataLifecyclePart014Test001
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then capture then capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_0200
     * @tc.name metadataLifecyclePart014Test002
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then capture then ignore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.screenShotCallback(ignoredEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_0300
     * @tc.name metadataLifecyclePart014Test003
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then ignore then show
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_0400
     * @tc.name metadataLifecyclePart014Test004
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then ignore then hide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageHide();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_0500
     * @tc.name metadataLifecyclePart014Test005
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then ignore then disappear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.aboutToDisappear();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_0600
     * @tc.name metadataLifecyclePart014Test006
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then ignore then capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_0700
     * @tc.name metadataLifecyclePart014Test007
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then show then show
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_0800
     * @tc.name metadataLifecyclePart014Test008
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then show then hide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageHide();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_0900
     * @tc.name metadataLifecyclePart014Test009
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then show then disappear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.aboutToDisappear();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_1000
     * @tc.name metadataLifecyclePart014Test010
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then show then capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_1100
     * @tc.name metadataLifecyclePart014Test011
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then show then ignore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(ignoredEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_1200
     * @tc.name metadataLifecyclePart014Test012
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then hide then show
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_1300
     * @tc.name metadataLifecyclePart014Test013
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then disappear then show
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_1400
     * @tc.name metadataLifecyclePart014Test014
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then capture then show
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
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
     * @tc.number SUB_METADATA_BINDING_LIFECYCLE_014_1500
     * @tc.name metadataLifecyclePart014Test015
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then ignore then show
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataLifecyclePart014Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      primary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      primary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
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

  });
}
