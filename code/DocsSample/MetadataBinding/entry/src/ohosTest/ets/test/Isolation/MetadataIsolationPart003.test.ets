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

export default function metadataIsolationPart003Test(): void {
  describe('metadataIsolationPart003Test', (): void => {
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
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_0100
     * @tc.name metadataIsolationPart003Test001
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then hide; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.screenShotCallback(captureEvent);
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
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_0200
     * @tc.name metadataIsolationPart003Test002
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then disappear; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.screenShotCallback(captureEvent);
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
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_0300
     * @tc.name metadataIsolationPart003Test003
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.screenShotCallback(captureEvent);
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
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_0400
     * @tc.name metadataIsolationPart003Test004
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then capture then ignore; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_0500
     * @tc.name metadataIsolationPart003Test005
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: show then ignore then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.screenShotCallback(ignoredEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'on|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_0600
     * @tc.name metadataIsolationPart003Test006
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: hide then show then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.onPageHide();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_0700
     * @tc.name metadataIsolationPart003Test007
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: hide then capture then show; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.onPageHide();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      secondary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|primary',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_0800
     * @tc.name metadataIsolationPart003Test008
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: disappear then show then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.aboutToDisappear();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_0900
     * @tc.name metadataIsolationPart003Test009
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: disappear then capture then show; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const primary = new MetadataBindingController(port);
      const secondary = new MetadataBindingController(port);
      const primaryCallback = primary.screenShotCallback;
      const secondaryCallback = secondary.screenShotCallback;
      port.bindCallbacks(primaryCallback, secondaryCallback);
      const captureEvent: number = 1;
      primary.aboutToDisappear();
      const observedStep1: string[] = port.describeCalls();
      const expectedStep1: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep1).assertDeepEquals(expectedStep1);
      secondary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_1000
     * @tc.name metadataIsolationPart003Test010
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then show; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_1100
     * @tc.name metadataIsolationPart003Test011
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then hide; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageHide();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'off|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_1200
     * @tc.name metadataIsolationPart003Test012
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then disappear; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.aboutToDisappear();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_1300
     * @tc.name metadataIsolationPart003Test013
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then capture; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(captureEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
        'submit|test.link',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_1400
     * @tc.name metadataIsolationPart003Test014
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then show then ignore; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageShow();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.screenShotCallback(ignoredEvent);
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_1500
     * @tc.name metadataIsolationPart003Test015
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then hide then show; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.onPageHide();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|secondary',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_1600
     * @tc.name metadataIsolationPart003Test016
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then disappear then show; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.aboutToDisappear();
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'off|operationSubmitMetadata|com.example.boomerang|none',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ISOLATION_003_1700
     * @tc.name metadataIsolationPart003Test017
     * @tc.desc Verify onPageShow/onPageHide/aboutToDisappear/screenShotCallback ordered contract: capture then capture then show; alternate controller instances without exchanging callback identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataIsolationPart003Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      secondary.screenShotCallback(captureEvent);
      const observedStep2: string[] = port.describeCalls();
      const expectedStep2: string[] = [
        'submit|test.link',
        'submit|test.link',
      ];
      expect(observedStep2).assertDeepEquals(expectedStep2);
      primary.onPageShow();
      const observedStep3: string[] = port.describeCalls();
      const expectedStep3: string[] = [
        'submit|test.link',
        'submit|test.link',
        'on|operationSubmitMetadata|com.example.boomerang|primary',
      ];
      expect(observedStep3).assertDeepEquals(expectedStep3);
      const primaryIdentityStable: boolean = primary.screenShotCallback === primaryCallback;
      const secondaryIdentityStable: boolean = secondary.screenShotCallback === secondaryCallback;
      const callbacksIndependent: boolean = primaryCallback !== secondaryCallback;
      expect(primaryIdentityStable).assertTrue();
      expect(secondaryIdentityStable).assertTrue();
      expect(callbacksIndependent).assertTrue();
    });

  });
}
