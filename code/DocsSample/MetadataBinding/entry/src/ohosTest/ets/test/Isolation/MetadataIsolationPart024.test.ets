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

export default function metadataIsolationPart024Test(): void {
  describe('metadataIsolationPart024Test', (): void => {
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_0100
     * @tc.name metadataIsolationPart024Test001
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then capture then capture then disappear; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.aboutToDisappear();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
        'submit|test.link',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_0200
     * @tc.name metadataIsolationPart024Test002
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then capture then capture then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_0300
     * @tc.name metadataIsolationPart024Test003
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then capture then capture then ignore; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(ignoredEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_0400
     * @tc.name metadataIsolationPart024Test004
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then capture then ignore then show; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(ignoredEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageShow();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_0500
     * @tc.name metadataIsolationPart024Test005
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then capture then ignore then hide; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(ignoredEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageHide();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_0600
     * @tc.name metadataIsolationPart024Test006
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then capture then ignore then disappear; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(ignoredEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.aboutToDisappear();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_0700
     * @tc.name metadataIsolationPart024Test007
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then capture then ignore then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(ignoredEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_0800
     * @tc.name metadataIsolationPart024Test008
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then ignore then show then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_0900
     * @tc.name metadataIsolationPart024Test009
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then ignore then hide then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.onPageHide();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_1000
     * @tc.name metadataIsolationPart024Test010
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then ignore then disappear then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.aboutToDisappear();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_1100
     * @tc.name metadataIsolationPart024Test011
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then ignore then capture then show; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageShow();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_1200
     * @tc.name metadataIsolationPart024Test012
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then ignore then capture then hide; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.onPageHide();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_1300
     * @tc.name metadataIsolationPart024Test013
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then ignore then capture then disappear; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.aboutToDisappear();
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_1400
     * @tc.name metadataIsolationPart024Test014
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then ignore then capture then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_1500
     * @tc.name metadataIsolationPart024Test015
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then show then ignore then capture then ignore; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.screenShotCallback(captureEvent);
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(ignoredEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_1600
     * @tc.name metadataIsolationPart024Test016
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then hide then show then show then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.onPageShow();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_1700
     * @tc.name metadataIsolationPart024Test017
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then hide then show then hide then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.onPageHide();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_024_1800
     * @tc.name metadataIsolationPart024Test018
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then hide then show then disappear then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart024Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      secondary.aboutToDisappear();
      const observedStep4: string[] = port.describeCalls();
      const expectedStep4: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep4).assertDeepEquals(expectedStep4);
      primary.screenShotCallback(captureEvent);
      const observedStep5: string[] = port.describeCalls();
      const expectedStep5: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
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
